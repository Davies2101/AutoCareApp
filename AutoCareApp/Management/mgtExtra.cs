using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;

public class mgtExtra
{
    public static DataSet GetExtrasDataSet()
    {
        try
        {
            DataSet ds = new DataSet("dt");

            // Getting the database connectivity as stored procedure
            using (SqlConnection con = new SqlConnection(App.GetDBCon()))
            {
                SqlCommand cmd = new SqlCommand("sp_Extra_All", con);
                cmd.CommandType = CommandType.StoredProcedure;

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

    public static List<string> GetExtrasByBookingId(int bookingId)
    {
        try
        {
            SqlConnection con = new SqlConnection(App.GetDBCon());
            SqlDataReader rd;

            List<string> list = new List<string>();

            using (con)
            {
                // Getting the database connectivity using stored procedure
                SqlCommand cmd = new SqlCommand("sp_Get_ExtrasByBookingId", con);
                cmd.CommandType = CommandType.StoredProcedure;
                // Passing parameters
                cmd.Parameters.AddWithValue("bookingId", bookingId);

                con.Open();
                rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    list.Add(rd["ExtraID"].ToString());
                }
                rd.Close();
            }
            con.Close();

            return list;
        }
        catch (Exception)
        {

            throw;
        }
    }
}