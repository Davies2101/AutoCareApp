using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AutoCareApp
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Focusing on username field 
            Username.Focus();
        }

        protected void LogIn(object sender, EventArgs e)
        {
            try
            {
                // Creating blank object of User class
                clsUser obj = null;

                // Fills user class with matching username and password
                obj = mgtUSer.Login(Username.Text, Password.Text);

                if (obj == null)
                {
                    // if user class (form) is not filled, displaying invalid login details message
                    lblError.Text = "Invalid username or password";
                    lblError.ForeColor = System.Drawing.Color.Red;
                    lblError.Visible = true;
                }
                else
                {
                    // if login success, stores new user and redirects to home page
                    Session["User"] = obj;
                    Response.Redirect("Default");
                }
            }
            catch (Exception ex)
            {
                // displays error messsage
                lblError.Text = ex.Message;
                lblError.ForeColor = System.Drawing.Color.Red;
                lblError.Visible = true;
            }
        }
    }
}