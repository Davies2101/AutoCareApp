using System;
using System.Collections.Generic;
using System.IO;
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
            // Load curent pofile info
            clsUser user = (clsUser) Session["User"];
            if (user == null)
            {
                Response.Redirect("LoginMsg");
            }

            if (user.AdminLogin)
            {
                Response.Redirect("/Unauthorized.aspx");
            }

            if (!IsPostBack)
            {
                lblFullName.Text = user.FullName;
                FullName.Text = user.FullName;
                PhoneNumber.Text = user.PhoneNumber;
                Email.Text = user.Email;
                imgPreview.Src = "/Content/profile/" + user.Picture;
                profileimg.ImageUrl = "/Content/profile/" + user.Picture;
            }

            messageBox.Visible = false;
        }

        protected void UpdateUser_Click(object sender, EventArgs e)
        {
            try
            {
                // Save new profile data to database
                clsUser user = (clsUser)Session["User"];

                user.FullName = FullName.Text;
                user.Email = Email.Text;
                user.PhoneNumber = PhoneNumber.Text;
                user.Password = "";

                if (chkPassword.Checked)
                {
                    user.Password = Cipher.Encrypt(Password.Text);
                }

                if (hdnUpload.Value != "")
                {
                    string filename = Path.GetFileName(fileupload.FileName);
                    fileupload.SaveAs(Server.MapPath("~/Content/profile/") + filename);
                    user.Picture = filename;
                    imgPreview.Src = "/Content/profile/" + user.Picture;
                    profileimg.ImageUrl = "/Content/profile/" + user.Picture;
                }

                lblFullName.Text = user.FullName;
                mgtUSer.Update(user);

                // Store user details to session as login user
                Session["User"] = user;
                messageBox.Visible = true;
                
            }
            catch (Exception ex)
            {
                AlertMessage(ex.Message);
            }
        }

        protected void chkPassword_CheckedChanged(object sender, EventArgs e)
        {
            panelPassword.Visible = chkPassword.Checked;
        }

        public void AlertMessage(string message)
        {
            lblAlert.Text = message;
            alertBox.Visible = true;
            messageBox.Visible = false;
        }
    }
}

