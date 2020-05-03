using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class clsBooking
{
    public int BookingNo { get; set; }
    public int UserID { get; set; }
    public int PackageID { get; set; }
    public string VehicleReg { get; set; }
    public string VehicleMake { get; set; }
    public string VehicleModel { get; set; }
    public string VehicleColor { get; set; }
    public string Address { get; set; }
    public string PostCode { get; set; }
    public DateTime BookingDate { get; set; }
    public string Remarks { get; set; }
    public bool IsPending { get; set; }
    public bool IsCompleted { get; set; }
    public TimeSpan TimeSlot { get; set; }
    public double Total { get; set; }
    public bool PaymentReceived { get; set; }
    public int CouponCode { get; set; }

}