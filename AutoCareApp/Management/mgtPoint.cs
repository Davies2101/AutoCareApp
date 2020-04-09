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
        public static void Add(int userId)
        {
            try
            {
                SqlConnection con = new SqlConnection(App.GetDBCon());
                SqlCommand cmd = new SqlCommand("sp_Point_Add", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("UserID", userId);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static void Remove(int userId)
        {
            try
            {
                // Getting the database connectivity as stored procedure
                SqlConnection con = new SqlConnection(App.GetDBCon());
                SqlCommand cmd = new SqlCommand("sp_Point_Remove", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("UserId", userId);
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