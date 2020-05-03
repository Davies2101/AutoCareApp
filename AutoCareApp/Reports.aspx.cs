using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using iTextSharp.tool.xml;
using iTextSharp.tool.xml.html;
using iTextSharp.tool.xml.parser;
using iTextSharp.tool.xml.pipeline.css;
using iTextSharp.tool.xml.pipeline.end;
using iTextSharp.tool.xml.pipeline.html;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AutoCareApp
{
    public partial class Reports : System.Web.UI.Page
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

            if (!IsPostBack)
            {
                txtStartDate.Text = string.Format("{0:dd/MM/yyyy}", DateTime.Now);
                txtEndDate.Text = string.Format("{0:dd/MM/yyyy}", DateTime.Now);
            }
        }

        protected void btnRun_OnClick(object sender, EventArgs e)
        {
            string reportType = ddlReprtType.SelectedValue;
            if (reportType == "1")
            {
                //booking report
                BindBookingsReport();
            }
            else if (reportType == "2")
            {
                //sales report
                BindSalesReport();
            }
            else if (reportType == "3")
            {
                //customer report
                BindCustomersReport();
            }
        }

        public void BindBookingsReport()
        {
            lstBookings.DataSource = mgtBooking.GetBookingsByDateDataSet(Convert.ToDateTime(txtStartDate.Text), Convert.ToDateTime(txtEndDate.Text)).Tables[0];
            lstBookings.DataBind();
        }

        public void BindSalesReport()
        {
            lstSales.DataSource = mgtBooking.GetSalesDataSet(Convert.ToDateTime(txtStartDate.Text), Convert.ToDateTime(txtEndDate.Text)).Tables[0];
            lstSales.DataBind();
        }

        public void BindCustomersReport()
        {
            lstCustomers.DataSource = mgtUSer.GetUsersDataSet(true).Tables[0];
            lstCustomers.DataBind();
        }

        protected void btnDownload_OnClick(object sender, EventArgs e)
        {
            //https://stackoverflow.com/questions/19661018/convert-html-with-css-to-pdf-using-itextsharp

            byte[] pdf;
            var cssText = File.ReadAllText(MapPath("~/assets/css/bootstrap.min.css"));
            var html = "";
            string reportName = "";
            StringBuilder stringBuilder = new StringBuilder();
            StringWriter stringWriter = new StringWriter(stringBuilder);
            HtmlTextWriter htmlTextWriter = new HtmlTextWriter(stringWriter);
            string reportType = ddlReprtType.SelectedValue;
            if (reportType == "1")
            {
                //booking report
                panelBookings.RenderControl(htmlTextWriter);
                reportName = "Bookings Report";
            }
            else if (reportType == "2")
            {
                //sales report
                panelSales.RenderControl(htmlTextWriter);
                reportName = "Sales Report";
            }
            else if (reportType == "3")
            {
                //customer report
                panelCustomers.RenderControl(htmlTextWriter);
                reportName = "Customers Report";
            }
            
            html = stringBuilder.ToString();

            using (var memoryStream = new MemoryStream())
            {
                var document = new Document(PageSize.A4, 50, 50, 60, 60);
                document.SetPageSize(iTextSharp.text.PageSize.A4.Rotate());
                var writer = PdfWriter.GetInstance(document, memoryStream);
                document.Open();

                using (var cssMemoryStream = new MemoryStream(System.Text.Encoding.UTF8.GetBytes(cssText)))
                {
                    using (var htmlMemoryStream = new MemoryStream(System.Text.Encoding.UTF8.GetBytes(html)))
                    {
                        XMLWorkerHelper.GetInstance().ParseXHtml(writer, document, htmlMemoryStream, cssMemoryStream);
                    }
                }

                document.Close();
                pdf = memoryStream.ToArray();
            }
            Response.ContentType = "application/pdf";
            Response.BinaryWrite(pdf);
            Response.AddHeader("content-disposition", "attachment;filename=" + reportName + ".pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.End();

        }

        protected void ddlReprtType_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlReprtType.SelectedValue == "1")
            {
                //booking report
                panelBookings.Visible = true;
                panelSales.Visible = false;
                panelCustomers.Visible = false;
                divDatePicker.Visible = true;
            }
            else if (ddlReprtType.SelectedValue == "2")
            {
                //sales report
                panelBookings.Visible = false;
                panelSales.Visible = true;
                panelCustomers.Visible = false;
                divDatePicker.Visible = true;
            }
            else if (ddlReprtType.SelectedValue == "3")
            {
                //customer report
                panelBookings.Visible = false;
                panelSales.Visible = false;
                panelCustomers.Visible = true;
                divDatePicker.Visible = false;
            }
        }
    }
}