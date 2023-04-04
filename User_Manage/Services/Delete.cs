using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace User_Manage.Services
{
    public class Delete
    {
        private UtilisateurContext _context;

        public void DeleteData(int id)
        {
            _context = new UtilisateurContext();
            var data = _context.User_Permissions.FirstOrDefault(d => d.id_utilisateur == id);
            if (data != null)
            {
                _context.User_Permissions.Remove(data);
                _context.SaveChanges();
            }
        }

    }
}