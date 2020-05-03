<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminMail.aspx.cs" Inherits="AutoCareApp.AdminMail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="section">
            <div class="row">
                <div class="col-md-12 ml-auto mr-auto">
                    <div class="card">
                        <div class="card-header card-header-primary text-center">
                            <h2>Send Mail</h2>
                        </div>
                        <div class="card-body">
                            <div class="bmd-form-group col-3">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">To:</span>
                                    </div>
                                    <asp:DropDownList ID="ddlUserType" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="1" Selected="True">All Customers</asp:ListItem>
                                        <asp:ListItem Value="2">All Admins</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                &nbsp;
                            </div>
                            <div class="bmd-form-group col-12">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">
                                            <i class="fas fa-grip-lines"></i>
                                        </span>
                                    </div>
                                    <asp:TextBox runat="server" ID="Subject" CssClass="form-control" TextMode="SingleLine" placeholder="Subject" />

                                </div>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Subject"
                                    CssClass="text-danger small" ErrorMessage="Subject is required." />
                            </div>
                            <div class="bmd-form-group col-12">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">
                                            <i class="fas fa-sticky-note"></i>
                                        </span>
                                    </div>
                                    <asp:TextBox runat="server" ID="Message" CssClass="form-control" TextMode="MultiLine" placeholder="Message" Rows="10" />

                                </div>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Message"
                                    CssClass="text-danger small" ErrorMessage="Message is required." />
                            </div>
                        </div>
                        <div class="card-footer">
                            <div class="row">
                                <asp:Button runat="server" Text="Send Message" CssClass="btn btn-default ml-auto mr-auto" ID="btnSend" OnClick="btnSend_OnClick" />
                            </div>
                        </div>
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
                            <h4 class="heading mt-4">Message sent successfully!</h4>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-white ml-auto" data-dismiss="modal">Ok</button>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
    
    <script src="/assets/vendor/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#modal-notification").modal('show');
        });
    </script>
</asp:Content>
