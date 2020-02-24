using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AutoCareApp
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                // Load curent pofile infor
                clsUser obj = (clsUser)Session["User"];
                FullName.Text = obj.FullName;
                PhoneNumber.Text = obj.PhoneNumber;
                Email.Text = obj.Email;

                // Focus on name field 
                FullName.Focus();
            }
        }

        protected void UpdateUser_Click(object sender, EventArgs e)
        {
            try
            {
                // Save new profile data to database
                clsUser obj = (clsUser)Session["User"];

                obj.FullName = FullName.Text;
                obj.Email = Email.Text;
                obj.PhoneNumber = PhoneNumber.Text;
                obj.Password = "";

                if (chkPassword.Checked)
                {
                    obj.Password = Password.Text;
                }

                mgtUSer.Update(obj);

                // Store user details to session as login user, redirects to home page
                Session["User"] = obj;
                Response.Redirect("Default");

            }
            catch (Exception ex)
            {
                // displays error messsage
                lblError.Text = ex.Message;
                lblError.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void chkPassword_CheckedChanged(object sender, EventArgs e)
        {
            panelPassword.Visible = chkPassword.Checked;
        }
    }
}

