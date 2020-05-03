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
                
            }
        }

        public static void SendPaymentLink(int bookingId, string encodedBookingId)
        {
            try
            {
                HttpContext context = HttpContext.Current;
                string baseUrl = context.Request.Url.Scheme + "://" + context.Request.Url.Authority + context.Request.ApplicationPath.TrimEnd('/') + '/';
                string pageurl = baseUrl + "BookingPayment.aspx?id=" + encodedBookingId;
                string paymentLink = "<a href='" + pageurl + "'>Click Here</a>";
                
                clsBooking booking = mgtBooking.GetBookingById(bookingId);
                clsUser user = mgtUSer.GetUserByUserId(booking.UserID);
                string emailBody = "<h2>Hello " + user.FullName + ".</h2>" +
                                   "<h3>Your booking #" + booking.BookingNo +
                                   " is completed successfully</h3></br></br>";
                emailBody = emailBody + "<p>Please " + paymentLink + " to proceed the payment.</p></br></br>";
                emailBody = emailBody + "<p>Thank You, <br>Team AutoCare </p>";


                EmailSender.Send("Booking completed successfully!", emailBody, user.Email);
            }
            catch (Exception ex)
            {
                
            }
        }

        public static void SendPaymentCompletedMail(int userId)
        {
            try
            {
                clsUser user = mgtUSer.GetUserByUserId(userId);
                string emailBody = "<h2>Hello " + user.FullName + ".</h2>" +
                                   "<h3>Your payment is successful.</h3></br></br>";
                emailBody = emailBody + "<p>Thank You, <br>Team AutoCare </p>";
                EmailSender.Send("Payment Received!", emailBody, user.Email);
            }
            catch (Exception ex)
            {
                
            }
        }


        public static void SendCouponCode(int userId, int code)
        {
            try
            {
                clsUser user = mgtUSer.GetUserByUserId(userId);
                string emailBody = "<h2>Hello " + user.FullName + ".</h2>" +
                                   "<h3>Here is your £5 coupon.</h3></br></br>" +
                                   "<h2>Coupon Code # " + code + "</h2>";
                emailBody = emailBody + "<p>Thank You, <br>Team AutoCare </p>";
                EmailSender.Send("Coupon Code!", emailBody, user.Email);
            }
            catch (Exception ex)
            {

            }
        }

        public static void SendMailToGroup(string subject, string bodyMessage, List<string> emailList)
        {
            try
            {
                EmailSender.SendToList(subject, bodyMessage, emailList);
            }
            catch (Exception ex)
            {

            }
        }
    }
}