using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AutoCareApp
{
    public partial class PaymentResult : System.Web.UI.Page
    {
        private static string bid = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            bool reveiw = Convert.ToBoolean(hdnLeaveReviewClicked.Value.ToString());
            if (Session["PaymentStatus"] != null)
            {
                bool success = (bool)Session["PaymentStatus"];
                if (success)
                {
                    panelSuccess.Visible = true;
                    panelFailed.Visible = false;
                }
                else
                {
                    panelSuccess.Visible = false;
                    panelFailed.Visible = true;
                }

                if (Session["bid"] != null)
                {
                    bid = Session["bid"].ToString();
                }
                
                Session["PaymentStatus"] = null;
                Session["bid"] = null;
            }
            else if (reveiw != true)
            {
                Response.Redirect("/Default.aspx");
            }
        }


        protected void btnReview_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("/Review.aspx?id=" + bid);
        }

        //private void UpdatePaymentSta
    }
}