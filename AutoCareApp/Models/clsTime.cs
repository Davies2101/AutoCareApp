using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AutoCareApp.Models
{
    public class clsTime
    {
        public string Time { get; set; }
        public TimeSpan Value { get; set; }
        public bool IsAvailable { get; set; } = true;
    }
}