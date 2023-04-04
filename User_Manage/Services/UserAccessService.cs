using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using User_Manage.Services;

namespace User_Manage.Models
{


    public class UserAccessService
    {
        private UtilisateurContext _context;

        public UserAccessService()
        {
            _context = new UtilisateurContext();
        }

        public List<User_Permissions> GetUserPermissions()
        {
            var query = from up in _context.Set<User_Permissions>()
                        select new
                        {
                            up.id_utilisateur,
                            up.nom_utilisateur,
                            up.nom_application,
                            up.nom_autorisation,
                            up.nom_role
                        };

            var userPermissions = query.ToList().Select(up => new User_Permissions
            {
                id_utilisateur = up.id_utilisateur,
                nom_utilisateur = up.nom_utilisateur,
                nom_application = up.nom_application,
                nom_autorisation = up.nom_autorisation,
                nom_role = up.nom_role
            }).ToList();

            return userPermissions;
        }


    }

}

