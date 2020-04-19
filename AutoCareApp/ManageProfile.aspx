<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ManageProfile.aspx.cs" Inherits="AutoCareApp.ManageProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="section">
            <div class="row">
                <div class="col-md-12 ml-auto mr-auto">
                    <div class="card">
                        <div class="card-header card-header-primary text-center">
                            <h2>Profile Manager</h2>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12 col-md-3">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Profile Type:</span>
                                            </div>
                                            <asp:DropDownList ID="ddlUserType" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlUserType_OnSelectedIndexChanged">
                                                <asp:ListItem Value="1" Selected="True">Customers</asp:ListItem>
                                                <asp:ListItem Value="2">Admins</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
                                                <th scope="col"></th>
                                            </tr>
                                        </thead>
                                        <tbody class="list">
                                            <asp:ListView ID="lstUsers" runat="server">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td class="text-left"><%#string.Format("#{0}",Eval("UserID"))%></td>
                                                        <td class="text-left"><%#Eval("Username")%></td>
                                                        <td class="text-left"><%#Eval("FullName")%></td>
                                                        <td class="text-left"><%#Eval("Email")%></td>
                                                        <td class="text-left"><%#Eval("PhoneNumber")%></td>
                                                        <td class="text-left"><%#Eval("Points")%></td>
                                                        <td class="text-left"><%#Eval("Redeemed")%></td>
                                                        <td class="text-right">
                                                            <div class='dropdown'>
                                                                <a class="btn btn-sm btn-icon-only text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                    <i class="fas fa-ellipsis-v"></i>
                                                                </a>
                                                                <div class='dropdown-menu dropdown-menu-right dropdown-menu-arrow'>
                                                                    <%--<asp:Button ID="btnContact" runat="server" Text="Contact" CssClass="dropdown-item" UserID='<%# Eval("UserID")%>' OnClick="btnContact_OnClick" />--%>
                                                                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="dropdown-item" UserID='<%# Eval("UserID")%>' OnClick="btnDelete_OnClick" />
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
                            <h4 class="heading mt-4">User deleted successfully!</h4>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-white ml-auto" data-dismiss="modal">Ok</button>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
