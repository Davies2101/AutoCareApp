<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="AutoCareApp.Register" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="alertBox" runat="server" Visible="False">
        <div class="alert alert-danger alert-dismissible fade show text-center" role="alert">
            <span class="alert-text">
                <asp:Label ID="lblAlert" runat="server" Text=""></asp:Label></span>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </asp:Panel>
    <div class="container">
        <div class="section text-center">
            <div class="row">
                <div class="col-md-10 ml-auto mr-auto">
                    <div class="card card-login">
                        <div class="card-header card-header-primary text-center">
                            <h2>Register</h2>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="bmd-form-group col-md-6">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <i class="far fa-grin-alt"></i>
                                            </span>
                                        </div>
                                        <asp:TextBox runat="server" ID="FullName" CssClass="form-control fullname" TextMode="SingleLine" placeholder="Full Name" />
                                    </div>
                                    <span id="popover-fullname" class="text-danger small" style="visibility: hidden;">The Full Name is required.</span>
                                </div>
                                <div class="bmd-form-group col-md-6">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <i class="fas fa-phone"></i>
                                            </span>
                                        </div>
                                        <asp:TextBox runat="server" ID="PhoneNumber" CssClass="form-control phonenumber" TextMode="Number" placeholder="Phone Number" />
                                    </div>
                                    <span id="popover-phonenumber" class="text-danger small" style="visibility: hidden;">Enter a valid Phone Number.</span>
                                </div>
                            </div>

                            <div class="row">
                                <div class="bmd-form-group col-md-6">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <i class="fas fa-user"></i>
                                            </span>
                                        </div>
                                        <asp:TextBox runat="server" ID="Username" CssClass="form-control username" TextMode="SingleLine" placeholder="Username" />
                                    </div>
                                    <span id="popover-username" class="text-danger small" style="visibility: hidden;">The Username is required.</span>
                                </div>

                                <div class="bmd-form-group col-md-6">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <i class="fas fa-at"></i>
                                            </span>
                                        </div>
                                        <asp:TextBox runat="server" ID="Email" CssClass="form-control email" TextMode="Email" placeholder="Email" />
                                    </div>
                                    <span id="popover-email" class="text-danger small" style="visibility: hidden;">Enter an valid Email Address.</span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="bmd-form-group col-md-6">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <i class="fas fa-lock"></i>
                                            </span>
                                        </div>
                                        <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control password" placeholder="Password" />
                                    </div>
                                    <span id="popover-password-top" class="text-danger small" style="visibility: hidden;">Enter a strong Password.</span>

                                    <div id="popover-password">
                                        <p class="small">Password Strength: <span id="result"></span></p>
                                        <div class="progress">
                                            <div id="password-strength" class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                                            </div>
                                        </div>
                                        <ul class="list-unstyled text-left ml-auto mr-auto w-75 small">
                                            <li class=""><span class="low-upper-case"><i class="fa fa-file-text" aria-hidden="true"></i></span>&nbsp;1 lowercase &amp; 1 uppercase</li>
                                            <li class=""><span class="one-number"><i class="fa fa-file-text" aria-hidden="true"></i></span>&nbsp;1 number (0-9)</li>
                                            <li class=""><span class="one-special-char"><i class="fa fa-file-text" aria-hidden="true"></i></span>&nbsp;1 Special Character (!@#$%^&*).</li>
                                            <li class=""><span class="eight-character"><i class="fa fa-file-text" aria-hidden="true"></i></span>&nbsp; Atleast 8 Character</li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="bmd-form-group col-md-6">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <i class="fas fa-unlock"></i>
                                            </span>
                                        </div>
                                        <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control confirm-password" placeholder="Confirm Password" />
                                    </div>
                                    <span id="popover-confirmpassword" class="text-danger small" style="visibility: hidden;">Password don't match.</span>
                                </div>
                            </div>
                        </div>
                        <div class="footer text-center mb-3">
                            <asp:Button ID="btnCreateUser" runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-default" OnClientClick="return validateForm();" />
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:Panel ID="messageBox" runat="server" Visible="False">
        <div class="modal fade" id="modal-notification" tabindex="-1" role="dialog" aria-labelledby="modal-notification" aria-hidden="true">
            <div class="modal-dialog modal-success modal-dialog-centered modal-" role="document">
                <div class="modal-content bg-gradient-success">
                    <div class="modal-body">
                        <div class="text-center">
                            <i class="far fa-check-circle fa-4x"></i>
                            <h4 class="heading mt-4">Admin added successfully!</h4>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-white ml-auto" data-dismiss="modal">Ok</button>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
    <script src="/assets/vendor/jquery/dist/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        var OKClick = function () {
            window.location.replace("Default.aspx");
            event.preventDefault();
        }


        $(document).ready(function () {
            $("#modal-notification").modal('show');

            window.onunload = function (e) {
                e = e || window.event;
                var y = e.pageY || e.clientY;
                if (y < 0) { alert("Window closed"); }
                else { validateForm(); }
            }            

            $('.email').blur(function () {
                validateEmail();
            });
            $('.password').keyup(function () {
                validatePassword();
            });
            $('.confirm-password').blur(function () {
                validateConfirmPassword();
            });
            $('.phonenumber').blur(function () {
                validatePhone();
            });
            $('.fullname').blur(function () {
                valdiateFullname();
            });

            $('.username').blur(function () {
                valdiateUsername();
            });
        });

        function IsEmail(email) {
            var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            if (!regex.test(email)) {
                return false;
            } else {
                return true;
            }
        }
        function checkStrength(password) {
            var strength = 0;
            //If password contains both lower and uppercase characters, increase strength value.
            if (password.match(/([a-z].*[A-Z])|([A-Z].*[a-z])/)) {
                strength += 1;
                $('.low-upper-case').addClass('text-success');
                $('.low-upper-case i').removeClass('fa-file-text').addClass('fa-check');
                $('#popover-password-top').css('visibility', 'hidden');


            } else {
                $('.low-upper-case').removeClass('text-success');
                $('.low-upper-case i').addClass('fa-file-text').removeClass('fa-check');
                $('#popover-password-top').css('visibility', 'visible');
            }

            //If it has numbers and characters, increase strength value.
            if (password.match(/([a-zA-Z])/) && password.match(/([0-9])/)) {
                strength += 1;
                $('.one-number').addClass('text-success');
                $('.one-number i').removeClass('fa-file-text').addClass('fa-check');
                $('#popover-password-top').css('visibility', 'hidden');

            } else {
                $('.one-number').removeClass('text-success');
                $('.one-number i').addClass('fa-file-text').removeClass('fa-check');
                $('#popover-password-top').css('visibility', 'visible');
            }

            //If it has one special character, increase strength value.
            if (password.match(/([!,%,&,@,#,$,^,*,?,_,~])/)) {
                strength += 1;
                $('.one-special-char').addClass('text-success');
                $('.one-special-char i').removeClass('fa-file-text').addClass('fa-check');
                $('#popover-password-top').css('visibility', 'hidden');

            } else {
                $('.one-special-char').removeClass('text-success');
                $('.one-special-char i').addClass('fa-file-text').removeClass('fa-check');
                $('#popover-password-top').css('visibility', 'visible');
            }

            if (password.length > 7) {
                strength += 1;
                $('.eight-character').addClass('text-success');
                $('.eight-character i').removeClass('fa-file-text').addClass('fa-check');
                $('#popover-password-top').css('visibility', 'hidden');

            } else {
                $('.eight-character').removeClass('text-success');
                $('.eight-character i').addClass('fa-file-text').removeClass('fa-check');
                $('#popover-password-top').css('visibility', 'visible');
            }

            // If value is less than 2

            if (strength < 2) {
                $('#result').removeClass()
                $('#password-strength').addClass('progress-bar-danger');
                $('#result').addClass('text-danger').text('Very Week');
                $('#password-strength').css('width', '10%');
                return 'Very Week';
            } else if (strength == 2) {
                $('#result').addClass('good');
                $('#password-strength').removeClass('progress-bar-danger');
                $('#password-strength').addClass('progress-bar-warning');
                $('#result').addClass('text-warning').text('Week')
                $('#password-strength').css('width', '60%');
                return 'Week';
            } else if (strength == 4) {
                $('#result').removeClass()
                $('#result').addClass('strong');
                $('#password-strength').removeClass('progress-bar-warning');
                $('#password-strength').addClass('progress-bar-success');
                $('#result').addClass('text-success').text('Strength');
                $('#password-strength').css('width', '100%');
                return 'Strong';
            }

        }
        function validateEmail() {
            var email = $('.email').val();
            if (email == "" || IsEmail(email) == false) {
                $('#popover-email').css('visibility', 'visible');
                return false;
            } else {
                $('#popover-email').css('visibility', 'hidden');
                return true;
            }
        }
        function validatePhone() {
            if ($('.phonenumber').val().length != 10) {
                $('#popover-phonenumber').css('visibility', 'visible');
                return false;
            } else {
                $('#popover-phonenumber').css('visibility', 'hidden');
                return true;
            }
        }
        function validateConfirmPassword() {
            if ($('.password').val() !== $('.confirm-password').val()) {
                $('#popover-confirmpassword').css('visibility', 'visible');
                return false;
            } else {
                $('#popover-confirmpassword').css('visibility', 'hidden');
                return true;
            }
        }
        function valdiateUsername() {
            var username = $('.username').val();
            if (username == '') {
                $('#popover-username').css('visibility', 'visible');
                return false;
            } else {
                $('#popover-username').css('visibility', 'hidden');
                return true;
            }
        }
        function valdiateFullname() {
            var fullname = $('.fullname').val();
            if (fullname == '') {
                $('#popover-fullname').css('visibility', 'visible');
                return false;
            } else {
                $('#popover-fullname').css('visibility', 'hidden');
                return true;
            }
        }
        function validatePassword() {
            var password = $('.password').val();
            if (checkStrength(password) == false) {
                return false;
            }
            return true;
        }
        function validateForm() {
            if (valdiateFullname() && valdiateUsername() && validatePhone() && validateEmail() && validatePassword() && validateConfirmPassword()) {
                return true;
            } else {
                return false;
            }
        }
    </script>

</asp:Content>
