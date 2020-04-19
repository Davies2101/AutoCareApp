using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using AutoCareApp.Models;

namespace AutoCareApp.Management
{
    public class mgtCoupon
    {
        public static void Add(clsCoupon coupon)
        {
            try
            {
                SqlConnection con = new SqlConnection(App.GetDBCon());
                SqlCommand cmd = new SqlCommand("sp_Coupon_Add", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("Code", coupon.Code);
                cmd.Parameters.AddWithValue("PointId", coupon.PointId);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static void Update(clsCoupon coupon)
        {
            try
            {
                SqlConnection con = new SqlConnection(App.GetDBCon());
                SqlCommand cmd = new SqlCommand("sp_Coupon_Update", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("CouponId", coupon.Code);
                cmd.Parameters.AddWithValue("PointId", coupon.PointId);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static DataSet GetCouponsDataSet(int pointId)
        {
            try
            {
                DataSet ds = new DataSet("dt");
                using (SqlConnection con = new SqlConnection(App.GetDBCon()))
                {
                    SqlCommand cmd = new SqlCommand("sp_Get_Coupons", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("PointId", pointId);
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    da.Fill(ds);
                }

                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}