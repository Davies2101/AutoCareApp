<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyBookings.aspx.cs" Inherits="AutoCareApp.MyBookings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="section text-center">
            <div class="row">
                <div class="col-md-12 ml-auto mr-auto">
                <div class="card">
                    <div class="card-header card-header-primary text-center">
                        <h2>My Bookings</h2>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <div>
                                <table class="table align-items-center">
                                    <thead class="thead-light">
                                        <tr>
                                            <th class="text-left" scope="col">Booking #</th>
                                            <th class="text-left" scope="col">Date</th>
                                            <th class="text-left" scope="col">Time</th>
                                            <th class="text-left" scope="col">Vehicle #</th>
                                            <th class="text-left" scope="col">Package</th>
                                            <th class="text-left" scope="col">Amount</th>
                                            <th class="text-left" scope="col">Status</th>
                                            <th scope="col"></th>
                                        </tr>
                                    </thead>
                                    <tbody class="list">

                                        <asp:ListView ID="lstBookings" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td class="text-left"><%#string.Format("#{0}",Eval("BookingNo"))%></td>
                                                    <td class="text-left"><%#Eval("BookingDate", "{0:d}")%></td>
                                                    <td class="text-left"><%#DateTime.Today.Add((TimeSpan)Eval("TimeSlot")).ToString("hh:mm tt")%></td>
                                                    <td class="text-left"><%#Eval("VehicleReg")%></td>
                                                    <td class="text-left"><%#Eval("PackageName")%></td>
                                                    <td class="text-left"><%# string.Format("£{0:0.00}", Eval("Total"))%></td>
                                                    <td class="text-left">
                                                        <span class="badge badge-dot mr-4">
                                                            <i class='<%# (string)Eval("Status") == "Completed" ? "bg-success" : ((string)Eval("Status") == "Cancelled" ? "bg-danger" : "bg-info") %>'></i>
                                                            <span class="status"><%#Eval("Status")%></span>
                                                        </span>
                                                    </td>
                                                    <td class="text-right">
                                                        <div class="dropdown">
                                                            <a class="btn btn-sm btn-icon-only text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                <i class="fas fa-ellipsis-v"></i>
                                                            </a>
                                                            <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                                                                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="dropdown-item" BookingId='<%# Eval("BookingNo")%>' OnClick="btnCancel_OnClick"/>
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
            </div> </div>
    </div>
    </div>
    <asp:Panel ID="messageBox" runat="server" Visible="False">
        <div class="modal fade" id="modal-notification" tabindex="-1" role="dialog" aria-labelledby="modal-notification" aria-hidden="true">
            <div class="modal-dialog modal-success modal-dialog-centered modal-" role="document">
                <div class="modal-content bg-gradient-warning">
                    <div class="modal-body">
                        <div class="text-center">
                            <i class="far fa-check-circle fa-4x"></i>
                            <h4 class="heading mt-4">Your booking has been cancelled.</h4>
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
            $('.time-slot').click(function () {
                $(this).next().click();
            });
        });
    </script>
</asp:Content>
