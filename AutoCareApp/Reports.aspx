<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="AutoCareApp.Reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="section text-center">
            <div class="row">
                <div class="col-md-12 ml-auto mr-auto">
                    <div class="card">
                        <div class="card-header card-header-primary text-center">
                            <h2>Reports</h2>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12 col-md-3">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Type:</span>
                                            </div>
                                            <asp:DropDownList ID="ddlReprtType" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlReprtType_OnSelectedIndexChanged">
                                                <asp:ListItem Value="1">Bookings</asp:ListItem>
                                                <asp:ListItem Value="2">Sales</asp:ListItem>
                                                <asp:ListItem Value="3">Customers</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="input-daterange datepicker row align-items-center" runat="server" ID="divDatePicker">
                                        <div class="col col-12 col-md-6">
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text"><i class="ni ni-calendar-grid-58"></i></span>
                                                    </div>
                                                    <asp:TextBox ID="txtStartDate" runat="server" placeholder="Start date" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col col-12 col-md-6">
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text"><i class="ni ni-calendar-grid-58"></i></span>
                                                    </div>
                                                    <asp:TextBox ID="txtEndDate" runat="server" placeholder="End date" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-md-3">
                                    <asp:Button ID="btnDownload" runat="server" Text="Export" CssClass="btn btn-primary" OnClick="btnDownload_OnClick"  />
                                    <asp:Button ID="btnRun" runat="server" Text="Run" CssClass="btn btn-default" OnClick="btnRun_OnClick" />
                                </div>
                            </div>
                            <asp:Panel ID="panelBookings" runat="server" Visible="True">
                                <div class="table-responsive">
                                    <div>
                                        <table class="table align-items-center">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th class="text-left" scope="col">Booking #</th>
                                                    <th class="text-left" scope="col">Date</th>
                                                    <th class="text-left" scope="col">Time</th>
                                                    <th class="text-left" scope="col">Customer</th>
                                                    <th class="text-left" scope="col">Vehicle #</th>
                                                    <th class="text-left" scope="col">Package</th>
                                                    <th class="text-left" scope="col">Total</th>
                                                    <th class="text-left" scope="col">Status</th>
                                                    <th scope="col"></th>
                                                </tr>
                                            </thead>
                                            <tbody class="list">
                                                <asp:ListView ID="lstBookings" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td class="text-left"><%#string.Format("#{0}",Eval("BookingNo"))%></td>
                                                            <td class="text-left"><%#DateTime.Parse(Eval("BookingDate").ToString()).ToShortDateString()%></td>
                                                            <td class="text-left"><%#DateTime.Today.Add((TimeSpan)Eval("TimeSlot")).ToString("hh:mm tt")%></td>
                                                            <td class="text-left"><%#Eval("Customer")%></td>
                                                            <td class="text-left"><%#Eval("VehicleReg")%></td>
                                                            <td class="text-left"><%#Eval("PackageName")%></td>
                                                            <td class="text-left"><%# string.Format("£{0:0.00}", Eval("Total"))%></td>
                                                            <td class="text-left"><%#Eval("Status")%></td>
                                                        </tr>
                                                    </ItemTemplate>
                                                </asp:ListView>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                            </asp:Panel>
                            <asp:Panel ID="panelSales" runat="server" Visible="False">
                                <div class="table-responsive">
                                    <div>
                                        <table class="table align-items-center">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th class="text-left" scope="col">Booking #</th>
                                                    <th class="text-left" scope="col">Date</th>
                                                    <th class="text-left" scope="col">Amount</th>
                                                    <th class="text-left" scope="col">Extras</th>
                                                    <th class="text-left" scope="col">Total</th>
                                                    <th scope="col"></th>
                                                </tr>
                                            </thead>
                                            <tbody class="list">
                                                <asp:ListView ID="lstSales" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td class="text-left"><%#string.Format("#{0}",Eval("BookingNo"))%></td>
                                                            <td class="text-left"><%#DateTime.Parse(Eval("BookingDate").ToString()).ToShortDateString()%></td>
                                                            <td class="text-left"><%# string.Format("£{0:0.00}", Eval("Amount"))%></td>
                                                            <td class="text-left"><%# string.Format("£{0:0.00}", Eval("Extras"))%></td>
                                                            <td class="text-left"><%# string.Format("£{0:0.00}", Eval("Total"))%></td>
                                                        </tr>
                                                    </ItemTemplate>
                                                </asp:ListView>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                            </asp:Panel>
                            <asp:Panel ID="panelCustomers" runat="server" Visible="False">
                                <div class="table-responsive">
                                    <div>
                                        <table class="table align-items-center">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th class="text-left" scope="col">User #</th>
                                                    <th class="text-left" scope="col">Username</th>
                                                    <th class="text-left" scope="col">Full Name</th>
                                                    <th class="text-left" scope="col">Email</th>
                                                    <th class="text-left" scope="col">Phone Number</th>
                                                    <th class="text-left" scope="col">Points Available</th>
                                                    <th class="text-left" scope="col">Redeemed</th>
                                                </tr>
                                            </thead>
                                            <tbody class="list">
                                                <asp:ListView ID="lstCustomers" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td class="text-left"><%#string.Format("#{0}",Eval("UserID"))%></td>
                                                            <td class="text-left"><%#Eval("Username")%></td>
                                                            <td class="text-left"><%#Eval("FullName")%></td>
                                                            <td class="text-left"><%#Eval("Email")%></td>
                                                            <td class="text-left"><%#Eval("PhoneNumber")%></td>
                                                            <td class="text-left"><%#Eval("Points")%></td>
                                                            <td class="text-left"><%#Eval("Redeemed")%></td>
                                                        </tr>
                                                    </ItemTemplate>
                                                </asp:ListView>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
