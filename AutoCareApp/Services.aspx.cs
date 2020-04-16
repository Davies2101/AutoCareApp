using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AutoCareApp
{
    public partial class Services : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Loading Packages list from database to home page
            LoadPackages();
        }

        private void LoadPackages()
        {
            // Getting packge data from database and displaying on the home page
            DataTable dt = mgtPackage.GetPackagesDataSet().Tables[0];
            lstVPackage.DataSource = dt;
            lstVPackage.DataBind();
        }
    }
}