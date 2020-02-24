<%@ Page Title="Services" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="AutoCareApp.Services" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container main-content">
        <div class="section text-center">
            <div class="row">
                <asp:ListView ID="lstVPackage" runat="server">
                    <LayoutTemplate>
                        <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                    </LayoutTemplate>
                    <ItemTemplate>
                        <div class="col-md-3">
                            <div class="card">
                                <div class="card-header card-header-primary">
                                    <div class="card-icon">
                                        <i class="material-icons">directions_car</i>
                                    </div>
                                    <h4 class="card-title"><%#Eval("PackageName")%></h4>
                                    <h5 class="category">Price: £ <%#Eval("PackagePrice")%></h5>
                                </div>
                                <div class="card-body">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item" style="max-height: 130px; min-height: 130px;"><%#Eval("PackageDetails")%> <a runat="server" href="~/Services">More...</a> </li>
                                        <li class="list-group-item">
                                            <a href="NewBooking.aspx?id=<%#Eval("PackageID")%>" class="btn btn-primary">Book Now</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>
</asp:Content>
