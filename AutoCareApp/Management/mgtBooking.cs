﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;

public class mgtBooking
{

    public static void Add(clsBooking booking, string ExtraIDList)
    {
        try
        {
            // Getting the database connectivity as stored procedure
            SqlConnection con = new SqlConnection(App.GetDBCon());
            SqlCommand cmd = new SqlCommand("sp_Booking_Add", con);
            cmd.CommandType = CommandType.StoredProcedure;

            // Passing parameters
            cmd.Parameters.AddWithValue("UserID", booking.UserID);
            cmd.Parameters.AddWithValue("PackageID", booking.PackageID);
            cmd.Parameters.AddWithValue("VehicleReg", booking.VehicleReg);
            cmd.Parameters.AddWithValue("VehicleMake", booking.VehicleMake);
            cmd.Parameters.AddWithValue("VehicleModel", booking.VehicleModel);
            cmd.Parameters.AddWithValue("VehicleColor", booking.VehicleColor);
            cmd.Parameters.AddWithValue("Address", booking.Address);
            cmd.Parameters.AddWithValue("PostCode", booking.PostCode);
            cmd.Parameters.AddWithValue("BookingDate", booking.BookingDate);
            cmd.Parameters.AddWithValue("Remarks", booking.Remarks);
            cmd.Parameters.AddWithValue("TimeSlot", booking.TimeSlot);
            cmd.Parameters.AddWithValue("Total", booking.Total);
            cmd.Parameters.AddWithValue("CouponCode", booking.CouponCode);
            cmd.Parameters.AddWithValue("ExtraIDList", ExtraIDList);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception)
        {
            throw;
        }
    }

    public static void Update(clsBooking booking, string ExtraIDList)
    {
        try
        {
            // Getting the database connectivity as stored procedure
            SqlConnection con = new SqlConnection(App.GetDBCon());
            SqlCommand cmd = new SqlCommand("sp_Booking_Update", con);
            cmd.CommandType = CommandType.StoredProcedure;

            // Passing parameters
            cmd.Parameters.AddWithValue("BookingId", booking.BookingNo);
            cmd.Parameters.AddWithValue("PackageID", booking.PackageID);
            cmd.Parameters.AddWithValue("VehicleReg", booking.VehicleReg);
            cmd.Parameters.AddWithValue("VehicleMake", booking.VehicleMake);
            cmd.Parameters.AddWithValue("VehicleModel", booking.VehicleModel);
            cmd.Parameters.AddWithValue("VehicleColor", booking.VehicleColor);
            cmd.Parameters.AddWithValue("Address", booking.Address);
            cmd.Parameters.AddWithValue("PostCode", booking.PostCode);
            cmd.Parameters.AddWithValue("BookingDate", booking.BookingDate);
            cmd.Parameters.AddWithValue("Remarks", booking.Remarks);
            cmd.Parameters.AddWithValue("TimeSlot", booking.TimeSlot);
            cmd.Parameters.AddWithValue("Total", booking.Total);
            cmd.Parameters.AddWithValue("ExtraIDList", ExtraIDList);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception)
        {
            throw;
        }
    }

    

    public static double GetPrice(int PackageID, string ServiceIDList)
    {
        try
        {
            SqlConnection con = new SqlConnection(App.GetDBCon());
            SqlDataReader rd;

            double price = 0;

            using (con)
            {
                // Getting the database connectivity using stored procedure
                SqlCommand cmd = new SqlCommand("sp_Booking_GetPrice", con);
                cmd.CommandType = CommandType.StoredProcedure;

                // Passing parameters
                cmd.Parameters.AddWithValue("PackageID", PackageID);
                cmd.Parameters.AddWithValue("ServiceIDList", ServiceIDList);

                con.Open();
                rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    // Reads return values to see criteria matches DB Users 
                    price = Convert.ToInt32(rd[0]);
                }

                rd.Close();
            }

            con.Close();

            return price;
        }
        catch (Exception)
        {

            throw;
        }
    }

    public static DataSet GetActiveBookingsDataSet()
    {
        try
        {
            DataSet ds = new DataSet("dt");

            // Getting the database connectivity as stored procedure
            using (SqlConnection con = new SqlConnection(App.GetDBCon()))
            {
                SqlCommand cmd = new SqlCommand("sp_ActiveBookings_All", con);
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

    public static DataSet GetMyBookingsDataSet(int userId)
    {
        try
        {
            DataSet ds = new DataSet("dt");

            // Getting the database connectivity as stored procedure
            using (SqlConnection con = new SqlConnection(App.GetDBCon()))
            {
                SqlCommand cmd = new SqlCommand("sp_Get_MyBookings", con);
                //sqlComm.Parameters.AddWithValue("@TimeRange", TimeRange);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("userId", userId);
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

    public static void CancelBooking(int bookingId)
    {
        try
        {
            // Getting the database connectivity as stored procedure
            SqlConnection con = new SqlConnection(App.GetDBCon());
            SqlCommand cmd = new SqlCommand("sp_Booking_Cancel", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("BookingId", bookingId);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception)
        {
            throw;
        }
    }

    public static DataSet GetBookingsByDateDataSet(DateTime startDate, DateTime endDate)
    {
        try
        {
            DataSet ds = new DataSet("dt");

            // Getting the database connectivity as stored procedure
            using (SqlConnection con = new SqlConnection(App.GetDBCon()))
            {
                SqlCommand cmd = new SqlCommand("sp_Get_BookingsByDate", con);
                //sqlComm.Parameters.AddWithValue("@TimeRange", TimeRange);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("startDate", startDate);
                cmd.Parameters.AddWithValue("endDate", endDate);
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

    public static clsBooking GetBookingById(int bookingId)
    {
        try
        {
            SqlConnection con = new SqlConnection(App.GetDBCon());
            SqlDataReader rd;

            clsBooking booking = null;

            using (con)
            {
                // Getting the database connectivity using stored procedure
                SqlCommand cmd = new SqlCommand("sp_Get_BookingById", con);
                cmd.CommandType = CommandType.StoredProcedure;

                // Passing parameters
                cmd.Parameters.AddWithValue("bookingId", bookingId);

                con.Open();
                rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    booking = new clsBooking();

                    booking.Address = rd["Address"].ToString();
                    booking.BookingDate = Convert.ToDateTime(rd["BookingDate"].ToString());
                    booking.BookingNo = Convert.ToInt32(rd["BookingNo"].ToString());
                    booking.IsCompleted = Convert.ToBoolean(rd["IsCompleted"].ToString());
                    booking.IsPending = Convert.ToBoolean(rd["IsPending"].ToString());
                    booking.PackageID = Convert.ToInt32(rd["PackageID"].ToString());
                    booking.PostCode = rd["PostCode"].ToString();
                    booking.Remarks = rd["Remarks"].ToString();
                    booking.TimeSlot = Convert.ToDateTime(rd["TimeSlot"].ToString()).TimeOfDay;
                    booking.Total = Convert.ToDouble(rd["Total"].ToString());
                    booking.UserID = Convert.ToInt32(rd["UserID"].ToString());
                    booking.VehicleReg = rd["VehicleReg"].ToString();
                    booking.PaymentReceived = Convert.ToBoolean(rd["PaymentReceived"].ToString());
                    booking.CouponCode = Convert.ToInt32(rd["CouponCode"].ToString());
                }

                rd.Close();
            }

            con.Close();

            return booking;
        }
        catch (Exception)
        {

            throw;
        }
    }

    public static void CompleteBooking(int bookingId)
    {
        try
        {
            SqlConnection con = new SqlConnection(App.GetDBCon());
            SqlCommand cmd = new SqlCommand("sp_Booking_Complete", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("BookingId", bookingId);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception)
        {
            throw;
        }
    }

    public static int GetTotalCompletedBookings()
    {
        int count = 0;
        using (SqlConnection con = new SqlConnection(App.GetDBCon()))
        {
            SqlCommand cmd = new SqlCommand("sp_Get_TotalCompletedBookings", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            count = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
        }

        return count;
    }

    public static double GetTotalSales()
    {
        double total = 0;
        using (SqlConnection con = new SqlConnection(App.GetDBCon()))
        {
            SqlCommand cmd = new SqlCommand("sp_Get_TotalSales", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            total = Convert.ToDouble(cmd.ExecuteScalar());
            con.Close();
        }

        return total;
    }

    public static int GetCurrentBookings()
    {
        int count = 0;
        using (SqlConnection con = new SqlConnection(App.GetDBCon()))
        {
            SqlCommand cmd = new SqlCommand("sp_Get_CurrentBookings", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            count = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
        }

        return count;
    }

    public static Dictionary<string, int> GetWeeklySales()
    {
        Dictionary<string, int> saleDictionary = new Dictionary<string, int>();
        saleDictionary["Monday"] = 0;
        saleDictionary["Tuesday"] = 0;
        saleDictionary["Wednesday"] = 0;
        saleDictionary["Thursday"] = 0;
        saleDictionary["Friday"] = 0;
        saleDictionary["Saturday"] = 0;
        saleDictionary["Sunday"] = 0;

        SqlDataReader rd;
        using (SqlConnection con = new SqlConnection(App.GetDBCon()))
        {
            SqlCommand cmd = new SqlCommand("sp_get_WeeklySales", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                if (saleDictionary.ContainsKey(rd["Day"].ToString()))
                {
                    saleDictionary[rd["Day"].ToString()] = Convert.ToInt32(rd["Total"]);
                }
            }
            rd.Close();
        }
        return saleDictionary;
    }

    public static DataSet GetSalesDataSet(DateTime startDate, DateTime endDate)
    {
        try
        {
            DataSet ds = new DataSet("dt");

            // Getting the database connectivity as stored procedure
            using (SqlConnection con = new SqlConnection(App.GetDBCon()))
            {
                SqlCommand cmd = new SqlCommand("sp_Get_BookingSales", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("startDate", startDate);
                cmd.Parameters.AddWithValue("endDate", endDate);
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

    public static void UpdatePayment(int bookingId)
    {
        try
        {
            SqlConnection con = new SqlConnection(App.GetDBCon());
            SqlCommand cmd = new SqlCommand("sp_Payment_Complete", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("BookingId", bookingId);
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