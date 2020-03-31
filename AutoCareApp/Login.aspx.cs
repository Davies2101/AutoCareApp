using AutoCareApp.Management;
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
            //Focusing on username field
            Username.Focus();
        }

        protected void LogIn(object sender, EventArgs e)
        {
            try
            {
                // Creating blank object of User class
                clsUser obj = null;

                // get user by username
                obj = mgtUSer.Login(Username.Text);

                if (obj == null)
                {   //if user object is null it emans username is invalid as it is not available in the database
                    AlertMessage("Invalid Username.");
                }
                else
                {
                    //check account locked status
                    if (obj.FailedLoginAttempts >= 3)
                    {
                        //check locked out time difference greater than or equal to 3 minutes
                        TimeSpan ts =  System.DateTime.Now - obj.LockedOutDatetime.Value;
                        if (ts.Minutes >= 3)
                        {
                            mgtUSer.ResetFailedLoginAttempts(obj.UserID);
                        }
                        else
                        {
                            int minutesLeft = 3 - ts.Minutes;
                            AlertMessage("You account is temporarily locked. Please try again in " + minutesLeft.ToString() + " minutes.");
                        }
                        
                    }//password check
                    else if (Password.Text == mgtEncryption.Decryptdata(obj.Password))
                    {
                        // if login success, stores new user and redirects to home page if its a normal user if not redirect to admin page
                        Session["User"] = obj;
                        if (obj.AdminLogin)
                        {
                            Response.Redirect("AdminPage");
                        }
                        else
                        {
                            Response.Redirect("Default");
                        }
                    }
                    else
                    {
                        int loginAttempts = obj.FailedLoginAttempts + 1;
                        //update failed login attempt
                        mgtUSer.UpdateFailedLoginAttempts(obj.UserID);
                        if (loginAttempts >= 3)
                        {
                            AlertMessage("You account is temporarily locked. Please try again in 3 minutes");
                        }
                        else
                        {
                            AlertMessage("Invalid Password. ");
                        }
                        
                    }
                    
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