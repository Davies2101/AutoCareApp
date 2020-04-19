using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AutoCareApp.Models
{
    public class clsPoint
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public int TotalPoints { get; set; }
        public int Points { get; set; }
        public int Redeemed { get; set; }
    }
}