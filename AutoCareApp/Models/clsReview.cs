using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AutoCareApp.Models
{
    public class clsReview
    {
        public int Id { get; set; }
        public int BookingNo { get; set; }
        public int UserID { get; set; }
        public string Review { get; set; }
        public int Rating { get; set; }
        public bool Active { get; set; }
    }
}