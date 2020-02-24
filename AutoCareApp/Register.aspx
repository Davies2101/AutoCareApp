<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="AutoCareApp.Register" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container main-content">
        <div class="section text-center">
            <div class="container">
                <div class="row">
                    <div class="col-md-10 ml-auto mr-auto">
                        <div class="card card-login">
                            <div class="card-header card-header-primary text-center">
                                <h4 class="card-title">Register</h4>
                            </div>
                            <div class="card-body">
                                <asp:Label ID="lblError" runat="server" Text="Please enter your details" Visible="False"></asp:Label>
                                <div class="row">
                                    <div class="bmd-form-group col-md-6">
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
                                    <div class="bmd-form-group col-md-6">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="material-icons">phone_in_talk</i>
                                                </span>
                                            </div>
                                            <asp:TextBox runat="server" ID="PhoneNumber" CssClass="form-control" TextMode="Number" placeholder="Phone Number" />
                                        </div>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="PhoneNumber"
                                            CssClass="text-danger small" ErrorMessage="Phone number field is required." />
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="bmd-form-group col-md-6">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="material-icons">person</i>
                                                </span>
                                            </div>
                                            <asp:TextBox runat="server" ID="Username" CssClass="form-control" TextMode="SingleLine" placeholder="Username" />
                                        </div>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Username"
                                            CssClass="text-danger small" ErrorMessage="Username field is required." />
                                    </div>

                                    <div class="bmd-form-group col-md-6">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="material-icons">email</i>
                                                </span>
                                            </div>
                                            <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" placeholder="Email" />
                                        </div>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                            CssClass="text-danger small" ErrorMessage="The email field is required." />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="bmd-form-group col-md-6">
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

                                    <div class="bmd-form-group col-md-6">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                    <i class="material-icons">lock</i>
                                                </span>
                                            </div>
                                            <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" placeholder="Confirm Password" />
                                        </div>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                                            CssClass="text-danger small" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                                        <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                                            CssClass="text-danger small" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
                                    </div>
                                </div>
                            </div>
                            <div class="footer text-center mb-3">
                                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-primary" />
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:Panel runat="server" ID="panelPopup" Visible="false">
        <div class="modal fade" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Register</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Registered successfully

                    </div>
                    <div class="modal-footer">
                        <asp:Button runat="server" type="button" Text="OK" OnClientClick="OKClick();" class="btn btn-success waves-effect waves-light" PostBackUrl="~/Default.aspx" />
                    </div>

                </div>

            </div>
        </div>
    </asp:Panel>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#myModal").modal('show');
        });

        var OKClick = function () {
            window.location.replace("Default.aspx");
            event.preventDefault();

        }
    </script>

</asp:Content>
