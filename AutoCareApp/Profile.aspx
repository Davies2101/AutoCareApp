<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="AutoCareApp.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/SideMenu.css" rel="stylesheet" />
    <div id="wrapper">
        <div id="sidebar-wrapper" class="bg-default">
            <br />
            <ul class="sidebar-nav">
                <div class="text-center">
                    <br />
                    <asp:Image runat="server" ImageUrl="" ID="profileimg" Width="170" Height="170" />
                </div>
                <li class="sidebar-brand text-center">
                    <asp:Label ID="lblFullName" runat="server" Text=""></asp:Label>

                </li>
                <br />
                <li><a href="Profile.aspx" class="active"><i class="far fa-user-circle"></i>&nbsp;&nbsp;My Profile</a></li>
                <li><a href="MyBookings.aspx"><i class="fab fa-bootstrap"></i>&nbsp;&nbsp;My Bookings</a></li>
                <li><a href="MyCars.aspx"><i class="fas fa-car"></i>&nbsp;&nbsp;My Cars</a></li>
                <li><a href="MyRewards.aspx"><i class="fas fa-trophy"></i>&nbsp;&nbsp;My Rewards</a></li>
            </ul>
        </div>
        <a href="#menu-toggle" id="menu-toggle" class="ml-2" style="font-size: x-large; color: #172b4d"><i class="fas fa-arrow-alt-circle-left"></i></a>
        <div id="page-content-wrapper">
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
                    <div class="ml-auto mr-auto">
                        <div class="card">
                            <div class="card-header card-header-primary text-center">
                                <h2>My Details</h2>
                            </div>
                            <div class="card-body row">
                                <div class="col-md-6">
                                    <div class="bmd-form-group">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="fas fa-user"></i>
                                                </span>
                                            </div>
                                            <asp:TextBox runat="server" ID="FullName" CssClass="form-control" TextMode="SingleLine" placeholder="Full Name" />
                                        </div>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="FullName"
                                            CssClass="text-danger small" ErrorMessage="The Full Name is required." />
                                    </div>

                                    <div class="bmd-form-group">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="fas fa-phone"></i>
                                                </span>
                                            </div>
                                            <asp:TextBox runat="server" ID="PhoneNumber" CssClass="form-control" TextMode="Number" placeholder="Phone Number" />
                                        </div>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="PhoneNumber"
                                            CssClass="text-danger small" ErrorMessage="The Phone Number is required." />
                                    </div>

                                    <div class="bmd-form-group">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="fas fa-at"></i>
                                                </span>
                                            </div>
                                            <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" placeholder="Email" />
                                        </div>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                            CssClass="text-danger small" ErrorMessage="The Email is required." />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="bmd-form-group">
                                        <div id="dvPreview" style="width: 125px; height: 125px; border: solid 1px grey;" class="ml-auto mr-auto mb-2">
                                            <img alt="" src="" width="120" height="120" id="imgPreview" runat="server" />
                                        </div>
                                        <asp:FileUpload ID="fileupload" CssClass="fileupload form-control" runat="server" AllowMultiple="False" />
                                        <asp:HiddenField ID="hdnUpload" runat="server" />
                                    </div>
                                    <div class="bmd-form-group mt-3">
                                        <div class="float-left">
                                            <asp:CheckBox ID="chkPassword" runat="server" AutoPostBack="true" Text="Update Password" OnCheckedChanged="chkPassword_CheckedChanged" />
                                        </div>
                                    </div>
                                    <asp:Panel ID="panelPassword" runat="server" Visible="false">
                                        <div class="bmd-form-group">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">
                                                        <i class="fas fa-lock"></i>
                                                    </span>
                                                </div>
                                                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" placeholder="Password" />
                                            </div>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                                                CssClass="text-danger small" ErrorMessage="The Password is required." />
                                        </div>
                                    </asp:Panel>
                                </div>
                            </div>
                            <div class="footer text-center mb-3">
                                <asp:Button runat="server" OnClick="UpdateUser_Click" Text="Update" CssClass="btn btn-default" />
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
                                    <h4 class="heading mt-4">Profile updated successfully!</h4>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-white ml-auto" data-dismiss="modal">Ok</button>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>

    <!-- Menu Toggle Script -->
    <%-- https://codepen.io/flizoid/pen/EnHed--%>

    <script src="/assets/vendor/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#modal-notification").modal('show');
            //https://www.aspsnippets.com/Articles/Preview-image-before-upload-using-FileUpload-control-and-jQuery-in-ASPNet.aspx
            $(".fileupload").change(function () {
                $('#<%= imgPreview.ClientID %>').attr("src", "");
                var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.gif|.png|.bmp)$/;
                if (regex.test($(this).val().toLowerCase())) {
                    if (typeof (FileReader) != "undefined") {
                        $("#dvPreview").show();
                        var reader = new FileReader();
                        reader.onload = function (e) {
                            $('#<%= imgPreview.ClientID %>').attr("src", e.target.result);
                        }
                        reader.readAsDataURL($(this)[0].files[0]);
                        $('#<%= hdnUpload.ClientID %>').val('1');
                    } else {
                        alert("This browser does not support FileReader.");
                        $(".fileupload").val('');
                        $('#<%= hdnUpload.ClientID %>').val('');
                    }
                } else {
                    alert("Please upload a valid image file.");
                    $(".fileupload").val('');
                    $('#<%= hdnUpload.ClientID %>').val('');
                }
            });
        });
        $("#menu-toggle").click(function (e) {
            e.preventDefault();
            $("#wrapper").toggleClass("toggled");
            $("#menu-toggle").find("i").toggleClass("fa-arrow-alt-circle-right", "fa-arrow-alt-circle-left");
        });
    </script>
</asp:Content>
