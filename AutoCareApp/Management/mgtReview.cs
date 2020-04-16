using AutoCareApp.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace AutoCareApp.Management
{
    public class mgtReview
    {
        public static DataSet GetReviewsDataSet(bool isActiveOnly)
        {
            try
            {
                DataSet ds = new DataSet("dt");

                // Getting the database connectivity as stored procedure
                using (SqlConnection con = new SqlConnection(App.GetDBCon()))
                {
                    SqlCommand cmd = new SqlCommand("sp_Get_Reviews", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("activeOnly", isActiveOnly);

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

        public static void Add(clsReview review)
        {
            try
            {
                SqlConnection con = new SqlConnection(App.GetDBCon());
                SqlCommand cmd = new SqlCommand("sp_Review_Add", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("BookingNo", review.BookingNo);
                cmd.Parameters.AddWithValue("UserID", review.UserID);
                cmd.Parameters.AddWithValue("Review", review.Review);
                cmd.Parameters.AddWithValue("Rating", review.Rating);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static void UpdateOrDelete(int reviewId, bool isActive, bool isDelete)
        {
            try
            {
                // Getting the database connectivity using stored procedure
                SqlConnection con = new SqlConnection(App.GetDBCon());
                SqlCommand cmd = new SqlCommand("sp_Review_UpdateOrDelete", con);
                cmd.CommandType = CommandType.StoredProcedure;

                // Passing parameters
                cmd.Parameters.AddWithValue("reviewId", reviewId);
                cmd.Parameters.AddWithValue("isActive", isActive);
                cmd.Parameters.AddWithValue("isDelete", isDelete);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}