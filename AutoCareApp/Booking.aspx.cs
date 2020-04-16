using AutoCareApp.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using AutoCareApp.Classes;
using System.Globalization;
using AutoCareApp.Management;

namespace AutoCareApp
{
    public partial class Booking : System.Web.UI.Page
    {
        private DataSet bookingDateDataSet = mgtBooking.GetActiveBookingsDataSet();
        private static clsBooking bookingObject = null;
        private static List<string> selectedExtras = null;
        private static DataTable packageList = mgtPackage.GetPackagesDataSet().Tables[0];
        private static DataTable extrasList = mgtExtra.GetExtrasDataSet().Tables[0];

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("LoginMsg");
            }

            Wizard1.PreRender += new EventHandler(Wizard1_OnPreRender);
            if (!Page.IsPostBack)
            {
                BindPackages();
                bookingObject = new clsBooking();
                selectedExtras = new List<string>();
            }
            alertBox.Visible = false;
        }

        protected void Wizard1_OnPreRender(object sender, EventArgs e)
        {
            Repeater SideBarList = Wizard1.FindControl("HeaderContainer").FindControl("SideBarList") as Repeater;
            SideBarList.DataSource = Wizard1.WizardSteps;
            SideBarList.DataBind();
        }

        protected string GetClassForWizardStep(object wizardStep)
        {
            WizardStep step = wizardStep as WizardStep;

            if (step == null)
            {
                return "";
            }

            int stepIndex = Wizard1.WizardSteps.IndexOf(step);

            if (stepIndex < Wizard1.ActiveStepIndex)
            {
                return "prevStep";
            }
            else if (stepIndex > Wizard1.ActiveStepIndex)
            {
                return "nextStep";
            }
            else
            {
                return "currentStep";
            }
        }

        protected void bookingDate_OnDayRender(object sender, DayRenderEventArgs e)
        {
            //disable weekends
            if (e.Day.IsWeekend)
            {
                e.Day.IsSelectable = false;
                e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#9c8b8b");
            }

            //disable past days
            if (e.Day.Date.CompareTo(DateTime.Today) < 0)
            {
                e.Day.IsSelectable = false;
                e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#9c8b8b");
            }

            //disable unavailble booking dates
            if (bookingDateDataSet != null && bookingDateDataSet.Tables[0].Rows.Count > 0)
            {
                DateTime bookingDate;
                int timeSlotCount = 0;
                foreach (DataRow dr in bookingDateDataSet.Tables[0].Rows)
                {
                    bookingDate = (DateTime) dr["BookingDate"];
                    if (bookingDate.Date == e.Day.Date)
                    {
                        timeSlotCount++;
                        if (timeSlotCount == 5)
                        {
                            e.Day.IsSelectable = false;
                            e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#d62a2a");
                        }
                    }
                }
            }
        }

        public List<clsTime> GetSlotList()
        {
            return new List<clsTime>
            {
                new clsTime {Time = "9:00 AM", Value = new TimeSpan(9, 0, 0)},
                new clsTime {Time = "11:00 AM", Value = new TimeSpan(11, 0, 0)},
                new clsTime {Time = "1:00 PM", Value = new TimeSpan(13, 0, 0)},
                new clsTime {Time = "3:00 PM", Value = new TimeSpan(15, 0, 0)},
                new clsTime {Time = "5:00 PM", Value = new TimeSpan(17, 0, 0)}
            };
        }

        //select package
        protected void btnSelectPackage_OnClick(object sender, EventArgs e)
        {
            Button button = (sender as Button);
            int packageID = Convert.ToInt32(button.Attributes["PackageID"]);

            foreach (Control childControl in lstVPackage.Controls)
            {
                HtmlControl divCard = (HtmlControl)childControl.FindControl("divCard");
                divCard.Attributes.Add("class", "card col-md-3");
            }

            HtmlControl card = (HtmlControl)button.Parent.FindControl("divCard");
            card.Attributes.Add("class", "card col-md-3 bg-gradient-default");
            bookingObject.PackageID = packageID;
            CalculateTotal();
        }

        //select booking date
        protected void bookingDate_OnSelectionChanged(object sender, EventArgs e)
        {
            List<clsTime> availableSlots = GetSlotList();
            DateTime selectedDate = bookingDate.SelectedDate;
            TimeSpan bookingTime;
            if (bookingDateDataSet != null && bookingDateDataSet.Tables[0].Rows.Count > 0)
            {
                DateTime bookingDate;
                foreach (DataRow dr in bookingDateDataSet.Tables[0].Rows)
                {
                    bookingDate = (DateTime) dr["BookingDate"];
                    bookingTime = (TimeSpan) dr["TimeSlot"];
                    if (bookingDate.Date == selectedDate.Date)
                    {
                        foreach (clsTime timeSlot in availableSlots)
                        {
                            if (timeSlot.Value == bookingTime || timeSlot.Value <= DateTime.Now.TimeOfDay)
                            {
                                timeSlot.IsAvailable = false;
                            }
                        }
                    }
                }
            }
            else
            {
                foreach (clsTime timeSlot in availableSlots)
                {
                    if (timeSlot.Value <= DateTime.Now.TimeOfDay)
                    {
                        timeSlot.IsAvailable = false;
                    }
                }
            }

            bookingObject.BookingDate = selectedDate;
            BindTimeSlots(availableSlots);
        }

        //select time slot
        protected void btnSelectTime_OnClick(object sender, EventArgs e)
        {
            Button button = (sender as Button);
            string timeSlot = button.Attributes["TimeSlot"];

            foreach (Control childControl in lstVTimeSlots.Controls)
            {
                HtmlAnchor linkButton = (HtmlAnchor) childControl.FindControl("linkSelectedTime");
                if (!linkButton.Attributes["class"].Contains("disabled"))
                {
                    linkButton.Attributes.Add("class", "time-slot btn btn-outline-primary");
                }

                if (linkButton.Attributes["TimeSlot"] == timeSlot)
                {
                    linkButton.Attributes.Add("class", "time-slot btn btn-outline-primary active");
                }
            }
            bookingObject.TimeSlot = TimeSpan.Parse(timeSlot);
        }

        //bind packages
        private void BindPackages()
        {
            lstVPackage.DataSource = packageList;
            lstVPackage.DataBind();
        }

        //bind time slots
        public void BindTimeSlots(List<clsTime> listTimes)
        {
            lstVTimeSlots.DataSource = listTimes;
            lstVTimeSlots.DataBind();
        }
        

        /// <summary>
        /// getting checbox values
        /// https://stackoverflow.com/questions/9523263/how-can-i-get-the-checkboxlist-selected-values-what-i-have-doesnt-seem-to-work
        /// </summary>
        protected void chkBoxServices_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            selectedExtras = new List<string>();
            foreach (ListItem item in chkBoxExtras.Items)
            {
                if (item.Selected)
                {
                    selectedExtras.Add(item.Value);
                }
            }

            CalculateTotal();
        }

        //calculate total
        public void CalculateTotal()
        {
            double packagePrice = 0;
            double extraTotal = 0;
            double total = 0;
            
            //filter data from datatable
            //https://stackoverflow.com/questions/13012585/how-i-can-filter-a-datatable
            if (bookingObject.PackageID > 0)
            {
                DataView dv = new DataView(packageList);
                dv.RowFilter = "PackageID=" + bookingObject.PackageID.ToString();

                //get data from a specific column
                //https://www.codeproject.com/Questions/48158/get-data-from-DataView
                foreach (DataRowView drV in dv)
                {
                    packagePrice = Convert.ToDouble(drV["PackagePrice"].ToString());
                }
            }

            if (selectedExtras.Count > 0)
            {
                foreach (var serviceId in selectedExtras)
                {
                    DataView dv = new DataView(extrasList);
                    dv.RowFilter = "ExtraID=" + serviceId;

                    foreach (DataRowView drV in dv)
                    {
                        extraTotal = extraTotal + Convert.ToDouble(drV["ExtraPrice"].ToString());
                    }
                }
            }

            total = packagePrice + extraTotal;

            lblTotal1.Text = string.Format("{0:0.00}", total);
            lblTotal2.Text = string.Format("{0:0.00}", total);
            lblTotal3.Text = string.Format("{0:0.00}", total);
        }

        /// <summary>
        ///  http://www.binaryintellect.net/articles/c6a28be9-8511-4d41-b3b6-6287a48f828f.aspx
        /// </summary>
        protected void Wizard1_OnActiveStepChanged(object sender, EventArgs e)
        {
            if (Wizard1.ActiveStep.Name == "Date & Time")
            {
                if (bookingObject.PackageID == 0)
                {
                    AlertMessage("Please select a package");
                    Wizard1.ActiveStepIndex = 0;
                }

            }
            if (Wizard1.ActiveStep.Name == "Add Your Info")
            {

                if (bookingObject.TimeSlot == new TimeSpan(0, 0, 0))
                {
                    AlertMessage("Please select a booking time");
                    Wizard1.ActiveStepIndex = 1;
                }
                if (bookingObject.BookingDate == DateTime.MinValue)
                {
                    AlertMessage("Please select a booking date");
                    Wizard1.ActiveStepIndex = 1;
                }
            }
            
            if (Wizard1.ActiveStep.Name == "Summary")
            {
                double packagePrice = 0;
                double extraTotal = 0;
                double total = 0;
                if (bookingObject.PackageID > 0)
                {
                    DataView dv = new DataView(packageList);
                    dv.RowFilter = "PackageID=" + bookingObject.PackageID.ToString();

                    //get data from a specific column
                    //https://www.codeproject.com/Questions/48158/get-data-from-DataView
                    foreach (DataRowView drV in dv)
                    {
                        lblPackageName.Text = drV["PackageName"].ToString();
                        packagePrice = Convert.ToDouble(drV["PackagePrice"].ToString());
                        lblPackagePrice.Text = string.Format("{0:0.00}", packagePrice);

                    }
                }

                List<clsExtra> extras = new List<clsExtra>();
                if (selectedExtras.Count > 0)
                {
                    lblServices.Visible = true;
                    foreach (var extraId in selectedExtras)
                    {
                        DataView dv = new DataView(extrasList);
                        dv.RowFilter = "ExtraID=" + extraId;

                        clsExtra extra = new clsExtra();
                        foreach (DataRowView drV in dv)
                        {
                            extra.ExtraPrice = Convert.ToDouble(drV["ExtraPrice"].ToString());
                            extraTotal = extraTotal + extra.ExtraPrice;
                            extra.ExtraName = drV["ExtraName"].ToString();
                        }

                        extras.Add(extra);
                    }
                }

                if (extras.Count > 0)
                {
                    lstViewExtras.DataSource = extras;
                    lstViewExtras.DataBind();
                }

                total = extraTotal + packagePrice;
                lblTotal.Text = string.Format("{0:0.00}", total);
                lblBookingDateAndTime.Text = bookingObject.BookingDate.ToShortDateString() + " " + DateTime.Today.Add(bookingObject.TimeSlot).ToString("hh:mm tt");
             }
        }

        public void AlertMessage(string message)
        {
            lblAlert.Text = message;
            alertBox.Visible = true;
            messageBox.Visible = false;
        }

        protected void FinishButton_OnClick(object sender, EventArgs e)
        {
            try
            {
                clsUser user = (clsUser)Session["User"];
                bookingObject.Address = Address.Text;
                bookingObject.PostCode = PostCode.Text;
                bookingObject.Remarks = Remarks.Text;
                bookingObject.VehicleColor = VehicleColor.Text;
                bookingObject.VehicleMake = VehicleMake.Text;
                bookingObject.VehicleReg = VehicleReg.Text;
                bookingObject.VehicleModel = VehicleModel.Text;
                bookingObject.UserID = user.UserID;
                bookingObject.Total = Convert.ToDouble(lblTotal.Text);
                mgtBooking.Add(bookingObject, string.Join(",", selectedExtras));
                mgtPoint.Add(user.UserID);
                messageBox.Visible = true;
                SendBookingConfirmation(user);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "clientScript", "redirectToHome();", true);
            }
            catch (Exception ex)
            {
                AlertMessage("Something went wrong. Please try again later!");
            }

        }

        public void SendBookingConfirmation(clsUser user)
        {

            string emailBody = "<h2>Hello " + user.FullName + ".</h2>" +
                                 "<h3>Your booking is confirmed</h3></br></br>";
            StringBuilder sb = new StringBuilder();
            StringWriter sw = new StringWriter(sb);
            HtmlTextWriter tw = new HtmlTextWriter(sw);
            panelBookingSummary.RenderControl(tw);
            emailBody = emailBody + sb.ToString();
            emailBody = emailBody + "<p>Thank You, <br>Team AutoCare </p>";

            try
            {
                EmailSender.Send("AutoCare - Booking Confirmation", emailBody, user.Email);
            }
            catch (Exception ex)
            {
                AlertMessage("Email sending failed!");
            }
        }
    }
}