using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

public class App
{
    public static string GetDBCon()
    {
        // Reading the connection string from web.config file
        string cnn = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        return cnn;
    }
}