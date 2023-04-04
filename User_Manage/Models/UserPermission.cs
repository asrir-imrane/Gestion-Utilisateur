using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace User_Manage.Models
{
    public class UserPermission
    {
        public int IdUtilisateur { get; set; }
        public string NomUtilisateur { get; set; }
        public string NomRole { get; set; }
        public string NomAutorisation { get; set; }
        public string NomApplication { get; set; }
    }
}