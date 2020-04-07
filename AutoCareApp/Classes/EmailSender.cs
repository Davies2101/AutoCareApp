using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace AutoCareApp.Classes
{
    public class EmailSender
    {
        public static void Send(string subject, string mailBody, string emaillAddress)
        {
            using (MailMessage client = new MailMessage())
            {
                client.From = new MailAddress("autocarebookings@gmail.com");
                client.Subject = subject;
                client.Body = mailBody;
                client.IsBodyHtml = true;
                client.To.Add(new MailAddress(emaillAddress));
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
                NetworkCred.UserName = "autocarebookings@gmail.com";
                NetworkCred.Password = "AutoCare2101";
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 587;
                smtp.Send(client);
            }
        }
    }
}