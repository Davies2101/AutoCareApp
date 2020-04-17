using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;

public class mgtPackage
{
    public static DataSet GetPackagesDataSet()
    {
        try
        {
            DataSet ds = new DataSet("dt");

            // Getting the database connectivity as stored procedure
            using (SqlConnection con = new SqlConnection(App.GetDBCon()))
            {
                SqlCommand cmd = new SqlCommand("sp_Package_All", con);
                //sqlComm.Parameters.AddWithValue("@TimeRange", TimeRange);

                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;

                // Getting the data and filing to data set variable
                da.Fill(ds);
            }

            return ds;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public static List<int> GetMostlyPickedPackages()
    {
        List<int> counts = new List<int>();

        List<int> list = new List<int>(); ;
        SqlDataReader rd;
        using (SqlConnection con = new SqlConnection(App.GetDBCon()))
        {
            SqlCommand cmd = new SqlCommand("sp_Get_MostlyPickedPackages", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                counts.Add(Convert.ToInt32(rd["Count"]));
            }
            rd.Close();
        }
        return counts;
    }
}