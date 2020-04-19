<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Review.aspx.cs" Inherits="AutoCareApp.Review" %>

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
    <%--https://codepen.io/GeoffreyCrofte/pen/jEkBL--%>
</head>
<body>
    <form id="form1" runat="server">
        <div class="background"></div>
        <div class="container">
            <div class="row">
                <div class="modalbox success col-sm-12 col-md-12 col-lg-12 animate">
                    <asp:Panel ID="panelThankYou" runat="server" Visible="False">
                        <div class="icon">
                            <span><i class="far fa-check-circle" style="font-size: 85px"></i></span>
                        </div>
                        <h1>Thank You!</h1>
                        <a href="Default.aspx" class="btn btn-default">Go to Home</a>
                    </asp:Panel>
                    <asp:Panel ID="panelReviewForm" runat="server">
                        <div class="card">
                            <div class="card-header bg-default">
                                <h3 class="text-white">Rate and Review</h3>
                            </div>
                            <div class="card-body">
                                <div class="ml-auto mr-auto d-block" style="width: 66%">
                                    <div class="rate">
                                        <input type="radio" id="star5" name="rate" value="5" />
                                        <label for="star5" title="5 stars">5 stars</label>
                                        <input type="radio" id="star4" name="rate" value="4" />
                                        <label for="star4" title="4 stars">4 stars</label>
                                        <input type="radio" id="star3" name="rate" value="3" />
                                        <label for="star3" title="3 stars">3 stars</label>
                                        <input type="radio" id="star2" name="rate" value="2" />
                                        <label for="star2" title="2 stars">2 stars</label>
                                        <input type="radio" id="star1" name="rate" value="1" />
                                        <label for="star1" title="1 star">1 star</label>
                                    </div>
                                </div>
                                <asp:TextBox ID="txtReview" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control" placehodler="Share your expereince"></asp:TextBox>

                                <p class="small text-muted">Your review will be posted publicly on the web.</p>
                            </div>
                        </div>
                        <div class="card-footer">
                            <asp:Button ID="btnReview" runat="server" Text="Leave a Review" CssClass="btn btn-default" OnClick="btnReview_OnClick" />
                        </div>
                    </asp:Panel>
                </div>
                <!--/.success-->
            </div>

            <!--/.row-->
        </div>
        <asp:HiddenField ID="hdnStars" runat="server" Value="0" />
        <!--/.container-->
    </form>
    <script src="assets/vendor/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.rate input').click(function () {
                $('#<%= hdnStars.ClientID %>').val($(this).val());
            });
            debugger;
            var uri = window.location.toString();
            if (uri.indexOf("?") > 0) {
                var clean_uri = uri.substring(0, uri.indexOf("?"));
                window.history.replaceState({}, document.title, clean_uri);
            }
        });

        
    </script>
</body>
</html>
