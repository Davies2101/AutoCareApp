using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AutoCareApp.Classes;

namespace AutoCareApp.Management
{
    public class mgtMails
    {

        public static void SendCancelledEmail(int bookingId)
        {
            try
            {
                clsBooking booking = mgtBooking.GetBookingById(bookingId);
                clsUser user = mgtUSer.GetUserByUserId(booking.UserID);
                string emailBody = "<h2>Hello " + user.FullName + ".</h2>" +
                                   "<h3>Your booking #" + booking.BookingNo +
                                   " is canceleld successfully</h3></br></br>";
                emailBody = emailBody + "<p>Thank You, <br>Team AutoCare </p>";
                 

                EmailSender.Send("Booking cancelled successfully!", emailBody, user.Email);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
    }
}