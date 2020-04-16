<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyRewards.aspx.cs" Inherits="AutoCareApp.MyRewards" %>

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
                <li><a href="Profile.aspx"><i class="far fa-user-circle"></i>&nbsp;&nbsp;My Profile</a></li>
                <li><a href="MyBookings.aspx"><i class="fab fa-bootstrap"></i>&nbsp;&nbsp;My Bookings</a></li>
                <li><a href="MyCars.aspx"><i class="fas fa-car"></i>&nbsp;&nbsp;My Cars</a></li>
                <li><a href="MyRewards.aspx" class="active"><i class="fas fa-trophy"></i>&nbsp;&nbsp;My Rewards</a></li>
                <li><a href="MessageBox.aspx"><i class="far fa-envelope"></i>&nbsp;&nbsp;Notifications</a></li>
            </ul>
        </div>
        <a href="#menu-toggle" id="menu-toggle" class="ml-2" style="font-size: x-large; color: #172b4d"><i class="fas fa-arrow-alt-circle-left"></i></a>
        <div id="page-content-wrapper">
            <div class="container">
                <div class="section text-center">
                    <div class="ml-auto mr-auto">
                        <div class="card">
                            <div class="card-header card-header-primary text-center">
                                <h2>My Rewards</h2>
                            </div>
                            <div class="card-body row"></div>
                            <div class="footer text-center mb-3">
                               
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
        });
        $("#menu-toggle").click(function (e) {
            e.preventDefault();
            $("#wrapper").toggleClass("toggled");
            $("#menu-toggle").find("i").toggleClass("fa-arrow-alt-circle-right", "fa-arrow-alt-circle-left");
        });
    </script>
</asp:Content>
