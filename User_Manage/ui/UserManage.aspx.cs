using System;
using System.Linq;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using User_Manage.Models;
using User_Manage.Services;

namespace User_Manage.ui
{
    public partial class UserManage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillRolesDropdown();
                FillAutorisationsDropdown();
                FillApplicationsDropdown();
            }
                
            
        }

        private void FillRolesDropdown()
        {
            using (var contexte = new UtilisateurContext())
            {
                var roles = contexte.Role.ToList();
                Roles.DataSource = roles;
                Roles.DataTextField = "nom_role";
                Roles.DataValueField = "id_role";
                Roles.DataBind();
            }
        }

        private void FillAutorisationsDropdown()
        {
            using (var contexte = new UtilisateurContext())
            {
                var autorisations = contexte.Autorisation.ToList();
                Autorisations.DataSource = autorisations;
                Autorisations.DataTextField = "nom_autorisation";
                Autorisations.DataValueField = "id_autorisation";
                Autorisations.DataBind();
            }
        }

        private void FillApplicationsDropdown()
        {
            using (var contexte = new UtilisateurContext())
            {
                var applications = contexte.Application.ToList();
                Applications.DataSource = applications;
                Applications.DataTextField = "nom_application";
                Applications.DataValueField = "id_application";
                Applications.DataBind();
            }
        }

        protected void AjouterUtilisateur(object sender, EventArgs e)
        {
            // Récupération des valeurs du formulaire
            string nomUtilisateur = NomUtilisateur.Text;
            string motDePasse = MotDePasse.Text;
            string adresseEmail = AdresseEmail.Text;

            // Création d'un nouvel utilisateur
            Utilisateurs nouvelUtilisateur = new Utilisateurs
            {
                nom_utilisateur = nomUtilisateur,
                mot_de_passe = motDePasse,
                adresse_email = adresseEmail,
                date_inscription = DateTime.Now
            };

            // Ajout du nouvel utilisateur dans la base de données
            using (var contexte = new UtilisateurContext())
            {
                contexte.Utilisateurs.Add(nouvelUtilisateur);
                contexte.SaveChanges();
            }

            // Récupération de l'ID de l'utilisateur inséré
            int utilisateurID = nouvelUtilisateur.id_utilisateur;

            // Association de l'utilisateur à son rôle
            int roleID = Convert.ToInt32(Roles.SelectedValue);
            Utilisateur_Role utilisateurRole = new Utilisateur_Role
            {
                id_utilisateur = utilisateurID,
                id_role = roleID
            };

            using (var contexte = new UtilisateurContext())
            {
                contexte.Utilisateur_Role.Add(utilisateurRole);
                contexte.SaveChanges();
            }

            // Association de l'utilisateur à son application, son rôle et son autorisation
            int applicationID = Convert.ToInt32(Applications.SelectedValue);
            int autorisationID = Convert.ToInt32(Autorisations.SelectedValue);
            Application_Role_Autorisations applicationRoleAutorisations = new Application_Role_Autorisations
            {
                id_Application = applicationID,
                id_utilisateur_role = utilisateurRole.id_utilisateur_role,
                id_autorisation = autorisationID
            };

            using (var contexte = new UtilisateurContext())
            {
                contexte.Application_Role_Autorisations.Add(applicationRoleAutorisations);
                contexte.SaveChanges();
            }

            Response.Redirect("UserManage.aspx");
        }



    }
}