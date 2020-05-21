using AutoCareApp.Management;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Org.BouncyCastle.Bcpg;
using AutoCareApp.Models;

namespace AutoCareApp
{
    public partial class SpinToWin : System.Web.UI.Page
    {
        private static int userId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            clsUser user = (clsUser) Session["User"];
            if (user == null || user.IsSpinned)
            {
                Response.Redirect("/Default.aspx");
            }

            if (!IsPostBack)
            {
                userId = user.UserID;
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<int> UpdateUserSpinStatus(int reward)
        {
            //define empty int list
            List<int> couponList = new List<int>();
            //if reward count is greater than 0 then loop number of reward count and add coupon code (if 2 rewards then 2 coupons)
            if (reward > 0)
            {
                //first add number of points into point table/in here number of rewards are multiplied by 5 (1 reward coupon  = 5 points)
                mgtPoint.Add(userId, reward * 5);
                //retive current points object fro the user
                clsPoint points = mgtPoint.GetPoints(userId);

                for (int i = 0; i < reward; i++)
                {
                    //create coupon object 
                    clsCoupon coupon = new clsCoupon();
                    coupon.PointId = points.Id;
                    coupon.Code = GenerateRandomNo();
                    //save coupon
                    mgtCoupon.Add(coupon);
                    //send coupon mail
                    mgtMails.SendCouponCode(userId, coupon.Code);
                    //add each coupon code created into int list 
                    couponList.Add(coupon.Code);
                }
            }


            //update spinned status for the user
            mgtUSer.UpdateUserSpinStatus(userId);
            //return coupon list
            return couponList;

        }

        //Generate RandomNo
        private static int GenerateRandomNo()
        {
            int _min = 100000;
            int _max = 999999;
            Random _rdm = new Random();
            return _rdm.Next(_min, _max);
        }
    }
}