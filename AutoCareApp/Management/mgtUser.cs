using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;

public class mgtUSer
{
    public static clsUser Login(string Username, string Password)
    {
        try
        {
            SqlConnection con = new SqlConnection(App.GetDBCon());
            SqlDataReader rd;

            clsUser obj = null;

            using (con)
            {
                // Getting the database connectivity using stored procedure
                SqlCommand cmd = new SqlCommand("sp_User_Login", con);
                cmd.CommandType = CommandType.StoredProcedure;

                // Passing parameters
                cmd.Parameters.AddWithValue("Username", Username);
                cmd.Parameters.AddWithValue("Password", Password);

                con.Open();
                rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    // Reads return values to see criteria matches DB Users 
                    obj = new clsUser();

                    obj.UserID = Convert.ToInt32(rd["UserID"]);
                    obj.FullName = rd["FullName"].ToString();
                    obj.Username = rd["Username"].ToString();
                    obj.Password = rd["Password"].ToString();
                    obj.Email = rd["Email"].ToString();
                    obj.PhoneNumber = rd["PhoneNumber"].ToString();

                }
                rd.Close();
            }
            con.Close();

            return obj;
        }
        catch (Exception)
        {

            throw;
        }
    }

    public static void Register(clsUser obj)
    {
        try
        {
            // Getting the database connectivity using stored procedure
            SqlConnection con = new SqlConnection(App.GetDBCon());
            SqlCommand cmd = new SqlCommand("sp_User_Register", con);
            cmd.CommandType = CommandType.StoredProcedure;

            // Passing parameters
            cmd.Parameters.AddWithValue("FullName", obj.FullName);
            cmd.Parameters.AddWithValue("Username", obj.Username);
            cmd.Parameters.AddWithValue("Password", obj.Password);
            cmd.Parameters.AddWithValue("Email", obj.Email);
            cmd.Parameters.AddWithValue("PhoneNumber", obj.PhoneNumber);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception)
        {

            throw;
        }
    }

    public static void Update(clsUser obj)
    {
        try
        {
            // Getting the database connectivity using stored procedure
            SqlConnection con = new SqlConnection(App.GetDBCon());
            SqlCommand cmd = new SqlCommand("sp_User_Update", con);
            cmd.CommandType = CommandType.StoredProcedure;

            // Passing parameters
            cmd.Parameters.AddWithValue("UserID", obj.UserID);
            cmd.Parameters.AddWithValue("FullName", obj.FullName);
            cmd.Parameters.AddWithValue("Username", obj.Username);
            cmd.Parameters.AddWithValue("Password", obj.Password);
            cmd.Parameters.AddWithValue("Email", obj.Email);
            cmd.Parameters.AddWithValue("PhoneNumber", obj.PhoneNumber);

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