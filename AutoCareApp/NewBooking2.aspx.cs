using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AutoCareApp
{
    public partial class NewBooking2 : System.Web.UI.Page
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
                    cmbPackage.SelectedValue = PackageID;
                }
                CalculatePrices();

                // Focusing on vehicle reg field 
                VehicleReg.Focus();
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
                obj.PackageID = Convert.ToInt32(cmbPackage.SelectedValue);
                obj.VehicleReg = VehicleReg.Text;
                obj.VehicleMake = VehicleMake.Text;
                obj.VehicleModel = VehicleModel.Text;
                obj.VehicleColor = VehicleColor.Text;
                obj.Address = Address.Text;
                obj.PostCode = PostCode.Text;
                obj.BookingDate = DateTime.Now;
                obj.Remarks = Remarks.Text;

                List<string> selectedValues = chkServiceList.Items.Cast<ListItem>()
                   .Where(li => li.Selected)
                   .Select(li => li.Value)
                   .ToList();

                string ServiceIDList = string.Join(",", selectedValues);

                // Saving the new object (booking)
                mgtBooking.Add(obj, ServiceIDList);

                // Displays success message
                lblError.Text = "Booking saved successfully";
                lblError.ForeColor = System.Drawing.Color.Green;

                panelPopup.Visible = true;
            }
            catch (Exception ex)
            {
                // displays error messsage
                lblError.Text = ex.Message;
                lblError.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void LoadPackages()
        {
            DataTable dt = mgtPackage.GetDataSet().Tables[0];
            cmbPackage.DataValueField = "PackageID";
            cmbPackage.DataTextField = "PackageName";
            cmbPackage.DataSource = dt;
            cmbPackage.DataBind();

            cmbPackage.SelectedIndex = 0;
        }

        protected void LoadServices()
        {
            DataTable dt = mgtService.GetDataSet().Tables[0];
            chkServiceList.DataValueField = "ServiceID";
            chkServiceList.DataTextField = "ServiceName";
            chkServiceList.DataSource = dt;
            chkServiceList.DataBind();

        }

        protected void CalculatePrices()
        {
            try
            {
                int PackageID = Convert.ToInt32(cmbPackage.SelectedValue);

                List<string> selectedValues = chkServiceList.Items.Cast<ListItem>()
                   .Where(li => li.Selected)
                   .Select(li => li.Value)
                   .ToList();

                string ServiceIDList = string.Join(",", selectedValues);

                double price = mgtBooking.GetPrice(PackageID, ServiceIDList);

                lblPrice.Text = price.ToString("N");

                lblError.Text = "";
                lblError.ForeColor = System.Drawing.Color.Green;
            }
            catch (Exception ex)
            {
                // displays error messsage
                lblError.Text = ex.Message;
                lblError.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void cmbPackage_SelectedIndexChanged(object sender, EventArgs e)
        {
            CalculatePrices();
        }

        protected void chkServiceList_SelectedIndexChanged(object sender, EventArgs e)
        {
            CalculatePrices();
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

                lblError.Text = "";
                lblError.ForeColor = System.Drawing.Color.Green;
            }
            catch (Exception ex)
            {
                // displays error messsage
                lblError.Text = ex.Message;
                lblError.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}