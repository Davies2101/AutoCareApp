using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Net;
using System.Net.Mail;

namespace AutoCareApp
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Focusing on Name field 
            ContactName.Focus();
        }

        protected void ContactSend_Click(object sender, EventArgs e)
        {
            // Creating email format and from to addresses

            MailAddress to = new MailAddress("autocarebookings@gmail.com");
            MailAddress from = new MailAddress("contactus@autocarebookings.com"); 

            MailMessage message = new MailMessage(from, to);
            message.Subject = "AutoCare Contact";
            
            // Creating email body
            string BodyMsg = "We have received a contact from AutoCare website.\n\n";
            BodyMsg += "Name: " + ContactName.Text + "\n";
            BodyMsg += "Email: " + Email.Text + "\n\n";
            BodyMsg += "Subject: " + Subject.Text + "\n";
            BodyMsg += "Message: " + Message.Text + "\n\n";
            BodyMsg += "Thank you!";

            message.Body = BodyMsg;

            // Set Email server and creditials
            SmtpClient client = new SmtpClient("smtp.gmail.com", 587)
            {
                Credentials = new NetworkCredential("autocarebookings@gmail.com", "AutoCare2101"),
                EnableSsl = true
            };

            try
            {
                // Success sending email message
                client.Send(message);

                lblError.Text = "Messsage sent successfully";
                lblError.ForeColor = System.Drawing.Color.Green;

                panelPopup.Visible = true;
            }
            catch (SmtpException ex)
            {
                // Displays error message
                lblError.Text = ex.Message;
                lblError.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}

