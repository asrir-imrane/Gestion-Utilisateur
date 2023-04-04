using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using User_Manage.Models;
using User_Manage.Services;
using static System.Net.Mime.MediaTypeNames;

namespace User_Manage.ui
{
    public partial class AffectAutorisation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillUtilisateursDropdown();
                FillAutorisationsDropdown();
                FillApplicationsDropdown();
            }


        }

        private void FillUtilisateursDropdown()
        {
            using (var contexte = new UtilisateurContext())
            {
                var utilisateurid = contexte.Utilisateurs.ToList();
                _Utilisateur.DataSource = utilisateurid;
                _Utilisateur.DataTextField = "nom_utilisateur";
                _Utilisateur.DataValueField = "id_utilisateur";
                _Utilisateur.DataBind();
            }
        }
        private void FillAutorisationsDropdown()
        {
            using (var contexte = new UtilisateurContext())
            {
                var autorisations = contexte.Autorisation.ToList();
                _Autorisations.DataSource = autorisations;
                _Autorisations.DataTextField = "nom_autorisation";
                _Autorisations.DataValueField = "id_autorisation";
                _Autorisations.DataBind();
            }
        }

        private void FillApplicationsDropdown()
        {
            using (var contexte = new UtilisateurContext())
            {
                var applications = contexte.Application.ToList();
                _Applications.DataSource = applications;
                _Applications.DataTextField = "nom_application";
                _Applications.DataValueField = "id_application";
                _Applications.DataBind();
            }
        }

        protected void AffecterAutorisation(object sender, EventArgs e)
        {
            // Récupération des valeurs du formulaire
            int utilisateurID = Convert.ToInt32(_Utilisateur.SelectedValue);

            // Association de l'utilisateur à son autorisation
            int autorisationID = Convert.ToInt32(_Autorisations.SelectedValue);

            // Association de l'utilisateur à son application
            int applicationID = Convert.ToInt32(_Applications.SelectedValue);

            // Récupération de l'ID du rôle de l'utilisateur
            int utilisateurRoleID;
            using (var contexte = new UtilisateurContext())
            {
                utilisateurRoleID = contexte.Utilisateur_Role
                    .Where(ur => ur.id_utilisateur == utilisateurID)
                    .Select(ur => ur.id_utilisateur_role)
                    .FirstOrDefault();
            }

            Application_Role_Autorisations applicationRoleAutorisations = new Application_Role_Autorisations
            {
                
                id_Application = applicationID,
                id_utilisateur_role = utilisateurRoleID,
                id_autorisation = autorisationID
            };

            using (var contexte = new UtilisateurContext())
            {
                contexte.Application_Role_Autorisations.Add(applicationRoleAutorisations);
                contexte.SaveChanges();
            }

            // Affichage d'un message de confirmation
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "$('.alert').show().delay(3000).fadeOut();", true);
            Response.Redirect("UserManage.aspx");
        }

        protected void Annuler_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserManage.aspx");
        }

    }
}