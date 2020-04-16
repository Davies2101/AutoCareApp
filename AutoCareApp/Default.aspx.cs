using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AutoCareApp.Management;

namespace AutoCareApp
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Loading Packages list from database to home page
                LoadPackages();
                // Loading Reviews
                LoadReviews();
            }
            
        }

        private void LoadPackages()
        {
            // Getting packge data from database and displaying on the home page
            DataTable dt = mgtPackage.GetPackagesDataSet().Tables[0];
            lstVPackage.DataSource = dt;
            lstVPackage.DataBind();
        }

        private void LoadReviews()
        {
            // Getting review data from database and displaying on the home page
            DataTable dt = mgtReview.GetReviewsDataSet(true).Tables[0];
            //if reviews are less than 4 then hide review section
            if (dt.Rows.Count <= 3)
            {
                panelReviews.Visible = false;
            }
            lstReview.DataSource = dt;
            lstReview.DataBind();
        }
    }
}
