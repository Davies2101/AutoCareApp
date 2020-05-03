using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AutoCareApp
{
    public partial class Packages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPackages();
            }
        }

        private void LoadPackages()
        {
            lstVPackage.DataSource = mgtPackage.GetPackagesDataSet().Tables[0]; ;
            lstVPackage.DataBind();
        }
    }
}