using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AutoCareApp.Management;
using AutoCareApp.Models;

namespace AutoCareApp
{
    public partial class Review : System.Web.UI.Page
    {
        private static string id = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                id = Request.QueryString["id"];
            }

        }

        protected void btnReview_OnClick(object sender, EventArgs e)
        {
            if (id != null)
            {
                int bookingId = Convert.ToInt32(Server.UrlDecode(Cipher.Decrypt(id)));
                clsBooking booking = mgtBooking.GetBookingById(bookingId);
                clsReview review = new clsReview();
                review.BookingNo = bookingId;
                review.Rating = Convert.ToInt32(hdnStars.Value);
                review.UserID = booking.UserID;
                review.Review = txtReview.Text;
                mgtReview.Add(review);
                panelReviewForm.Visible = false;
                panelThankYou.Visible = true;
                id = null;
            }
        }
    }
}