using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;

public class mgtBooking
{

    public static void Add(clsBooking obj, string ExtraIDList)
    {
        try
        {
            // Getting the database connectivity as stored procedure
            SqlConnection con = new SqlConnection(App.GetDBCon());
            SqlCommand cmd = new SqlCommand("sp_Booking_Add", con);
            cmd.CommandType = CommandType.StoredProcedure;

            // Passing parameters
            cmd.Parameters.AddWithValue("UserID", obj.UserID);
            cmd.Parameters.AddWithValue("PackageID", obj.PackageID);
            cmd.Parameters.AddWithValue("VehicleReg", obj.VehicleReg);
            cmd.Parameters.AddWithValue("VehicleMake", obj.VehicleMake);
            cmd.Parameters.AddWithValue("VehicleModel", obj.VehicleModel);
            cmd.Parameters.AddWithValue("VehicleColor", obj.VehicleColor);
            cmd.Parameters.AddWithValue("Address", obj.Address);
            cmd.Parameters.AddWithValue("PostCode", obj.PostCode);
            cmd.Parameters.AddWithValue("BookingDate", obj.BookingDate);
            cmd.Parameters.AddWithValue("Remarks", obj.Remarks);
            cmd.Parameters.AddWithValue("TimeSlot", obj.TimeSlot);
            cmd.Parameters.AddWithValue("Total", obj.Total);
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


    public static void Update(clsBooking obj, string ExtraIDList)
    {
        try
        {
            // Getting the database connectivity as stored procedure
            SqlConnection con = new SqlConnection(App.GetDBCon());
            SqlCommand cmd = new SqlCommand("sp_Booking_Update", con);
            cmd.CommandType = CommandType.StoredProcedure;

            // Passing parameters
            cmd.Parameters.AddWithValue("BookingId", obj.BookingNo);
            cmd.Parameters.AddWithValue("PackageID", obj.PackageID);
            cmd.Parameters.AddWithValue("VehicleReg", obj.VehicleReg);
            cmd.Parameters.AddWithValue("VehicleMake", obj.VehicleMake);
            cmd.Parameters.AddWithValue("VehicleModel", obj.VehicleModel);
            cmd.Parameters.AddWithValue("VehicleColor", obj.VehicleColor);
            cmd.Parameters.AddWithValue("Address", obj.Address);
            cmd.Parameters.AddWithValue("PostCode", obj.PostCode);
            cmd.Parameters.AddWithValue("BookingDate", obj.BookingDate);
            cmd.Parameters.AddWithValue("Remarks", obj.Remarks);
            cmd.Parameters.AddWithValue("TimeSlot", obj.TimeSlot);
            cmd.Parameters.AddWithValue("Total", obj.Total);
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

    public static clsVehicle GetVehicle(string VehicleReg)
    {
        try
        {
            SqlConnection con = new SqlConnection(App.GetDBCon());
            SqlDataReader rd;

            clsVehicle obj = null;

            using (con)
            {
                // Getting the database connectivity using stored procedure
                SqlCommand cmd = new SqlCommand("sp_Booking_GetVehicle", con);
                cmd.CommandType = CommandType.StoredProcedure;

                // Passing parameters
                cmd.Parameters.AddWithValue("VehicleReg", VehicleReg);

                con.Open();
                rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    // Reads return values to see criteria matches DB Users 
                    obj = new clsVehicle();

                    obj.VehicleReg = rd["VehicleReg"].ToString();
                    obj.VehicleMake = rd["VehicleMake"].ToString();
                    obj.VehicleModel = rd["VehicleModel"].ToString();
                    obj.VehicleColor = rd["VehicleColor"].ToString();

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

    public static double GetPrice(int PackageID, string ServiceIDList)
    {
        try
        {
            SqlConnection con = new SqlConnection(App.GetDBCon());
            SqlDataReader rd;

            double obj = 0;

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
                    obj = Convert.ToInt32(rd[0]);
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

    public static DataSet GetActiveBookings()
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

    public static DataSet GetMyBookings(int userId)
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

    public static DataSet GetBookingsByDate(DateTime startDate, DateTime endDate)
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
}