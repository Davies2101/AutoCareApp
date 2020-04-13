using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AutoCareApp
{
    public partial class AdminRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            clsUser user = (clsUser)Session["User"];
            if (user == null)
            {
                Response.Redirect("LoginMsg");
            }
            else if (!user.AdminLogin)
            {
                Response.Redirect("Unauthorized");
            }
            // Focus on name field 
            FullName.Focus();

        }

        protected void CreateUser_Click(object sender, EventArgs e)
        {
            try
            {
                // Creating a new user object with form data
                clsUser user = new clsUser();
                user.FullName = FullName.Text;
                user.Username = Username.Text;
                user.Password = Cipher.Encrypt(Password.Text);
                user.Email = Email.Text;
                user.PhoneNumber = PhoneNumber.Text;
                user.AdminLogin = true;

                //check username availability
                if (mgtUSer.ValidateUsername(user.Username))
                {
                    // Saving user class to database
                    mgtUSer.Register(user);
                    messageBox.Visible = true;
                    ClearForm();
                }
                else
                {
                    AlertMessage("The Username is already in use.");
                }


            }
            catch (Exception ex)
            {
                // displays error messsage
                AlertMessage(ex.Message);
            }
        }

        public void AlertMessage(string message)
        {
            messageBox.Visible = false;
            lblAlert.Text = message;
            alertBox.Visible = true;
        }

        public void ClearForm()
        {
            FullName.Text = "";
            Username.Text = "";
            Password.Text = "";
            Email.Text = "";
            PhoneNumber.Text = "";
            ConfirmPassword.Text = "";
        }
    }
}