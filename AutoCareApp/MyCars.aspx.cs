using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AutoCareApp
{
    public partial class MyCars : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Load curent pofile info
            clsUser user = (clsUser)Session["User"];
            if (user == null)
            {
                Response.Redirect("LoginMsg");
            }

            if (user.AdminLogin)
            {
                Response.Redirect("Unauthorized");
            }

            if (!IsPostBack)
            {
                lblFullName.Text = user.FullName;
                profileimg.ImageUrl = "/Content/profile/" + user.Picture;
            }

            messageBox.Visible = false;

        }
    }
}