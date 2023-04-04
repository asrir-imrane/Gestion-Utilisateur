using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using User_Manage.Models;

namespace User_Manage.Services
{
    public class UtilisateurService
    {
        
        public UtilisateurService()
        {
        }

        public bool IsValidUser(string username, string password)
        {
            var context = new UtilisateurContext();
            Utilisateurs utilisateur = context.Utilisateurs.FirstOrDefault(u => u.nom_utilisateur == username && u.mot_de_passe == password);
            return utilisateur != null;
        }
    }
}