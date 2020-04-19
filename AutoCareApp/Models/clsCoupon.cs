using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AutoCareApp.Models
{
    public class clsCoupon
    {
        public int CouponId { get; set; }
        public int Code { get; set; }
        public int PointId { get; set; }
        public bool IsActive { get; set; }
    }
}