using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AutoCareApp.Management;

namespace AutoCareApp
{
    public partial class AdminMail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            clsUser user = (clsUser)Session["User"];
            if (user == null)
            {
                Response.Redirect("/LoginMsg.aspx");
            }
            else if (!user.AdminLogin)
            {
                Response.Redirect("/Unauthorized.aspx");
            }
            messageBox.Visible = false;
        }

        protected void btnSend_OnClick(object sender, EventArgs e)
        {
            bool isAdmin = true;
            if (ddlUserType.SelectedValue == "1")
            {
                isAdmin = false;
            }

            List<string> emailList = new List<string>();
            DataSet userDataSet = mgtUSer.GetUsersDataSet(isAdmin);
            foreach (DataRow row in userDataSet.Tables[0].Rows)
            {
                //https://stackoverflow.com/questions/23648132/returning-a-column-value-from-a-table-in-dataset
                emailList.Add(row["Email"].ToString());
            }

            mgtMails.SendMailToGroup(Subject.Text, Message.Text, emailList);
            messageBox.Visible = true;
            Subject.Text = "";
            Message.Text = "";
        }
    }
}