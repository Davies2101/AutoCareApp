using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;

public class mgtUSer
{
    public static clsUser GetUserByUsername(string username)
    {
        try
        {
            SqlConnection con = new SqlConnection(App.GetDBCon());
            SqlDataReader rd;

            clsUser user = null;

            using (con)
            {
                // Getting the database connectivity using stored procedure
                SqlCommand cmd = new SqlCommand("sp_User_Login", con);
                cmd.CommandType = CommandType.StoredProcedure;
                // Passing parameters
                cmd.Parameters.AddWithValue("Username", username);

                con.Open();
                rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    // Reads return values to see criteria matches DB Users 
                    user = new clsUser();

                    user.UserID = Convert.ToInt32(rd["UserID"]);
                    user.FullName = rd["FullName"].ToString();
                    user.Username = rd["Username"].ToString();
                    user.Password = rd["Password"].ToString();
                    user.Email = rd["Email"].ToString();
                    user.PhoneNumber = rd["PhoneNumber"].ToString();
                    user.AdminLogin = Convert.ToBoolean(rd["AdminLogin"].ToString());
                    user.FailedLoginAttempts = Convert.ToInt32(rd["FailedLoginAttempts"].ToString());
                    user.LockedOutDatetime = rd["LockedOutDatetime"] == DBNull.Value ? (DateTime?)null : (DateTime)rd["LockedOutDatetime"];
                    user.Picture = rd["Picture"].ToString();
                    user.IsSpinned = Convert.ToBoolean(rd["IsSpinned"].ToString());

                }
                rd.Close();
            }
            con.Close();

            return user;
        }
        catch (Exception)
        {

            throw;
        }
    }

    public static void Register(clsUser user)
    {
        try
        {
            // Getting the database connectivity using stored procedure
            SqlConnection con = new SqlConnection(App.GetDBCon());
            SqlCommand cmd = new SqlCommand("sp_User_Register", con);
            cmd.CommandType = CommandType.StoredProcedure;

            // Passing parameters
            cmd.Parameters.AddWithValue("FullName", user.FullName);
            cmd.Parameters.AddWithValue("Username", user.Username);
            cmd.Parameters.AddWithValue("Password", user.Password);
            cmd.Parameters.AddWithValue("Email", user.Email);
            cmd.Parameters.AddWithValue("PhoneNumber", user.PhoneNumber);
            cmd.Parameters.AddWithValue("AdminLogin", user.AdminLogin);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception)
        {

            throw;
        }
    }

    public static void Update(clsUser user)
    {
        try
        {
            // Getting the database connectivity using stored procedure
            SqlConnection con = new SqlConnection(App.GetDBCon());
            SqlCommand cmd = new SqlCommand("sp_User_Update", con);
            cmd.CommandType = CommandType.StoredProcedure;

            // Passing parameters
            cmd.Parameters.AddWithValue("UserID", user.UserID);
            cmd.Parameters.AddWithValue("FullName", user.FullName);
            cmd.Parameters.AddWithValue("Username", user.Username);
            cmd.Parameters.AddWithValue("Password", user.Password);
            cmd.Parameters.AddWithValue("Email", user.Email);
            cmd.Parameters.AddWithValue("PhoneNumber", user.PhoneNumber);
            cmd.Parameters.AddWithValue("Picture", user.Picture);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception)
        {

            throw;
        }
    }

    public static bool ValidateUsername(string username)
    {
        SqlConnection con = new SqlConnection(App.GetDBCon());
        SqlCommand cmd = new SqlCommand("sp_User_CheckUsername", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("Username", username);
        con.Open();
        int rowCount = (int)cmd.ExecuteScalar();
        con.Close();
        if (rowCount > 0)
        {
            return false;
        }

        return true;
    }

    public static void UpdateFailedLoginAttempts(int userId)
    {
        try
        {
            // Getting the database connectivity using stored procedure
            SqlConnection con = new SqlConnection(App.GetDBCon());
            SqlCommand cmd = new SqlCommand("sp_User_UpdateFailedAttempts", con);
            cmd.CommandType = CommandType.StoredProcedure;

            // Passing parameters
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

    public static void ResetFailedLoginAttempts(int userId)
    {
        try
        {
            // Getting the database connectivity using stored procedure
            SqlConnection con = new SqlConnection(App.GetDBCon());
            SqlCommand cmd = new SqlCommand("sp_User_ResetFailedAttempts", con);
            cmd.CommandType = CommandType.StoredProcedure;

            // Passing parameters
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

    public static clsUser GetUserByUserId(int userId)
    {
        try
        {
            SqlConnection con = new SqlConnection(App.GetDBCon());
            SqlDataReader rd;

            clsUser user = null;

            using (con)
            {
                // Getting the database connectivity using stored procedure
                SqlCommand cmd = new SqlCommand("sp_Get_UserById", con);
                cmd.CommandType = CommandType.StoredProcedure;
                // Passing parameters
                cmd.Parameters.AddWithValue("userId", userId);

                con.Open();
                rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    // Reads return values to see criteria matches DB Users 
                    user = new clsUser();

                    user.UserID = Convert.ToInt32(rd["UserID"]);
                    user.FullName = rd["FullName"].ToString();
                    user.Username = rd["Username"].ToString();
                    user.Password = rd["Password"].ToString();
                    user.Email = rd["Email"].ToString();
                    user.PhoneNumber = rd["PhoneNumber"].ToString();
                    user.AdminLogin = Convert.ToBoolean(rd["AdminLogin"].ToString());
                    user.FailedLoginAttempts = Convert.ToInt32(rd["FailedLoginAttempts"].ToString());
                    user.LockedOutDatetime = rd["LockedOutDatetime"] == DBNull.Value ? (DateTime?)null : (DateTime)rd["LockedOutDatetime"];

                }
                rd.Close();
            }
            con.Close();

            return user;
        }
        catch (Exception)
        {

            throw;
        }
    }

    public static int GetTotalCustomers()
    {
        int count = 0;
        using (SqlConnection con = new SqlConnection(App.GetDBCon()))
        {
            SqlCommand cmd = new SqlCommand("sp_Get_TotalCustomers", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            count = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
        }

        return count;
    }

    public static DataSet GetUsersDataSet(bool admin)
    {
        try
        {
            DataSet ds = new DataSet("dt");

            // Getting the database connectivity as stored procedure
            using (SqlConnection con = new SqlConnection(App.GetDBCon()))
            {
                SqlCommand cmd = new SqlCommand("sp_Get_AllUsers", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("admin", admin);
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

    public static void Delete(int userId)
    {
        try
        {
            SqlConnection con = new SqlConnection(App.GetDBCon());
            SqlCommand cmd = new SqlCommand("sp_User_Delete", con);
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

    public static void UpdateUserSpinStatus(int userId)
    {
        try
        {
            SqlConnection con = new SqlConnection(App.GetDBCon());
            SqlCommand cmd = new SqlCommand("sp_User_UpdateUserSpinStatus", con);
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
}