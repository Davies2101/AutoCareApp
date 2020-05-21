using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class clsUser
{
    public int UserID { get; set; }
    public string FullName { get; set; }
    public string Username { get; set; }
    public string Password { get; set; }
    public string Email { get; set; }
    public string PhoneNumber { get; set; }
    public bool AdminLogin { get; set; }
    public int FailedLoginAttempts { get; set; }
    public DateTime? LockedOutDatetime { get; set; }
    public string Picture { get; set; }
    public bool IsSpinned { get; set; }
}