<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="AutoCareApp.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href="Content/SideMenu.css" rel="stylesheet" />
    <div id="wrapper">
        <div id="sidebar-wrapper" class="bg-default">
            <br />
            <ul class="sidebar-nav">
                <div style="text-align: center; background-image: url(Images/bg.jpg); height: 170px;">
                    <br />
                    <asp:Image runat="server" ImageUrl="~/Images/hitesh.png" ID="profileimg" />
                </div>
                <li class="sidebar-brand">
                    <asp:Label ID="lblFullName" runat="server" Text="Label"></asp:Label>

                </li>
                <br />
                <li><a href="Profile.aspx" class="active"><i class="far fa-user-circle"></i>&nbsp;&nbsp;My Profile</a>
                </li>
                <li><a href="MyBookings.aspx"><i class="fab fa-bootstrap"></i>&nbsp;&nbsp;My Bookings</a>
                </li>
                <li><a href="#"><i class="far fa-envelope"></i>&nbsp;&nbsp;Notifications</a>
                </li>
            </ul>
        </div>
        <a href="#menu-toggle" id="menu-toggle" class="ml-2"><i class="fas fa-bars"></i></a>
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
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
                                    <div class="col-md-6 ml-auto mr-auto">
                                        <div class="card">
                                            <div class="card-header card-header-primary text-center">
                                                <h2>My Profile</h2>
                                            </div>
                                            <div class="card-body">
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
                                                <div class="form-group">
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
                                                <div class="footer text-center mb-3">
                                                    <asp:Button runat="server" OnClick="UpdateUser_Click" Text="Update" CssClass="btn btn-default" />
                                                </div>
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
            </div>
        </div>
    </div>

    <!-- Menu Toggle Script -->
    <%-- https://codepen.io/flizoid/pen/EnHed--%>

    <script src="/assets/vendor/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#modal-notification").modal('show');
        });
        $("#menu-toggle").click(function (e) {
            e.preventDefault();
            $("#wrapper").toggleClass("toggled");
        });
    </script>
</asp:Content>
