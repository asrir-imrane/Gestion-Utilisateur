using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Http.Results;
using System.Web.UI;
using System.Web.UI.WebControls;
using User_Manage.Models;
using User_Manage.Services;

namespace User_Manage.ui
{
    public partial class test : System.Web.UI.Page
    {
        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string username = UserLogin.Value;
            string password = passwordLogin.Value;
            var utilisateurService = new UtilisateurService();
            bool isValidUser = utilisateurService.IsValidUser(username, password);

            if (isValidUser)
            {
                Response.Redirect("UserManage.aspx");

                // do something else, such as redirecting to another page
            }
            else
            {
                // unsuccessful login
                successMessage.Visible = false;
                errorMessage.Visible = true;
            }
        }
       

    }
}


    
