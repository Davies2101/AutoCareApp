<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="AutoCareApp.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container main-content">
        <div class="section text-center">
            <div class="row">
                <div class="col-lg-4 col-md-6 ml-auto mr-auto">
                    <div class="card card-login">
                        <div class="card-header card-header-primary text-center">
                            <h4 class="card-title">My Profile</h4>
                        </div>
                        <div class="card-body">
                            <asp:Label ID="lblError" runat="server" Text="Please enter your details"></asp:Label>
                            <hr />

                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">
                                            <i class="material-icons">face</i>
                                        </span>
                                    </div>
                                    <asp:TextBox runat="server" ID="FullName" CssClass="form-control" TextMode="SingleLine" placeholder="Full Name" />
                                </div>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="FullName"
                                    CssClass="text-danger small" ErrorMessage="Name field is required." />
                            </div>


                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">
                                            <i class="material-icons">phone</i>
                                        </span>
                                    </div>
                                    <asp:TextBox runat="server" ID="PhoneNumber" CssClass="form-control" TextMode="Number" placeholder="Phone Number" />
                                </div>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="PhoneNumber"
                                    CssClass="text-danger small" ErrorMessage="Phone number field is required." />
                            </div>

                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">
                                            <i class="material-icons">mail</i>
                                        </span>
                                    </div>
                                    <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" placeholder="Email" />
                                </div>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                    CssClass="text-danger small" ErrorMessage="The email field is required." />
                            </div>


                            <div class="form-group">
                                <div class="col-md-offset-2 col-md-10">
                                    <asp:CheckBox ID="chkPassword" runat="server" AutoPostBack="true" Text="Update password" OnCheckedChanged="chkPassword_CheckedChanged"/>
                                </div>
                            </div>

                            <asp:Panel ID="panelPassword" runat="server" Visible="false">
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <i class="material-icons">lock</i>
                                            </span>
                                        </div>
                                        <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" placeholder="Password" />
                                    </div>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                                        CssClass="text-danger" ErrorMessage="The password field is required." />
                                </div>
                            </asp:Panel>

                            <div class="form-group">
                                <div class="col-md-offset-2 col-md-10">
                                    <asp:Button runat="server" OnClick="UpdateUser_Click" Text="Update" CssClass="btn btn-primary" />
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
