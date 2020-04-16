<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminReview.aspx.cs" Inherits="AutoCareApp.AdminReview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="section">
            <div class="row">
                <div class="col-lg-12">
                    <div class="container">
                        <div class="section text-center">
                            <div class="row">
                                <div class="col-md-12 ml-auto mr-auto">
                                    <div class="card">
                                        <div class="card-header card-header-primary text-center">
                                            <h2>Customer Reviews</h2>
                                        </div>
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <div>
                                                    <table class="table align-items-center">
                                                        <thead class="thead-light">
                                                            <tr>
                                                                <th class="text-left" scope="col">Booking #</th>
                                                                <th class="text-left" scope="col">Booking Date</th>
                                                                <th class="text-left" scope="col">Amount</th>
                                                                <th class="text-left" scope="col">Review</th>
                                                                <th class="text-left" scope="col">Rating</th>
                                                                <th class="text-left" scope="col">Customer</th>
                                                                <th class="text-left" scope="col">Status</th>
                                                                <th scope="col"></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody class="list">

                                                            <asp:ListView ID="lstReviews" runat="server">
                                                                <ItemTemplate>
                                                                    <tr>
                                                                        <td class="text-left"><%#string.Format("#{0}",Eval("BookingNo"))%></td>
                                                                        <td class="text-left"><%#Eval("BookingDate", "{0:d}")%></td>
                                                                        <td class="text-left"><%# string.Format("£{0:0.00}", Eval("Total"))%></td>
                                                                        <td class="text-left wrap-cell"><%#Eval("Review")%></td>
                                                                        <td class="text-left"><%#Eval("Rating")%> <i class="fas fa-star pink" style="color: #caca0f"></i></td>
                                                                        <td class="text-left"><%#Eval("FullName")%></td>
                                                                        <td class="text-left">
                                                                            <span class="badge badge-dot mr-4">
                                                                                <i class='<%# (bool)Eval("Active") == true ? "bg-success" : "bg-danger" %>'></i>
                                                                                <span class="status"><%# (bool)Eval("Active") == true ? "Active" : "Deactive" %></span>
                                                                            </span>
                                                                        </td>
                                                                        <td class="text-right">
                                                                            <a class="btn btn-sm btn-icon-only text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                                <i class="fas fa-ellipsis-v"></i>
                                                                            </a>
                                                                            <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                                                                                <asp:Button ID="btnDelete" runat="server" Text="Cancel" CssClass="dropdown-item" ReviewId='<%# Eval("Id")%>' OnClick="btnDelete_OnClick" />
                                                                                <asp:Button ID="btnActivate" runat="server" Text='<%# (bool)Eval("Active") == true ? "Deactivate" : "Activate" %>' CssClass="dropdown-item" ReviewId='<%# Eval("Id")%>' Status='<%# (bool)Eval("Active")%>' OnClick="btnActivate_OnClick" />
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
                                            <h4 class="heading mt-4">
                                                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label></h4>
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
        </div>
    </div>
    <script src="/assets/vendor/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#modal-notification").modal('show');
        });
    </script>
</asp:Content>
