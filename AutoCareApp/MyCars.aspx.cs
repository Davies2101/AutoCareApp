using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AutoCareApp.Management;

namespace AutoCareApp
{
    public partial class MyCars : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Load curent pofile info
            clsUser user = (clsUser)Session["User"];
            if (user == null)
            {
                Response.Redirect("LoginMsg");
            }

            if (user.AdminLogin)
            {
                Response.Redirect("/Unauthorized.aspx");
            }

            if (!IsPostBack)
            {
                lblFullName.Text = user.FullName;
                profileimg.ImageUrl = "/Content/profile/" + user.Picture;
                BindMyCars();
            }

            messageBox.Visible = false;

        }



        public void BindMyCars()
        {
            clsUser user = (clsUser) Session["User"];
            lstCars.DataSource = mgtCar.GetCarsDataSet(user.UserID).Tables[0];
            lstCars.DataBind();
        }

        protected void btnEdit_OnClick(object sender, EventArgs e)
        {
            Button button = (sender as Button);
            int carId = Convert.ToInt32(button.Attributes["CarId"]);
            clsCar car = mgtCar.GetCar(carId);
            hdnCarId.Value = car.CarId.ToString();
            VehicleReg.Text = car.VehicleReg;
            VehicleColor.Text = car.VehicleColor;
            VehicleMake.Text = car.VehicleMake;
            VehicleModel.Text = car.VehicleModel;
            btnUpdate.Text = "Update";
        }

        protected void btnDelete_OnClick(object sender, EventArgs e)
        {
            Button button = (sender as Button);
            int carId = Convert.ToInt32(button.Attributes["CarId"]);
            mgtCar.Delete(carId);
            lblMessage.Text = "Car deleted successfully!";
            messageBox.Visible = true;
            BindMyCars();
        }

        protected void btnUpdate_OnClick(object sender, EventArgs e)
        {
            clsUser user = (clsUser)Session["User"];
            clsCar car = new clsCar();
            car.CarId = Convert.ToInt32(hdnCarId.Value);
            car.VehicleReg = VehicleReg.Text;
            car.VehicleColor = VehicleColor.Text;
            car.VehicleMake = VehicleMake.Text;
            car.VehicleModel = VehicleModel.Text;
            car.UserID = user.UserID;

            if (car.CarId > 0)
            {
                mgtCar.Update(car);
                lblMessage.Text = "Car details updated successfully!";
            }
            else
            {
                mgtCar.Add(car);
                lblMessage.Text = "Car details added successfully!";
            }
            messageBox.Visible = true;
            ClearForm();
            BindMyCars();
        }

        protected void btnClear_OnClick(object sender, EventArgs e)
        {
            ClearForm();
        }

        public void ClearForm()
        {
            hdnCarId.Value = "0";
            VehicleReg.Text = "";
            VehicleColor.Text = "";
            VehicleMake.Text = "";
            VehicleModel.Text = "";
            btnUpdate.Text = "Add";
        }
    }
}