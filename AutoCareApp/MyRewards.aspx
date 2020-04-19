<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyRewards.aspx.cs" Inherits="AutoCareApp.MyRewards" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/SideMenu.css" rel="stylesheet" />
    <link href="Content/Circle.css" rel="stylesheet" />
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
                            <div class="card-body row">
                                <div class="card card-stats col-md-3">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col">
                                                <h5 class="card-title text-uppercase text-muted mb-0">Total Points</h5>
                                                <span class="h2 font-weight-bold mb-0"><asp:Label ID="lblTotal" runat="server" Text=""></asp:Label></span>
                                            </div>
                                            <div class="col-auto">
                                                <div class="icon icon-shape bg-info text-white rounded-circle shadow">
                                                    <i class="ni ni-chart-pie-35"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card card-stats col-md-3">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col">
                                                <h5 class="card-title text-uppercase text-muted mb-0">Available</h5>
                                                <span class="h2 font-weight-bold mb-0"><asp:Label ID="lblPoints" runat="server" Text=""></asp:Label></span>
                                            </div>
                                            <div class="col-auto">
                                                <div class="icon icon-shape bg-success text-white rounded-circle shadow">
                                                    <i class="ni ni-chart-pie-35"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card card-stats col-md-3">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col">
                                                <h5 class="card-title text-uppercase text-muted mb-0">Redeemed</h5>
                                                <span class="h2 font-weight-bold mb-0"><asp:Label ID="lblRedeemed" runat="server" Text=""></asp:Label></span>
                                            </div>
                                            <div class="col-auto">
                                                <div class="icon icon-shape bg-orange text-white rounded-circle shadow">
                                                    <i class="ni ni-chart-pie-35"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card card-stats col-md-3">
                                    <div class="card-body">
                                    <div class="row">
                                        <div class="col-auto pl-0 pr-0">
                                            <div class="c100 big" runat="server" ID="divProgree">
                                                <span><asp:Label ID="lblProgress" runat="server" Text=""></asp:Label></span>
                                                <div class="slice">
                                                    <div class="bar"></div>
                                                    <div class="fill"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col float-right pr-0 mt-2">
                                            <asp:Button ID="btnGenerateCoupon" runat="server" Text="Get Coupon" CssClass="btn btn-primary btn-sm" OnClick="btnGenerateCoupon_OnClick" />
                                        </div>
                                    </div> </div>
                                </div>
                                <div class="table-responsive">
                                    <div>
                                        <table class="table align-items-center">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th class="text-left" scope="col">Code #</th>
                                                    <th class="text-left" scope="col">Value</th>
                                                    <th class="text-left" scope="col">Status</th>
                                                </tr>
                                            </thead>
                                            <tbody class="list">
                                                <asp:ListView ID="lstCoupon" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td class="text-left"><%#string.Format("#{0}",Eval("Code"))%></td>
                                                            <td class="text-left">£5</td>
                                                            <td class="text-left">
                                                                <span class="badge badge-dot mr-4">
                                                                    <i class='<%# (bool)Eval("IsActive") == true ? "bg-info" :  "bg-danger"  %>'></i>
                                                                    <span class="status"><%#(bool)Eval("IsActive") == true ? "Active" :  "Redeemed"%></span>
                                                                </span>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                </asp:ListView>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                            </div>
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
                                    <h4 class="heading mt-4">
                                        <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label></h4>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-white ml-auto" data-dismiss="modal">Ok</button>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
            <asp:Panel ID="warningBox" runat="server" Visible="False">
                <div class="modal fade" id="modal-notification-warn" tabindex="-1" role="dialog" aria-labelledby="modal-notification-warn" aria-hidden="true">
                    <div class="modal-dialog modal-waning modal-dialog-centered modal-" role="document">
                        <div class="modal-content bg-gradient-warning">
                            <div class="modal-body">
                                <div class="text-center">
                                    <i class="fas fa-exclamation-triangle fa-4x"></i>
                                    <h4 class="heading mt-4">
                                        <asp:Label ID="lblWarnMessage" runat="server" Text="Label"></asp:Label></h4>
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
            $("#modal-notification-warn").modal('show');
        });
        $("#menu-toggle").click(function (e) {
            e.preventDefault();
            $("#wrapper").toggleClass("toggled");
            $("#menu-toggle").find("i").toggleClass("fa-arrow-alt-circle-right", "fa-arrow-alt-circle-left");
        });
    </script>
</asp:Content>
