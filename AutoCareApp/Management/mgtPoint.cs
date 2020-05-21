using AutoCareApp.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace AutoCareApp.Management
{
    public class mgtPoint
    {
        public static void Add(int userId, int points)
        {
            try
            {
                SqlConnection con = new SqlConnection(App.GetDBCon());
                SqlCommand cmd = new SqlCommand("sp_Point_Add", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("UserID", userId);
                cmd.Parameters.AddWithValue("Points", points);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static clsPoint GetPoints(int userId)
        {
            try
            {
                SqlConnection con = new SqlConnection(App.GetDBCon());
                SqlDataReader rd;

                clsPoint point = new clsPoint();

                using (con)
                {
                    SqlCommand cmd = new SqlCommand("sp_Get_Points", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("userId", userId);
                    con.Open();
                    rd = cmd.ExecuteReader();
                    if (rd.Read())
                    {
                        point = new clsPoint();
                        point.TotalPoints = Convert.ToInt32(rd["TotalPoints"].ToString());
                        point.Points = Convert.ToInt32(rd["Points"].ToString());
                        point.Redeemed = Convert.ToInt32(rd["Redeemed"].ToString());
                        point.UserId = Convert.ToInt32(rd["UserId"].ToString());
                        point.Id = Convert.ToInt32(rd["Id"].ToString());
                    }
                    rd.Close();
                }

                con.Close();

                return point;
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}