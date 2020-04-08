
using System;

namespace AutoCareApp
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            clsUser user = (clsUser) Session["User"];
            if (user != null && user.AdminLogin)
            {
                btnCreateUser.Text = "Add Admin";
            }
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
                obj.Password = Cipher.Encrypt(Password.Text);
                obj.Email = Email.Text;
                obj.PhoneNumber = PhoneNumber.Text;
                obj.AdminLogin = false;

                //if the current user is admin/then new user is register as a new admin
                clsUser user = (clsUser)Session["User"];
                if (user != null && user.AdminLogin)
                {
                    obj.AdminLogin = true;
                }

                //check username availability
                if (mgtUSer.ValidateUsername(obj.Username))
                {
                    // Saving user class to database
                    mgtUSer.Register(obj);
                    
                    if (obj.AdminLogin)
                    {
                        //if saved user is admin then show admin succesfully added message
                        messageBox.Visible = true;
                        ClearForm();
                    }
                    else
                    {
                        //get registered user details
                        obj = mgtUSer.GetUserByUsername(Username.Text);
                        // Store user details to session as login user, redirects to home page
                        Session["User"] = obj;
                        //redirect to home page
                        Response.Redirect("Default.aspx");
                    }
                    
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
            alertBox.Visible = false;
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

