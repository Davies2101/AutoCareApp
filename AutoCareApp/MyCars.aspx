<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyCars.aspx.cs" Inherits="AutoCareApp.MyCars" %>

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
                <li><a href="MyCars.aspx" class="active"><i class="fas fa-car"></i>&nbsp;&nbsp;My Cars</a></li>
                <li><a href="MyRewards.aspx"><i class="fas fa-trophy"></i>&nbsp;&nbsp;My Rewards</a></li>
            </ul>
        </div>
        <a href="#menu-toggle" id="menu-toggle" class="ml-2" style="font-size: x-large; color: #172b4d"><i class="fas fa-arrow-alt-circle-left"></i></a>
        <div id="page-content-wrapper">
            <div class="container">
                <div class="section text-center">
                    <div class="ml-auto mr-auto">
                        <div class="card">
                            <div class="card-header card-header-primary text-center">
                                <h2>My Cars</h2>
                            </div>
                            <div class="card-body row">
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="bmd-form-group">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">
                                                        <i class="far fa-registered"></i>
                                                    </span>
                                                </div>
                                                <asp:TextBox runat="server" ID="VehicleReg" CssClass="form-control" TextMode="SingleLine" placeholder="Registraion No." />
                                            </div>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="VehicleReg"
                                                CssClass="text-danger small" ErrorMessage="The Vehicle Registraion No. is required." />
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="bmd-form-group">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">
                                                        <i class="fas fa-wrench"></i>
                                                    </span>
                                                </div>
                                                <asp:TextBox runat="server" ID="VehicleMake" CssClass="form-control" TextMode="SingleLine" placeholder="Make" />

                                            </div>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="VehicleMake"
                                                CssClass="text-danger small" ErrorMessage="The Vehicle Make is required." />
                                            &nbsp;
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="bmd-form-group">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">
                                                        <i class="fas fa-truck-pickup"></i>
                                                    </span>
                                                </div>
                                                <asp:TextBox runat="server" ID="VehicleModel" CssClass="form-control" TextMode="SingleLine" placeholder="Model" />

                                            </div>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="VehicleModel"
                                                CssClass="text-danger small" ErrorMessage="The Vehicle Model is required." />
                                            &nbsp;
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="bmd-form-group">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">
                                                        <i class="fas fa-palette"></i>
                                                    </span>
                                                </div>
                                                <asp:TextBox runat="server" ID="VehicleColor" CssClass="form-control" TextMode="SingleLine" placeholder="Color" />

                                            </div>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="VehicleColor"
                                                CssClass="text-danger small" ErrorMessage="The Vehicle Color is required." />
                                            &nbsp;
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <asp:Button ID="btnUpdate" runat="server" Text="Add" CssClass="btn btn-default btn-sm" OnClick="btnUpdate_OnClick" />
                                        <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-info btn-sm" OnClick="btnClear_OnClick" CausesValidation="False" />
                                    </div>
                                    <asp:HiddenField ID="hdnCarId" runat="server" Value="0" />
                                </div>
                                <div class="table-responsive">
                                    <div>
                                        <table class="table align-items-center">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th class="text-left" scope="col">Car #</th>
                                                    <th class="text-left" scope="col">Registration No</th>
                                                    <th class="text-left" scope="col">Make</th>
                                                    <th class="text-left" scope="col">Model</th>
                                                    <th class="text-left" scope="col">Color</th>
                                                    <th scope="col"></th>
                                                </tr>
                                            </thead>
                                            <tbody class="list">
                                                <asp:ListView ID="lstCars" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td class="text-left"><%#string.Format("#{0}",Eval("CarId"))%></td>
                                                            <td class="text-left"><%#Eval("VehicleReg")%></td>
                                                            <td class="text-left"><%#Eval("VehicleMake")%></td>
                                                            <td class="text-left"><%#Eval("VehicleModel")%></td>
                                                            <td class="text-left"><%#Eval("VehicleColor")%></td>
                                                            <td class="text-right">
                                                                <div class='dropdown'>
                                                                    <a class="btn btn-sm btn-icon-only text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                        <i class="fas fa-ellipsis-v"></i>
                                                                    </a>
                                                                    <div class='dropdown-menu dropdown-menu-right dropdown-menu-arrow'>
                                                                        <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="dropdown-item" CarId='<%# Eval("CarId")%>' OnClick="btnEdit_OnClick" CausesValidation="False" />
                                                                        <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="dropdown-item" CarId='<%# Eval("CarId")%>' OnClick="btnDelete_OnClick" CausesValidation="False" />
                                                                    </div>
                                                                </div>
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
        </div>
    </div>
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
