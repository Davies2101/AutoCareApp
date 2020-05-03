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
        protected void Page_Load(object sender, EventArgs e)
        {
            // Load curent pofile info
            clsUser user = (clsUser)Session["User"];
            if (user == null)
            {
                Response.Redirect("/LoginMsg.aspx");
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
        }

        public void BindCoupons()
        {
            clsUser user = (clsUser)Session["User"];
            clsPoint points = mgtPoint.GetPoints(user.UserID);
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