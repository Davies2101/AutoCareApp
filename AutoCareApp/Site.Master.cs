using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AutoCareApp
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string strPage = Page.AppRelativeVirtualPath;
                if (strPage.ToLower().Contains("default"))
                {
                    panelSlider.Visible = true;
                }

                if (Session["User"] != null)
                {
                    navLogin.Visible = false;
                    navAccount.Visible = true;

                    clsUser obj = (clsUser)Session["User"];
                    lblUserName.Text = obj.FullName;
                }
                else
                {
                    navLogin.Visible = true;
                    navAccount.Visible = false;
                }
            }
        }
    }
}