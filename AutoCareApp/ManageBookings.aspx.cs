using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AutoCareApp.Management;

namespace AutoCareApp
{
    public partial class ManageBookings : System.Web.UI.Page
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
                //TODO
                Response.Redirect("/Unauthorized.aspx");
            }

            if (!Page.IsPostBack)
            {
                txtStartDate.Text = DateTime.Now.ToShortDateString();
                txtEndDate.Text = DateTime.Now.ToShortDateString();
                BindCurrentBookings();
                BindBookingsByDate();
            }
            messageBox.Visible = false;
            Page.ClientScript.RegisterStartupScript(this.GetType(), "defaultTab", "defaultTab('" + hdnTab.Value + "')", true);
        }

        public void BindCurrentBookings()
        {
            lstBookings.DataSource = mgtBooking.GetBookingsByDateDataSet(DateTime.Now, DateTime.Now).Tables[0];
            lstBookings.DataBind();
        }

        public void BindBookingsByDate()
        {
            lstAllBookings.DataSource = mgtBooking.GetBookingsByDateDataSet(Convert.ToDateTime(txtStartDate.Text), Convert.ToDateTime(txtEndDate.Text)).Tables[0];
            lstAllBookings.DataBind();
        }

        protected void btnRun_OnClick(object sender, EventArgs e)
        {
            BindBookingsByDate();
        }

        protected void btnCancel_OnClick(object sender, EventArgs e)
        {
            Button button = (sender as Button);
            int bookingId = Convert.ToInt32(button.Attributes["BookingId"]);
            mgtBooking.CancelBooking(bookingId);
            mgtMails.SendCancelledEmail(bookingId);
            ShowMessageBox("The booking is successfully cancelled!");
            BindCurrentBookings();
        }

        protected void btnEnd_OnClick(object sender, EventArgs e)
        {
            Button button = (sender as Button);
            int bookingId = Convert.ToInt32(button.Attributes["BookingId"]);
            mgtBooking.CompleteBooking(bookingId);
            mgtMails.SendPaymentLink(bookingId, Server.UrlEncode(Cipher.Encrypt(bookingId.ToString())));
            ShowMessageBox("The booking is successfully completed!");
            BindCurrentBookings();
        }

        protected void btnCancelAll_OnClick(object sender, EventArgs e)
        {
            Button button = (sender as Button);
            int bookingId = Convert.ToInt32(button.Attributes["BookingId"]);
            mgtBooking.CancelBooking(bookingId);
            mgtMails.SendCancelledEmail(bookingId);
            ShowMessageBox("The booking is successfully cancelled!");
            BindBookingsByDate();
        }

        public void ShowMessageBox(string messageText)
        {
            lblMessage.Text = messageText;
            messageBox.Visible = true;
        }
        
    }
}