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
            if (!IsPostBack)
            {
                BindUsers();
            }
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
    }
}