using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace AutoCareApp.Management
{
    public class mgtCar
    {
        public static void Add(clsCar car)
        {
            try
            {
                SqlConnection con = new SqlConnection(App.GetDBCon());
                SqlCommand cmd = new SqlCommand("sp_Car_Add", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("UserID", car.UserID);
                cmd.Parameters.AddWithValue("VehicleReg", car.VehicleReg);
                cmd.Parameters.AddWithValue("VehicleMake", car.VehicleMake);
                cmd.Parameters.AddWithValue("VehicleModel", car.VehicleModel);
                cmd.Parameters.AddWithValue("VehicleColor", car.VehicleColor);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static clsCar GetCar(int carId)
        {
            try
            {
                SqlConnection con = new SqlConnection(App.GetDBCon());
                SqlDataReader rd;

                clsCar car = null;

                using (con)
                {
                    SqlCommand cmd = new SqlCommand("sp_Get_Car", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("carId", carId);
                    con.Open();
                    rd = cmd.ExecuteReader();
                    if (rd.Read())
                    {
                        car = new clsCar();
                        car.CarId = Convert.ToInt32(rd["CarId"].ToString());
                        car.UserID = Convert.ToInt32(rd["UserID"].ToString());
                        car.VehicleReg = rd["VehicleReg"].ToString();
                        car.VehicleMake = rd["VehicleMake"].ToString();
                        car.VehicleModel = rd["VehicleModel"].ToString();
                        car.VehicleColor = rd["VehicleColor"].ToString();
                    }
                    rd.Close();
                }

                con.Close();

                return car;
            }
            catch (Exception)
            {

                throw;
            }
        }

        public static DataSet GetCarsDataSet(int userId)
        {
            try
            {
                DataSet ds = new DataSet("dt");
                using (SqlConnection con = new SqlConnection(App.GetDBCon()))
                {
                    SqlCommand cmd = new SqlCommand("sp_Get_AllCars", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("UserID", userId);
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

        public static void Update(clsCar car)
        {
            try
            {
                SqlConnection con = new SqlConnection(App.GetDBCon());
                SqlCommand cmd = new SqlCommand("sp_Car_Update", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("CarId", car.CarId);
                cmd.Parameters.AddWithValue("VehicleReg", car.VehicleReg);
                cmd.Parameters.AddWithValue("VehicleMake", car.VehicleMake);
                cmd.Parameters.AddWithValue("VehicleModel", car.VehicleModel);
                cmd.Parameters.AddWithValue("VehicleColor", car.VehicleColor);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception)
            {

                throw;
            }
        }

        public static void Delete(int carId)
        {
            try
            {
                SqlConnection con = new SqlConnection(App.GetDBCon());
                SqlCommand cmd = new SqlCommand("sp_Car_Delete", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("CarId", carId);
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