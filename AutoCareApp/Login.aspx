<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AutoCareApp.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container main-content">
        <div class="section text-center"><%--style="background-image: url('Content/images/login-bg.jpg');"--%>
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-6 ml-auto mr-auto">
                        <div class="card card-login">
                            <div class="card-header card-header-primary text-center">
                                <h4 class="card-title">Login</h4>
                            </div>
                            <div class="card-body">
                                <asp:Label ID="lblError" runat="server" Text="Please enter login details" Visible="False"></asp:Label>
                                <div class="bmd-form-group">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <i class="material-icons">face</i>
                                            </span>
                                        </div>
                                        <asp:TextBox runat="server" ID="Username" CssClass="form-control" TextMode="SingleLine" placeholder="Username" />
                                    </div>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Username"
                                        CssClass="text-danger small" ErrorMessage="Username field is required." />
                                </div>
                                <div class="bmd-form-group">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <i class="material-icons">lock_outline</i>
                                            </span>
                                        </div>
                                        <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" placeholder="Password" />
                                    </div>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                                        CssClass="text-danger small" ErrorMessage="The password field is required." />
                                </div>
                            </div>
                            <div class="footer text-center mb-3">
                                <asp:Button runat="server" OnClick="LogIn" Text="Log in" CssClass="btn btn-primary" />
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
