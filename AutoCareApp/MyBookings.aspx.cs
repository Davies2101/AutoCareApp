using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AutoCareApp.Management;

namespace AutoCareApp
{
    public partial class MyBookings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("LoginMsg");
            }
            if (!Page.IsPostBack)
            {
                BindBookings();
            }
        }

        public void BindBookings()
        {
            clsUser user = (clsUser)Session["User"];
            lstBookings.DataSource = mgtBooking.GetMyBookings(user.UserID).Tables[0];
            lstBookings.DataBind();
        }
       

        protected void btnCancel_OnClick(object sender, EventArgs e)
        {
            clsUser user = (clsUser)Session["User"];
            Button button = (sender as Button);
            int bookingId = Convert.ToInt32(button.Attributes["BookingId"]);
            mgtBooking.CancelBooking(bookingId);
            mgtPoint.Remove(user.UserID);
            messageBox.Visible = true;
            BindBookings();

        }
    }
}