<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Unauthorized.aspx.cs" Inherits="AutoCareApp.Unauthorized" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">

    <!-- Icons -->
    <link href="/assets/vendor/nucleo/css/nucleo.css" rel="stylesheet" />
    <link href="/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />

    <!-- Argon CSS -->
    <link type="text/css" href="/assets/css/argon.min.css" rel="stylesheet" />
    <link href="/Content/Payment.css" rel="stylesheet" />
    <%--https://codepen.io/brycesnyder/pen/GpRKXo--%>
</head>
<body>
<form id="form1" runat="server">
    <div class="container">
        <div class="row">
            <div class="modalbox error col-sm-12 col-md-12 col-lg-12 animate">
                <div class="icon">
                    <span><i class="fas fa-ban" style="font-size: 85px"></i></span> 
                </div>
                <!--/.icon-->
                <h1>Unauthorized Access!</h1>
                <p>
                    Access is denied.
                </p>

            </div>
            <!--/.success-->
        </div>
    </div>
    <!--/.container-->
</form>
</body>
</html>
