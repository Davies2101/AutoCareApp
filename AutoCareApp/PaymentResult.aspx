<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentResult.aspx.cs" Inherits="AutoCareApp.PaymentResult" %>

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
        <div class="background"></div><div class="container">

            <asp:Panel ID="panelSuccess" runat="server" Visible="True">
                <div class="row">
                    <div class="modalbox success col-sm-12 col-md-12 col-lg-12 animate">
                        <div class="icon">
                            <span><i class="far fa-check-circle" style="font-size: 85px"></i></span>
                        </div>
                        <!--/.icon-->
                        <h1>Payment Successful!</h1>
                        <p>
                            We've sent a confirmation to your e-mail.
                       
                        </p>
                        <asp:Button ID="btnReview" runat="server" Text="Leave a Review" CssClass="btn btn-default" OnClick="btnReview_OnClick" OnClientClick="leaveReview();" />
                    </div>
                    <!--/.success-->
                </div>
            </asp:Panel>
            <!--/.row-->
            <asp:Panel ID="panelFailed" runat="server" Visible="False">
                <div class="row">
                    <div class="modalbox error col-sm-12 col-md-12 col-lg-12 animate">
                        <div class="icon">
                            <span><i class="far fa-times-circle" style="font-size: 85px"></i></span>
                        </div>
                        <!--/.icon-->
                        <h1>Payment Failed!</h1>
                        <p>
                            Please contact the administrator.
                       
                        </p>

                    </div>
                    <!--/.success-->
                </div>
            </asp:Panel>
            <!--/.row-->
        </div>
        <!--/.container-->
        <asp:HiddenField ID="hdnLeaveReviewClicked" runat="server" Value="false" />
    </form>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#modal-review").modal('show');
        });

        function leaveReview() {
            $('#<%= hdnLeaveReviewClicked.ClientID %>').val('true');
        }
    </script>
</body>
</html>



