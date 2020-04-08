using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;

public class mgtExtra
{
    public static DataSet GetDataSet()
    {
        try
        {
            DataSet ds = new DataSet("dt");

            // Getting the database connectivity as stored procedure
            using (SqlConnection conn = new SqlConnection(App.GetDBCon()))
            {
                SqlCommand sqlComm = new SqlCommand("sp_Extra_All", conn);
                sqlComm.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = sqlComm;
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