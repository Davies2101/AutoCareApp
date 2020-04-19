<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookingPayment.aspx.cs" Inherits="AutoCareApp.BookingPayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="card">
            <div class="card-header card-header-primary text-center">
                <h2 class="text-center">Booking Summary</h2>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-12 text-left mb-2">
                        Booking Date and Time:
                                                    <asp:Label ID="lblBookingDateAndTime" runat="server" Text=""></asp:Label>
                    </div>
                    <table class="table table-hover table-bordered">
                        <thead>
                            <tr>
                                <th class="text-left">
                                    <h4>Product</h4>
                                </th>
                                <th class="text-left">
                                    <h4>Price</h4>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="col-md-9 text-left">Package:
                                                            <asp:Label ID="lblPackageName" runat="server" Text=""></asp:Label></td>
                                <td class="col-md-3 text-left">£
                                                            <asp:Label ID="lblPackagePrice" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <tr>
                                <td class="col-md-9 text-left">
                                    <asp:Label ID="lblServices" runat="server" Text="Additional Services:" Visible="False"></asp:Label></td>
                                <td class="col-md-3 text-left"></td>
                            </tr>
                            <asp:ListView ID="lstViewExtras" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td class="col-md-9 text-left">&nbsp;&nbsp;<i class="fas fa-dot-circle"></i>&nbsp;&nbsp;<%#Eval("ExtraName")%></td>
                                        <td class="col-md-3 text-left">£ <%# string.Format("{0:0.00}",Eval("ExtraPrice"))%></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <tr class="font-weight-800">
                                <td class="col-md-9 text-left">
                                    <h4>Total:</h4>
                                </td>
                                <td class="col-md-3 text-left">
                                    <h4>£<asp:Label ID="lblTotal" runat="server" Text="Total:"></asp:Label></h4>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                </div>
            </div>
            <div class="card-footer text-center">
                <asp:Button runat="server" Text="Pay Now" CssClass="btn btn-default" ID="btnPay" OnClick="btnPay_OnClick" />
            </div>

        </div>
    </div>
</asp:Content>
