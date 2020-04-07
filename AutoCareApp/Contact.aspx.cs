using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Net;
using System.Net.Mail;
using AutoCareApp.Classes;

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
            // Creating email body
            string BodyMsg = "We have received a contact from AutoCare website.\n\n";
            BodyMsg += "Name: " + ContactName.Text + "\n";
            BodyMsg += "Email: " + Email.Text + "\n\n";
            BodyMsg += "Subject: " + Subject.Text + "\n";
            BodyMsg += "Message: " + Message.Text + "\n\n";
            BodyMsg += "Thank you!";
            try
            {
                // Success sending email message
                //client.Send(message);
                EmailSender.Send("AutoCare Contact", BodyMsg, "autocarebookings@gmail.com");
                alertBox.Visible = false;
                panelPopup.Visible = true;
            }
            catch (Exception ex)
            {
                // Displays error message
                AlertMessage("Something went wrong. Please try again!");
            }
        }

        public void AlertMessage(string message)
        {
            lblAlert.Text = message;
            alertBox.Visible = true;
        }
    }
}

