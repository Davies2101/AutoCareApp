using Syn.Chat;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AutoCareApp
{
    public partial class ChatService : System.Web.UI.Page
    {
        private static readonly ChatAgent Agent;
        static ChatService()
        {
            //Change the "rootUrl" variable to your Website's domain name
            var rootUrl = HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority);
            Agent = new ChatAgent
            {
                ServiceUrl = rootUrl + "/ChatService.aspx",
                ResourceUrl = rootUrl + "/Assistant",
                Name = "Book-bot",
                Title = "Live Chat",
                Intro = "Hi, I am Book-bot, I am here to help assist and answer any questions in regards to your bookings.",
                InputText = "What can I help you with?",
                Footer = "Auto Care",
                FooterLink = rootUrl,
                RestartId = "restart",
                PackageFileName = "Package.txt"
            };
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Agent.Process(Request, Response);
        }
    }
}