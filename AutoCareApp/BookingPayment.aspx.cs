using AutoCareApp.Classes;
using PayPal.Api;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AutoCareApp.Management;
using AutoCareApp.Models;

namespace AutoCareApp
{
    public partial class BookingPayment : System.Web.UI.Page
    {
        private static clsBooking bookingObject = null;
        private static DataTable packageList = mgtPackage.GetPackagesDataSet().Tables[0];
        private static DataTable extrasList = mgtExtra.GetExtrasDataSet().Tables[0];
        private static List<string> selectedExtras = null;
        private static List<Item> bookingItemList = new List<Item>();
        private static double bookingTotal = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] == null && Request.Params["PayerID"] == null)
                {
                    Response.Redirect("/Default.aspx");
                }

                if (Request.QueryString["id"] != null)
                {
                    int bookingId = Convert.ToInt32(Server.UrlDecode(Cipher.Decrypt(Request.QueryString["id"])));
                    bookingObject = mgtBooking.GetBookingById(bookingId);
                    selectedExtras = mgtExtra.GetExtrasByBookingId(bookingId);
                    GenerateBookingSummary();
                }
                
                if (bookingObject.PaymentReceived)
                {
                    Response.Redirect("/InvalidRequest.aspx");
                }

                if (Request.QueryString["id"] != null)
                {
                    Session["bid"] = Request.QueryString["id"];
                }
                
            }

            if (Request.Params["PayerID"] != null)
            {
                PaymentWithPaypal();
            }
        }

        public void GenerateBookingSummary()
        {
            double packagePrice = 0;
            double extraTotal = 0;
            bookingTotal = 0;
            if (bookingObject.PackageID > 0)
            {
                DataView dv = new DataView(packageList);
                dv.RowFilter = "PackageID=" + bookingObject.PackageID.ToString();
                foreach (DataRowView drV in dv)
                {
                    //create item
                    Item item = new Item()
                    {
                        name = drV["PackageName"].ToString(),
                        currency = "GBP",
                        price = drV["PackagePrice"].ToString(),
                        quantity = "1"
                    };
                    //add item to item list
                    bookingItemList.Add(item);

                    //set values to booking summary
                    lblPackageName.Text = item.name;
                    packagePrice = Convert.ToDouble(item.price);
                    lblPackagePrice.Text = string.Format("{0:0.00}", packagePrice);
                   
                }
            }

            List<clsExtra> extras = new List<clsExtra>();
            if (selectedExtras.Count > 0)
            {
                lblServices.Visible = true;
                foreach (var extraId in selectedExtras)
                {
                    DataView dv = new DataView(extrasList);
                    dv.RowFilter = "ExtraID=" + extraId;

                    clsExtra extra = new clsExtra();
                    foreach (DataRowView drV in dv)
                    {
                        //create item
                        Item item = new Item()
                        {
                            name = drV["ExtraName"].ToString(),
                            currency = "GBP",
                            price = drV["ExtraPrice"].ToString(),
                            quantity = "1"
                        };
                        //add item to item list
                        bookingItemList.Add(item);

                        //set values to booking summary extra list
                        extra.ExtraPrice = Convert.ToDouble(item.price);
                        extraTotal = extraTotal + extra.ExtraPrice;
                        extra.ExtraName = item.name;
                    }

                    extras.Add(extra);
                }
            }

            if (extras.Count > 0)
            {
                lstViewExtras.DataSource = extras;
                lstViewExtras.DataBind();
            }

            bookingTotal = extraTotal + packagePrice;
            lblTotal.Text = string.Format("{0:0.00}", bookingTotal);
            lblBookingDateAndTime.Text = string.Format("{0:dd/MM/yyyy}", bookingObject.BookingDate) + " " + DateTime.Today.Add(bookingObject.TimeSlot).ToString("hh:mm tt");
        }
        protected void btnPay_OnClick(object sender, EventArgs e)
        {
            PaymentWithPaypal();
        }
        public void PaymentWithPaypal(string Cancel = null)
        {
            string redirectUrl = "";
            //getting the apiContext  
            APIContext apiContext = PaypalConfiguration.GetAPIContext();
            try
            {
                //A resource representing a Payer that funds a payment Payment Method as paypal  
                //Payer Id will be returned when payment proceeds or click to pay  
                string payerId = Request.Params["PayerID"];
                if (string.IsNullOrEmpty(payerId))
                {
                    //this section will be executed first because PayerID doesn't exist  
                    //it is returned by the create function call of the payment class  
                    // Creating a payment  
                    // baseURL is the url on which paypal sendsback the data.  
                    string baseURI = Request.Url.Scheme + "://" + Request.Url.Authority + "/BookingPayment.aspx/PaymentWithPayPal?";
                    //here we are generating guid for storing the paymentID received in session  
                    //which will be used in the payment execution  
                    var guid = Convert.ToString((new Random()).Next(100000));
                    //CreatePayment function gives us the payment approval url  
                    //on which payer is redirected for paypal account payment  
                    var createdPayment = this.CreatePayment(apiContext, baseURI + "guid=" + guid);
                    //get links returned from paypal in response to Create function call  
                    var links = createdPayment.links.GetEnumerator();
                    string paypalRedirectUrl = null;
                    while (links.MoveNext())
                    {
                        Links lnk = links.Current;
                        if (lnk.rel.ToLower().Trim().Equals("approval_url"))
                        {
                            //saving the payapalredirect URL to which user will be redirected for payment  
                            paypalRedirectUrl = lnk.href;
                        }
                    }
                    // saving the paymentID in the key guid  
                    Session.Add(guid, createdPayment.id);
                    redirectUrl = paypalRedirectUrl;
                }
                else
                {
                    // This function exectues after receving all parameters for the payment  
                    var guid = Request.Params["guid"];
                    var executedPayment = ExecutePayment(apiContext, payerId, Session[guid] as string);
                    //If executed payment failed then we will show payment failure message to user  
                    if (executedPayment.state.ToLower() != "approved")
                    {
                        Session["PaymentStatus"] = false;
                        Session["bid"] = null;
                    }
                    else
                    {
                        Session["PaymentStatus"] = true;
                        mgtBooking.UpdatePayment(bookingObject.BookingNo);
                        GenerateCoupon(bookingObject.UserID);
                        mgtMails.SendPaymentCompletedMail(bookingObject.UserID);
                    }
                    redirectUrl = "/PaymentResult.aspx";
                }
            }
            catch (Exception ex)
            {
                Session["PaymentStatus"] = false;
                Session["bid"] = null;
                redirectUrl = "/PaymentResult.aspx";
            }
            Response.Redirect(redirectUrl);
        }
        private PayPal.Api.Payment payment;
        private Payment ExecutePayment(APIContext apiContext, string payerId, string paymentId)
        {
            var paymentExecution = new PaymentExecution()
            {
                payer_id = payerId
            };
            this.payment = new Payment()
            {
                id = paymentId
            };
            return this.payment.Execute(apiContext, paymentExecution);
        }
        private Payment CreatePayment(APIContext apiContext, string redirectUrl)
        {
            //create itemlist and add item objects to it  
            var itemList = new ItemList()
            {
                items = new List<Item>()
            };
            //Adding Item Details like name, currency, price etc  
            itemList.items.AddRange(bookingItemList);
            var payer = new Payer()
            {
                payment_method = "paypal"
            };
            // Configure Redirect Urls here with RedirectUrls object  
            var redirUrls = new RedirectUrls()
            {
                cancel_url = redirectUrl + "&Cancel=true",
                return_url = redirectUrl
            };
          
            //Final amount with details  
            var amount = new Amount()
            {
                currency = "GBP",
                total = bookingTotal.ToString() // Total must be equal to sum of tax, shipping and subtotal.  
            };
            var transactionList = new List<Transaction>();
            // Adding description about the transaction  
            transactionList.Add(new Transaction()
            {
                description = "Auto Care - Payment",
                invoice_number = "INV"+ bookingObject.BookingNo.ToString(), //Generate an Invoice No  
                amount = amount,
                item_list = itemList
            });
            this.payment = new Payment()
            {
                intent = "sale",
                payer = payer,
                transactions = transactionList,
                redirect_urls = redirUrls
            };
            // Create a payment using a APIContext  
            return this.payment.Create(apiContext);
        }


        private void GenerateCoupon(int userId)
        {
            clsPoint points = mgtPoint.GetPoints(userId);
            if (points.Points == 5)
            {
                clsCoupon coupon = new clsCoupon();
                coupon.PointId = points.Id;
                coupon.Code = GenerateRandomNo();
                mgtCoupon.Add(coupon);
                mgtMails.SendCouponCode(userId, coupon.Code);

            }
        }

        //https://stackoverflow.com/questions/33749543/unique-4-digit-random-number-in-c-sharp/33749610
        //Generate RandomNo
        public int GenerateRandomNo()
        {
            int _min = 100000;
            int _max = 999999;
            Random _rdm = new Random();
            return _rdm.Next(_min, _max);
        }

    }
}