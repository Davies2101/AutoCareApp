<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AutoCareApp.Login" %>

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
                <div class="col-lg-4 col-md-6 ml-auto mr-auto">
                    <div class="card">
                        <div class="card-header card-header-primary text-center">
                            <h2>Login</h2>
                        </div>
                        <div class="card-body">
                            <div class="bmd-form-group">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">
                                            <i class="far fa-grin-alt"></i>
                                        </span>
                                    </div>
                                    <asp:TextBox runat="server" ID="Username" CssClass="form-control" TextMode="SingleLine" placeholder="Username" />
                                </div>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Username"
                                    CssClass="text-danger small" ErrorMessage="The Username is required." />
                            </div>
                            <div class="bmd-form-group">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">
                                            <i class="fas fa-unlock-alt"></i>
                                        </span>
                                    </div>
                                    <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" placeholder="Password" />
                                </div>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                                    CssClass="text-danger small" ErrorMessage="The Password is required." />
                            </div>
                        </div>
                        <div class="footer text-center mb-3">
                            <asp:Button runat="server" OnClick="LogIn" Text="Log in" CssClass="btn btn-default" />
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
