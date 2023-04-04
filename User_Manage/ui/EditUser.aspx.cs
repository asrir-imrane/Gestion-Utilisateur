using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity.Validation;
using System.Diagnostics;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web.Helpers;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using User_Manage.Models;
using User_Manage.Services;
using static System.Net.Mime.MediaTypeNames;

namespace User_Manage.ui
{
    public partial class EditUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            using (var context = new UtilisateurContext())
            {
                // Get the data for the dropdown lists from the database
                var roles = context.Role.ToList();
                var autorisations = context.Autorisation.ToList();
                var applications = context.Application.ToList();

                // Bind the data to the dropdown lists
                _Roles.DataSource = roles;
                _Roles.DataTextField = "nom_role";
                _Roles.DataValueField = "id_role";
                _Roles.DataBind();

                _Autorisations.DataSource = autorisations;
                _Autorisations.DataTextField = "nom_autorisation";
                _Autorisations.DataValueField = "id_autorisation";
                _Autorisations.DataBind();

                _Applications.DataSource = applications;
                _Applications.DataTextField = "nom_application";
                _Applications.DataValueField = "id_application";
                _Applications.DataBind();
            }


        }
        protected void ModifierUtilisateur(object sender, EventArgs e)
        {
            // Récupération de l'ID de l'utilisateur à modifier
            int utilisateurID = Int32.Parse(Request.Form["utilisateurID"]);

            // Récupération des valeurs du formulaire
            var roleIDs = Request.Form.GetValues("_Roles");
            var applicationIDs = Request.Form.GetValues("_Applications");
            var autorisationIDs = Request.Form.GetValues("_Autorisations");

            using (var _context = new UtilisateurContext())
            {
                // Suppression des anciens rôles de l'utilisateur
                var oldRoles = _context.Utilisateur_Role.Where(ur => ur.id_utilisateur == utilisateurID);
                _context.Utilisateur_Role.RemoveRange(oldRoles);

                // Ajout des nouveaux rôles de l'utilisateur
                if (roleIDs != null)
                {
                    foreach (var roleID in roleIDs)
                    {
                        int parsedRoleID;
                        if (Int32.TryParse(roleID, out parsedRoleID))
                        {
                            var newUtilisateurRole = new Utilisateur_Role
                            {
                                id_role = parsedRoleID,
                                id_utilisateur = utilisateurID
                            };
                            _context.Utilisateur_Role.Add(newUtilisateurRole);
                        }
                    }
                    // Sauvegarde des modifications
                    _context.SaveChanges();
                }

                // Recherche de l'utilisateur à modifier
                var utilisateurRole = _context.Utilisateur_Role.FirstOrDefault(ur => ur.id_utilisateur == utilisateurID);

                if (utilisateurRole != null)
                {
                    // Suppression des anciennes autorisations de l'utilisateur
                    var oldAutorisations = _context.Application_Role_Autorisations.Where(ara => ara.id_utilisateur_role == utilisateurRole.id_utilisateur_role);
                    _context.Application_Role_Autorisations.RemoveRange(oldAutorisations);

                    // Ajout des nouvelles autorisations de l'utilisateur
                    if (applicationIDs != null && autorisationIDs != null)
                    {
                        int applicationID;
                        int autorisationID;
                        if (Int32.TryParse(applicationIDs[0], out applicationID) && Int32.TryParse(autorisationIDs[0], out autorisationID))
                        {
                            // Create a new Application_Role_Autorisations object
                            var nouvelleAutorisation = new Application_Role_Autorisations
                            {
                                id_Application = applicationID,
                                id_utilisateur_role = utilisateurRole.id_utilisateur_role,
                                id_autorisation = autorisationID
                            };

                            // Add the new data to the context
                            _context.Application_Role_Autorisations.Add(nouvelleAutorisation);
                        }
                    }

                 
                    // Sauvegarde des modifications
                    try
                    {
                        _context.SaveChanges();
                        Response.Redirect("UserManage.aspx");

                    }
                    catch (DbEntityValidationException ex)
                    {
                        foreach (var validationErrors in ex.EntityValidationErrors)
                        {
                            foreach (var validationError in validationErrors.ValidationErrors)
                            {
                                Console.WriteLine("Property: {0} Error: {1}", validationError.PropertyName, validationError.ErrorMessage);
                            }
                        }
                    }
                }
            }
        }





        protected void Annuler_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserManage.aspx");
        }


    }
}