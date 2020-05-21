<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SpinToWin.aspx.cs" Inherits="AutoCareApp.SpinToWin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro" rel="stylesheet">
    <style>
        body {
            background: #9ee1f7;
        }

        .spin-container {
            width: 600px;
            margin: 0 auto;
        }

        .copy h1 {
            color: #ffffff;
            text-align: center;
            font-family: "Source Sans Pro", sans-serif;
            font-size: 60px;
        }

        .wrapper {
            margin: 0 0 30px;
            position: relative;
        }

        .pointer-wrapper {
            position: absolute;
            top: -25px;
            left: 46%;
            z-index: 1;
        }

        .btn-spin {
            margin: 0 0 40px;
        }

        .btn-spin {
            display: block;
            cursor: pointer;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            margin: 0 auto;
            width: 250px;
            height: 60px;
            color: #ffffff;
            background: #e01a22;
        }

            .btn-spin:hover {
                background: #f08d90;
            }

            .btn-spin:focus {
                outline: 0;
            }

        .spanner {
            position: absolute;
            top: 50%;
            left: 0;
            background: #2a2a2a55;
            width: 100%;
            display: block;
            text-align: center;
            height: 300px;
            color: #fff;
            transform: translateY(-50%);
            z-index: 1000;
            visibility: hidden;
        }

        .overlay {
            position: fixed;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            visibility: hidden;
        }

        .loader,
        .loader:before,
        .loader:after {
            border-radius: 50%;
            width: 2.5em;
            height: 2.5em;
            -webkit-animation-fill-mode: both;
            animation-fill-mode: both;
            -webkit-animation: load7 1.8s infinite ease-in-out;
            animation: load7 1.8s infinite ease-in-out;
        }

        .loader {
            color: #ffffff;
            font-size: 10px;
            margin: 80px auto;
            position: relative;
            text-indent: -9999em;
            -webkit-transform: translateZ(0);
            -ms-transform: translateZ(0);
            transform: translateZ(0);
            -webkit-animation-delay: -0.16s;
            animation-delay: -0.16s;
        }

            .loader:before,
            .loader:after {
                content: "";
                position: absolute;
                top: 0;
            }

            .loader:before {
                left: -3.5em;
                -webkit-animation-delay: -0.32s;
                animation-delay: -0.32s;
            }

            .loader:after {
                left: 3.5em;
            }

        @-webkit-keyframes load7 {
            0%, 80%, 100% {
                box-shadow: 0 2.5em 0 -1.3em;
            }

            40% {
                box-shadow: 0 2.5em 0 0;
            }
        }

        @keyframes load7 {
            0%, 80%, 100% {
                box-shadow: 0 2.5em 0 -1.3em;
            }

            40% {
                box-shadow: 0 2.5em 0 0;
            }
        }

        .show {
            visibility: visible;
        }

        .spanner,
        .overlay {
            opacity: 0;
            -webkit-transition: all 0.3s;
            -moz-transition: all 0.3s;
            transition: all 0.3s;
        }

            .spanner.show,
            .overlay.show {
                opacity: 1;
            }
    </style>
    <div class="spin-container">
        <div class="copy">
            <h1>Spin to Win!</h1>
        </div>
        <div class="wrapper">
            <div class="pointer-wrapper">
                <img src="/Content/images/wheel-pointer-v2.png" alt="pointer">
            </div>
            <img src="/Content/images/spin-wheel-v2.png" alt="spping wheel" class="wheel">
        </div>
        <div class="button">
            <button id="btnSpin" class="btn btn-spin" type="button">Spin</button>
        </div>
    </div>
    <div class="modal fade" id="modal-on-pageload" tabindex="-1" role="dialog" aria-labelledby="modal-notification" aria-hidden="true">
        <div class="modal-dialog modal-info modal-dialog-centered modal-" role="document">
            <div class="modal-content bg-gradient-info">
                <div class="modal-body">
                    <div class="text-center">
                        <i class="far fa-smile fa-4x"></i>
                        <h2 class="heading mt-4">Is it your Lucky Day?</h2>
                    </div>
                </div>
                <div class="modal-footer">
                    <a href="/Default.aspx" class="btn btn-white mr-auto">Skip</a>
                    <button type="button" class="btn btn-default ml-auto" data-dismiss="modal">Try Your Luck</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modal-message" tabindex="-1" role="dialog" aria-labelledby="modal-notification" aria-hidden="true">
        <div class="modal-dialog modal-success modal-dialog-centered modal-" role="document">
            <div class="modal-content bg-gradient-success">
                <div class="modal-body">
                    <div class="text-center">
                        <h4 class="heading mt-4">
                            <label id="lblMessage"></label>
                        </h4>
                        <div id="couponCodes"></div>
                        <div id="dvCountDown" style="display: none; font-size: small;">You will be redirected to Home in <span id="lblCount"></span>&nbsp;seconds.</div>
                    </div>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-white mr-auto" data-dismiss="modal">Ok</a>
                    <a href="/Booking.aspx" class="btn btn-default ml-auto" id="btnGoToBookNow">Go Book Now</a>
                </div>
            </div>
        </div>
    </div>
    <div class="overlay"></div>
    <div class="spanner">
        <div class="loader"></div>
        <p>Please wait...</p>
    </div>
    <input id="hdnSpinAgain" type="hidden" value="1" />

    <script src="/assets/vendor/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#modal-on-pageload").modal('show');
        });
        $("#btnSpin").click(function () {
            if ($('#hdnSpinAgain').val() != "0") {
                var spin = Math.floor(Math.random() * 10 + 1) * 36;
                $(".wheel").rotate({
                    angle: 0,
                    animateTo: 720 + spin,
                    duration: 6000
                });
                setTimeout(function () {
                    $(".wheel").stopRotate();
                    showReward($(".wheel").getRotateAngle()[0]);
                },
                    6000);
            } else {
                $("#btnSpin").attr('disabled', 'disabled');
            }
        });


        function showReward(rotateAngle) {
            var reward = getReward(rotateAngle);
            var message = "";
            if (reward == -1) {
                message = "You have earned another chance to spin and win!";
            } else if (reward > 0) {
                message = "You have won " + reward + " x £5 worth coupon(s)";
                $('#hdnSpinAgain').val('0');
            } else {
                message = "Today is not your lucky day!";
                $('#hdnSpinAgain').val('0');
            }
           
            updateUserSpinStatus(reward, message);
        }

        function getReward(rotateAngle) {
            var angle = (rotateAngle - 720);
            if (angle >= 0 && angle <= 18) {
                return 2;
            } else if (angle >= 19 && angle <= 54) {
                return -1;
            } else if (angle >= 55 && angle <= 92) {
                return 5;
            } else if (angle >= 91 && angle <= 126) {
                return 0;
            } else if (angle >= 127 && angle <= 162) {
                return 1;
            } else if (angle >= 163 && angle <= 198) {
                return 0;
            } else if (angle >= 199 && angle <= 234) {
                return 4;
            } else if (angle >= 235 && angle <= 270) {
                return -1;
            } else if (angle >= 271 && angle <= 306) {
                return 3;
            } else if (angle >= 307 && angle <= 342) {
                return 0;
            } else if (angle >= 343 && angle <= 360) {
                return 2;
            }
        }

        function updateUserSpinStatus(reward, message) {
            
            if (reward >= 0) {
                showLoading();
                $.ajax({
                    type: "POST",
                    url: "<%= ResolveUrl("SpinToWin.aspx/UpdateUserSpinStatus") %>",
                    data: JSON.stringify({ 'reward': reward }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        $('#couponCodes').html('');
                        if (response.d.length > 0) {
                            for (var i = 0; i < response.d.length; i++) {
                                $('#couponCodes').append('<p><b>' + response.d[i] + '</b></p>');
                            }
                            $('#couponCodes').append('<p>You can find above coupons under "My Rewards" section.</p>');
                        }
                        $('#btnGoToBookNow').show();
                        $('#lblMessage').text(message);
                        $("#modal-message").modal('show');
                        hideLoading();
                        redirectToHome();
                    },
                    failure: function (response) {
                        return 0;
                    }
                });
            } else {
                $('#couponCodes').html('');
                $('#btnGoToBookNow').hide();
                $('#lblMessage').text(message);
                $("#modal-message").modal('show');
                redirectToHome();
            }

        }


        function showLoading() {
            $("div.spanner").addClass("show");
            $("div.overlay").addClass("show");
        }

        function hideLoading() {
            $("div.spanner").removeClass("show");
            $("div.overlay").removeClass("show");
        }

        function redirectToHome() {
            var seconds = 5;
            var dvCountDown = document.getElementById("dvCountDown");
            var lblCount = document.getElementById("lblCount");
            dvCountDown.style.display = "block";
            lblCount.innerHTML = seconds;
            setInterval(function () {
                seconds--;
                lblCount.innerHTML = seconds;
                if (seconds == 0) {
                    window.location = "Booking.aspx";
                }
            }, 1000);
        }
    </script>
</asp:Content>


<%--ref https://codepen.io/umng/pen/wZzbbQ--%>
<%--refs https://codepen.io/kunal04/pen/WOgRoX--%>