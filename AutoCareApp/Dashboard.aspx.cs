using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AutoCareApp
{
    public partial class Dashboard : System.Web.UI.Page
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
                Response.Redirect("/Unauthorized.aspx");
            }
            LoadChartData();
        }

        public void LoadChartData()
        {
            GetTotalCustomers();
            GetCurrentBookings();
            GetTotalCompleted();
            GetTotalSales();
            GetMostlyPickedPackages();
            GetWeeklySales();
        }

        public void GetTotalCustomers()
        {
            int total = mgtUSer.GetTotalCustomers();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "setTotalCustomers", "setTotalCustomers('" + total + "');", true);
        }

        public void GetCurrentBookings()
        {
            int total = mgtBooking.GetCurrentBookings();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "setCurrentBookings", "setCurrentBookings('" + total + "');", true);
        }

        public void GetTotalCompleted()
        {
            int total = mgtUSer.GetTotalCustomers();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "setTotalCompleted", "setTotalCompleted('" + total + "');", true);
        }

        public void GetTotalSales()
        {
            double total = mgtBooking.GetTotalSales();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "setTotalSales", "setTotalSales('" + total + "');", true);
        }

        public void GetMostlyPickedPackages()
        {
            int[] array = mgtPackage.GetMostlyPickedPackages().ToArray();
            var jsonArray = JsonConvert.SerializeObject(array);
            Page.ClientScript.RegisterStartupScript(this.GetType(), "setMostlyPickedPackages", "setMostlyPickedPackages('" + jsonArray + "');", true);
        }

        public void GetWeeklySales()
        {
            int[] array = mgtBooking.GetWeeklySales().Values.ToArray();
            var jsonArray = JsonConvert.SerializeObject(array);
            Page.ClientScript.RegisterStartupScript(this.GetType(), "setWeeklySales", "setWeeklySales('" + jsonArray + "');", true);
        }
    }
}