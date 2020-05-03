using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AutoCareApp
{
    public partial class ManageProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            clsUser user = (clsUser)Session["User"];
            if (user == null)
            {
                Response.Redirect("/LoginMsg.aspx");
            }
            else if (!user.AdminLogin)
            {
                Response.Redirect("/Unauthorized.aspx");
            }

            if (!IsPostBack)
            {
                BindUsers();
            }

            messageBox.Visible = false;
        }

        public void BindUsers()
        {
            bool isAdmin = true;
            if (ddlUserType.SelectedValue == "1")
            {
                isAdmin = false;
            }

            lstUsers.DataSource = mgtUSer.GetUsersDataSet(isAdmin).Tables[0];
            lstUsers.DataBind();
        }

        protected void ddlUserType_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            BindUsers();
        }


        protected void btnDelete_OnClick(object sender, EventArgs e)
        {
            Button button = (sender as Button);
            int userId = Convert.ToInt32(button.Attributes["UserID"]);
            mgtUSer.Delete(userId);
            BindUsers();
            messageBox.Visible = true;
        }
    }
}