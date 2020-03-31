using AutoCareApp.Management;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AutoCareApp
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Focus on name field 
            FullName.Focus();
        }

        protected void CreateUser_Click(object sender, EventArgs e)
        {
            try
            {
                // Creating a new user object with form data
                clsUser obj = new clsUser();
                obj.FullName = FullName.Text;
                obj.Username = Username.Text;
                obj.Password = mgtEncryption.Encryptdata(Password.Text);
                obj.Email = Email.Text;
                obj.PhoneNumber = PhoneNumber.Text;
                obj.AdminLogin = false;

                //check username availability
                if (mgtUSer.UsernameCheck(Username.Text))
                {
                    // Saving user class to database
                    mgtUSer.Register(obj);

                    obj = mgtUSer.Login(Username.Text);

                    // Store user details to session as login user, redirects to home page
                    Session["User"] = obj;
                    Response.Redirect("Default.aspx");
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
            lblAlert.Text = message;
            alertBox.Visible = true;
        }

        

    }
}

