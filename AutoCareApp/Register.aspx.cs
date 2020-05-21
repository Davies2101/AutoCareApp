
using System;

namespace AutoCareApp
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
                user.AdminLogin = false;

                //check username availability
                if (mgtUSer.ValidateUsername(user.Username))
                {
                    // Saving user class to database
                    mgtUSer.Register(user);

                    //get registered user details
                    user = mgtUSer.GetUserByUsername(Username.Text);
                    // Store user details to session as login user, redirects to home page
                    Session["User"] = user;
                    //redirect to home page
                    Response.Redirect("/SpinToWin.aspx", false);

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

