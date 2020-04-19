using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AutoCareApp.Management;

namespace AutoCareApp
{
    public partial class AdminReview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            clsUser user = (clsUser)Session["User"];
            if (user == null)
            {
                Response.Redirect("LoginMsg");
            }
            else if (!user.AdminLogin)
            {
                Response.Redirect("/Unauthorized.aspx");
            }

            if (!Page.IsPostBack)
            {
                BindReviews();
            }
            messageBox.Visible = false;
        }

        public void BindReviews()
        {
            lstReviews.DataSource = mgtReview.GetReviewsDataSet(false);
            lstReviews.DataBind();
        }

        protected void btnDelete_OnClick(object sender, EventArgs e)
        {
            Button button = (sender as Button);
            int reviewId = Convert.ToInt32(button.Attributes["ReviewId"]);
            mgtReview.UpdateOrDelete(reviewId, false, true);
            ShowMessageBox("The Review deleted successfully!");
            BindReviews();
        }

        protected void btnActivate_OnClick(object sender, EventArgs e)
        {
            Button button = (sender as Button);
            int reviewId = Convert.ToInt32(button.Attributes["ReviewId"]);
            bool status = Convert.ToBoolean(button.Attributes["Status"]);
            mgtReview.UpdateOrDelete(reviewId, !status, false);
            ShowMessageBox("The Review status updated successfully!");
            BindReviews();
        }

        public void ShowMessageBox(string messageText)
        {
            lblMessage.Text = messageText;
            messageBox.Visible = true;
        }
    }
}