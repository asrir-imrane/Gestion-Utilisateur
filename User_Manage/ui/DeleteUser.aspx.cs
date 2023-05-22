using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.Validation;
using System.Diagnostics.Tracing;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;
using System.Web.Http.Results;
using System.Web.Security;
using System.Web.Services;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using User_Manage.Models;
using User_Manage.Services;



namespace User_Manage.ui
{
    public partial class DeleteUser : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void Supprimerutilisateur(object sender, EventArgs e)
        {
          
            int userId = Int32.Parse(Request.Form["id_User"]);  


            Supprimerutilisateur(userId);
            Response.Redirect("UserManage.aspx");


        }


        public static string Supprimerutilisateur(int userId)
        {
            try
            {
                using (var contexte = new UtilisateurContext())
                {
                    var utilisateur = contexte.Utilisateurs.SingleOrDefault(u => u.id_utilisateur == userId);

                    if (utilisateur == null)
                    {
                        return "User not found";
                    }

                    List<int> idUtilisateurs = contexte.Utilisateurs.Select(u => u.id_utilisateur).ToList();

                    // suppression de ses rôles, autorisations et applications associés
                    var utilisateurroles = contexte.Utilisateur_Role.Where(ur => ur.id_utilisateur == userId);
                    contexte.Utilisateur_Role.RemoveRange(utilisateurroles);

                    var utilisateurapplications = contexte.Application_Role_Autorisations
                        .Where(ara => ara.Utilisateur_Role.id_utilisateur == userId)
                        .Select(ara => ara.Application.id_application)
                        .Distinct()
                        .ToList();

                    foreach (var id_application in utilisateurapplications)
                    {
                        var applicationroleautorisations = contexte.Application_Role_Autorisations
                            .Where(ara => ara.Utilisateur_Role.id_utilisateur == userId && ara.Application.id_application == id_application);

                        contexte.Application_Role_Autorisations.RemoveRange(applicationroleautorisations);
                    }

                    // suppression de l'utilisateur
                    contexte.Utilisateurs.Remove(utilisateur);
                    contexte.SaveChanges();

                    return "success";
                }
            }
            catch (DbUpdateConcurrencyException ex)
            {
                return "Delete operation failed: " + ex.Message;
            }
        }
    }
}



