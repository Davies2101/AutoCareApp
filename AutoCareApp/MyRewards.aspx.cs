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
    public partial class MyRewards : System.Web.UI.Page
    {
        private static clsPoint points = null;
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
                BindCoupons();
            }
            
            messageBox.Visible = false;
            warningBox.Visible = false;
        }

        protected void btnGenerateCoupon_OnClick(object sender, EventArgs e)
        {
            if (points.Points < 5)
            {
                messageBox.Visible = false;
                warningBox.Visible = true;
                lblWarnMessage.Text = "You dont have enough points to redeem!";
            }
            else
            {
                clsCoupon coupon = new clsCoupon();
                coupon.PointId = points.Id;
                coupon.Code = GenerateRandomNo();
                mgtCoupon.Add(coupon);
                warningBox.Visible = false;
                messageBox.Visible = true;
                lblMessage.Text = "Coupon code generated: " + coupon.Code;
                BindCoupons();
            }
        }

        //https://stackoverflow.com/questions/33749543/unique-4-digit-random-number-in-c-sharp/33749610
        //Generate RandomNo
        public int GenerateRandomNo()
        {
            int _min = 100000;
            int _max = 999999;
            Random _rdm = new Random();
            return _rdm.Next(_min, _max);
        }

        public void BindCoupons()
        {
            clsUser user = (clsUser)Session["User"];
            points = mgtPoint.GetPoints(user.UserID);
            lstCoupon.DataSource = mgtCoupon.GetCouponsDataSet(points.Id).Tables[0];
            lstCoupon.DataBind();

            lblTotal.Text = points.TotalPoints.ToString();
            lblRedeemed.Text = points.Redeemed.ToString();
            lblPoints.Text = points.Points.ToString();
            int progress = 100;
            if (points.Points < 5)
            {
                progress = (points.Points * 100) / 5;
            }
            divProgree.Attributes.Add("class", "c100 p" + progress + " big");
            lblProgress.Text = progress + "%";

        }
    }
}