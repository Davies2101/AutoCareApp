using System;
using System.Collections.Generic;
using System.Globalization;
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
                Response.Redirect("/LoginMsg.aspx");
            }
            else if (!user.AdminLogin)
            {
                //TODO
                Response.Redirect("/Unauthorized.aspx");
            }

            if (!Page.IsPostBack)
            {
                txtStartDate.Text = string.Format("{0:dd/MM/yyyy}", DateTime.Now);
                txtEndDate.Text = string.Format("{0:dd/MM/yyyy}", DateTime.Now);
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
            lstAllBookings.DataSource = mgtBooking
                .GetBookingsByDateDataSet(
                    Convert.ToDateTime(txtStartDate.Text, CultureInfo.GetCultureInfo("en-GB").DateTimeFormat),
                    Convert.ToDateTime(txtEndDate.Text, CultureInfo.GetCultureInfo("en-GB").DateTimeFormat)).Tables[0];
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