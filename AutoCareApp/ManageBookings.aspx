<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ManageBookings.aspx.cs" Inherits="AutoCareApp.ManageBookings" %>

<%--tab view source https://codepen.io/RGonyeau/pen/Mvrzxx--%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .fancyTab {
            text-align: center;
            padding: 15px 0;
            background-color: #eee;
            box-shadow: 0 0 0 1px #ddd;
            top: 15px;
            transition: top 0.2s;
        }

            .fancyTab.active {
                top: 0;
                transition: top 0.2s;
            }

        .whiteBlock {
            display: none;
        }

        .fancyTab.active .whiteBlock {
            display: block;
            height: 2px;
            bottom: -2px;
            background-color: #fff;
            width: 99%;
            position: absolute;
            z-index: 1;
        }

        .fancyTab a {
            font-family: "Source Sans Pro";
            font-size: 1.65em;
            font-weight: 300;
            transition: 0.2s;
            color: #333;
        }

        /*.fancyTab .hidden-xs {
  white-space:nowrap;
}*/

        .fancyTabs {
            border-bottom: 2px solid #ddd;
            margin: 15px 0 0;
        }

        li.fancyTab a {
            padding-top: 15px;
            top: -15px;
            padding-bottom: 0;
        }

        li.fancyTab.active a {
            padding-top: inherit;
        }

        .fancyTab .fa {
            font-size: 40px;
            width: 100%;
            padding: 15px 0 5px;
            color: #666;
        }

        .fancyTab.active .fa {
            color: #172b4d;
        }

        .fancyTab a:focus {
            outline: none;
        }

        .fancyTabContent {
            border-color: transparent;
            box-shadow: 0 -2px 0 -1px #fff, 0 0 0 1px #ddd;
            padding: 30px 15px 15px;
            position: relative;
            background-color: #fff;
        }

        .nav-tabs > li.fancyTab.active > a,
        .nav-tabs > li.fancyTab.active > a:focus,
        .nav-tabs > li.fancyTab.active > a:hover {
            border-width: 0;
        }

        .nav-tabs > li.fancyTab:hover {
            background-color: #f9f9f9;
            box-shadow: 0 0 0 1px #ddd;
        }

        .nav-tabs > li.fancyTab.active:hover {
            background-color: #fff;
            box-shadow: 1px 1px 0 1px #fff, 0 0px 0 1px #ddd, -1px 1px 0 0px #ddd inset;
        }

        .nav-tabs > li.fancyTab:hover a {
            border-color: transparent;
        }

        .nav.nav-tabs .fancyTab a[data-toggle="tab"] {
            background-color: transparent;
            border-bottom: 0;
        }

        .nav-tabs > li.fancyTab:hover a {
            border-right: 1px solid transparent;
        }

        .nav-tabs > li.fancyTab > a {
            margin-right: 0;
            border-top: 0;
            padding-bottom: 30px;
            margin-bottom: -30px;
        }

        .nav-tabs > li.fancyTab {
            margin-right: 0;
            margin-bottom: 0;
        }

            .nav-tabs > li.fancyTab:last-child a {
                border-right: 1px solid transparent;
            }

            .nav-tabs > li.fancyTab.active:last-child {
                border-right: 0px solid #ddd;
                box-shadow: 0px 2px 0 0px #fff, 0px 0px 0 1px #ddd;
            }

        .fancyTab:last-child {
            box-shadow: 0 0 0 1px #ddd;
        }

        .tabs .nav-tabs li.fancyTab.active a {
            box-shadow: none;
            top: 0;
        }

        .fancyTab.active {
            background: #fff;
            box-shadow: 1px 1px 0 1px #fff, 0 0px 0 1px #ddd, -1px 1px 0 0px #ddd inset;
            padding-bottom: 30px;
        }

        @media (max-width: 1200px) {
            .fancyTab .fa {
                font-size: 36px;
            }

            .fancyTab .hidden-xs {
                font-size: 22px;
            }
        }

        @media (max-width: 992px) {
            .fancyTab .fa {
                font-size: 33px;
            }

            .fancyTab .hidden-xs {
                font-size: 18px;
                font-weight: normal;
            }
        }

        @media (max-width: 768px) {
            .fancyTab > a {
                font-size: 18px;
            }

            .nav > li.fancyTab > a {
                padding: 15px 0;
                margin-bottom: inherit;
            }

            .fancyTab .fa {
                font-size: 30px;
            }

            .nav-tabs > li.fancyTab > a {
                border-right: 1px solid transparent;
                padding-bottom: 0;
            }

            .fancyTab.active .fa {
                color: #333;
            }
        }
    </style>


    <div class="container">
        <div class="section">
            <div class="row">
                <div class="col-md-12 ml-auto mr-auto">
                    <div class="card">
                        <div class="card-body">
                            <section id="fancyTabWidget" class="tabs t-tabs">
                                <ul class="nav nav-tabs fancyTabs" role="tablist">
                                    <li class="tab fancyTab active">
                                        <a id="tab0" href="#tabBody0" role="tab" aria-controls="tabBody0" aria-selected="true" data-toggle="tab" tabindex="0"><span class="fa fa-calendar-check"></span><span class="hidden-xs">Current Bookings</span></a>
                                        <div class="whiteBlock"></div>
                                    </li>

                                    <li class="tab fancyTab">
                                        <a id="tab1" href="#tabBody1" role="tab" aria-controls="tabBody1" aria-selected="true" data-toggle="tab" tabindex="0"><span class="fa fa-calendar-alt"></span><span class="hidden-xs">Calendar Bookings</span></a>
                                        <div class="whiteBlock"></div>
                                    </li>
                                </ul>
                                <div id="myTabContent" class="tab-content fancyTabContent" aria-live="polite">
                                    <div class="tab-pane fade active in show" id="tabBody0" role="tabpanel" aria-labelledby="tab0" aria-hidden="false" tabindex="0">
                                        <div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="table-responsive">
                                                        <div>
                                                            <table class="table align-items-center">
                                                                <thead class="thead-light">
                                                                    <tr>
                                                                        <th class="text-left" scope="col">Booking #</th>
                                                                        <th class="text-left" scope="col">Time</th>
                                                                        <th class="text-left" scope="col">Customer</th>
                                                                        <th class="text-left" scope="col">Vehicle #</th>
                                                                        <th class="text-left" scope="col">Package</th>
                                                                        <th class="text-left" scope="col">Extras</th>
                                                                        <th class="text-left" scope="col">Status</th>
                                                                        <th scope="col"></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody class="list">
                                                                    <asp:ListView ID="lstBookings" runat="server">
                                                                        <ItemTemplate>
                                                                            <tr>
                                                                                <td class="text-left"><%#string.Format("#{0}",Eval("BookingNo"))%></td>
                                                                                <td class="text-left"><%#DateTime.Today.Add((TimeSpan)Eval("TimeSlot")).ToString("hh:mm tt")%></td>
                                                                                <td class="text-left"><%#Eval("Customer")%></td>
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
                                                                                    <div class='dropdown <%# (string)Eval("Status") == "On Schedule" ? "" : "d-none" %>'>
                                                                                        <a class="btn btn-sm btn-icon-only text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                                            <i class="fas fa-ellipsis-v"></i>
                                                                                        </a>
                                                                                        <div class='dropdown-menu dropdown-menu-right dropdown-menu-arrow'>
                                                                                            <asp:Button ID="btnEnd" runat="server" Text="Mark off as ‘Complete’" CssClass="dropdown-item" BookingId='<%# Eval("BookingNo")%>' OnClick="btnEnd_OnClick" />
                                                                                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="dropdown-item" BookingId='<%# Eval("BookingNo")%>' OnClick="btnCancel_OnClick" />
                                                                                            <a href='BookingAdmin.aspx?id=<%# Eval("BookingNo")%>' class='dropdown-item'>Edit</a>
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
                                    <div class="tab-pane fade" id="tabBody1" role="tabpanel" aria-labelledby="tab1" aria-hidden="true" tabindex="0">
                                        <div class="row">

                                            <div class="col-md-10">
                                                <div class="input-daterange datepicker row align-items-center">
                                                    <div class="col">
                                                        <div class="form-group">
                                                            <div class="input-group">
                                                                <div class="input-group-prepend">
                                                                    <span class="input-group-text"><i class="ni ni-calendar-grid-58"></i></span>
                                                                </div>
                                                                <asp:TextBox ID="txtStartDate" runat="server" placeholder="Start date" CssClass="form-control"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="form-group">
                                                            <div class="input-group">
                                                                <div class="input-group-prepend">
                                                                    <span class="input-group-text"><i class="ni ni-calendar-grid-58"></i></span>
                                                                </div>
                                                                <asp:TextBox ID="txtEndDate" runat="server" placeholder="End date" CssClass="form-control"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <asp:Button ID="btnRun" runat="server" Text="Run" CssClass="btn btn-default" OnClick="btnRun_OnClick" />
                                            </div>
                                            <div class="table-responsive">
                                                <div>
                                                    <table class="table align-items-center">
                                                        <thead class="thead-light">
                                                            <tr>
                                                                <th class="text-left" scope="col">Booking #</th>
                                                                <th class="text-left" scope="col">Date</th>
                                                                <th class="text-left" scope="col">Time</th>
                                                                <th class="text-left" scope="col">Customer</th>
                                                                <th class="text-left" scope="col">Vehicle #</th>
                                                                <th class="text-left" scope="col">Package</th>
                                                                <th class="text-left" scope="col">Total</th>
                                                                <th class="text-left" scope="col">Status</th>
                                                                <th scope="col"></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody class="list">
                                                            <asp:ListView ID="lstAllBookings" runat="server">
                                                                <ItemTemplate>
                                                                    <tr>
                                                                        <td class="text-left"><%#string.Format("#{0}",Eval("BookingNo"))%></td>
                                                                        <td class="text-left"><%#DateTime.Parse(Eval("BookingDate").ToString()).ToShortDateString()%></td>
                                                                        <td class="text-left"><%#DateTime.Today.Add((TimeSpan)Eval("TimeSlot")).ToString("hh:mm tt")%></td>
                                                                        <td class="text-left"><%#Eval("Customer")%></td>
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
                                                                            <div class='dropdown <%# (string)Eval("Status") == "On Schedule" ? "" : "d-none" %>'>
                                                                                <a class="btn btn-sm btn-icon-only text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                                    <i class="fas fa-ellipsis-v"></i>
                                                                                </a>
                                                                                <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                                                                                    <asp:Button ID="btnCancelAll" runat="server" Text="Cancel" CssClass="dropdown-item" BookingId='<%# Eval("BookingNo")%>' OnClick="btnCancelAll_OnClick" />
                                                                                    <a href='BookingAdmin.aspx?id=<%# Eval("BookingNo")%>' class='dropdown-item'>Edit</a>
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
                            </section>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <asp:HiddenField ID="hdnTab" runat="server" Value="tab0" />
    <asp:Panel ID="messageBox" runat="server" Visible="False">
        <div class="modal fade" id="modal-notification" tabindex="-1" role="dialog" aria-labelledby="modal-notification" aria-hidden="true">
            <div class="modal-dialog modal-success modal-dialog-centered modal-" role="document">
                <div class="modal-content bg-gradient-success">
                    <div class="modal-body">
                        <div class="text-center">
                            <i class="far fa-check-circle fa-4x"></i>
                            <h4 class="heading mt-4"><asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label></h4>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-white ml-auto" data-dismiss="modal">Ok</button>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
    <%-- <script src="/assets/vendor/jquery/dist/jquery.min.js"></script>--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#modal-notification").modal('show');
            $('.time-slot').click(function () {
                $(this).next().click();
            });

            $("li.fancyTab").width('50%');
        });

        $(window).load(function () {

            $('.fancyTabs').each(function () {

                var highestBox = 0;
                $('.fancyTab a', this).each(function () {

                    if ($(this).height() > highestBox)
                        highestBox = $(this).height();
                });

                $('.fancyTab a', this).height(highestBox);

            });
        });

        function defaultTab(id) {
            $('#' + id).click();
            $('.fancyTab').removeClass('active');
            $('#' + id).parent().addClass('active');
        }

        $('.fancyTabs .fancyTab').click(function () {
           $("#<%= hdnTab.ClientID %>").val($(this).find('a').attr('id'));
        });
    </script>
</asp:Content>
