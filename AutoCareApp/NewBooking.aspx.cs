using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AutoCareApp
{
    public partial class NewBooking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // check if user not logged in, redirecting the page to login or register
            if (Session["User"] == null)
            {
                Response.Redirect("LoginMsg");
            }
            //when a user clicks action (button) it will list the packagaes (services)
             if (!IsPostBack)
            {
                // Load the list of packages
                LoadPackages();
                LoadServices();

                // if the package is aleady selected from home page, changing the selected package using query string parameter
                if (Request.QueryString["id"] != null)
                {
                    string PackageID = Request.QueryString["id"].ToString();
                    //cmbPackage.SelectedValue = PackageID;
                }
           
            }
        }

        protected void BookNow_Click(object sender, EventArgs e)
        {
            try
            {
                // reading the  logged in user class (credentials)z
                clsUser User = (clsUser)Session["User"];

                // creating a new object of Booking class with form data in booking form
                clsBooking obj = new clsBooking();
                obj.UserID = User.UserID;
                obj.PackageID = Convert.ToInt32(hdnPackages.Value);
                obj.VehicleReg = VehicleReg.Text;
                obj.VehicleMake = VehicleMake.Text;
                obj.VehicleModel = VehicleModel.Text;
                obj.VehicleColor = VehicleColor.Text;
                obj.Address = Address.Text;
                obj.PostCode = PostCode.Text;
                obj.BookingDate =  Convert.ToDateTime(BookingDate.Text);
                obj.Remarks = Remarks.Text;

                string ServiceIDList = hdnServiceList.Value;
                // Saving the new object (booking)
                mgtBooking.Add(obj, ServiceIDList);

                HideError();

                panelPopup.Visible = true;
            }
            catch (Exception ex)
            {
                // displays error messsage
                ShowError(ex.Message);
            }
        }

        protected void LoadServices()
        {
            DataTable dt = mgtService.GetDataSet().Tables[0];
            lstServices.DataSource = dt;
            lstServices.DataBind();


        }

        protected void CalculatePrices()
        {
            try
            {
                int PackageID = Convert.ToInt32(hdnPackages.Value);
                string ServiceIDList = hdnServiceList.Value;
                double price = mgtBooking.GetPrice(PackageID, ServiceIDList);
                HideError();
            }
            catch (Exception ex)
            {
                // displays error messsage
                ShowError(ex.Message);
            }
        }

        protected void VehicleReg_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string VehicleRegNo = VehicleReg.Text;

                clsVehicle obj = mgtBooking.GetVehicle(VehicleRegNo);

                if (obj != null)
                {
                    VehicleMake.Text = obj.VehicleMake;
                    VehicleModel.Text = obj.VehicleModel;
                    VehicleColor.Text = obj.VehicleColor;
                }

                HideError();
            }
            catch (Exception ex)
            {
                // displays error messsage
                ShowError(ex.Message);
            }
        }

        private void LoadPackages()
        {
            // Getting packge data from database and displaying on the home page
            DataTable dt = mgtPackage.GetDataSet().Tables[0];
            lstVPackage.DataSource = dt;
            lstVPackage.DataBind();
        }

        [WebMethod]
        public static string SetPrices(string packageId, string services)
        {
            try
            {
                int PackageID = Convert.ToInt32(packageId);
                double price = mgtBooking.GetPrice(PackageID, services);
                return price.ToString();
            }
            catch (Exception ex)
            {
                return "0.00";
            }
        }

        public void ShowError(string message)
        {
            lblError.Text = message;
            lblError.ForeColor = System.Drawing.Color.Red;
            lblError.Visible = true;
        }
        public void HideError()
        {
            lblError.Text = "";
            lblError.ForeColor = System.Drawing.Color.Green;
            lblError.Visible = false;
        }
    }
}