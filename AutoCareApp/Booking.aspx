<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="AutoCareApp.Booking" %>
<%@ Import Namespace="System.Activities.Statements" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="alertBox" runat="server" Visible="False">
        <div class="alert alert-danger alert-dismissible fade show text-center" role="alert">
            <span class="alert-text">
                <asp:Label ID="lblAlert" runat="server" Text=""></asp:Label></span>
            <button type="button" class="close" aria-label="Close" onclick="redirect();">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </asp:Panel>
    <div class="container">
        <div class="section text-center">
            <div class="row">
                <div class="card col-xl-12 mt-2">
                    <asp:Wizard runat="server" DisplaySideBar="False" ID="Wizard1" OnPreRender="Wizard1_OnPreRender" OnActiveStepChanged="Wizard1_OnActiveStepChanged">
                        <WizardSteps>
                            <asp:WizardStep Title="Packages" runat="server">
                                <div class="card content">
                                    <div class="card-header card-header-primary text-center">
                                        <h2 class="text-left">Select Your Package</h2>
                                        <h2 class="text-right">Total: £
                                            <asp:Label ID="lblTotal1" runat="server" Text=""></asp:Label>
                                        </h2>
                                    </div>
                                    <div class="card-body">
                                        <div class="row">
                                            <asp:ListView ID="lstVPackage" runat="server">
                                                <ItemTemplate>
                                                    <div class="card col-md-3" runat="server" id="divCard">
                                                        <div class='<%#Eval("PackageName").ToString().ToLower() + " card-header"%>' runat="server">
                                                            <span class=""><%#Eval("PackageName")%></span>
                                                        </div>
                                                        <div class="card-body bg-gradient-secondary">
                                                            <h2 class="card-title">£ <%#Eval("PackagePrice")%></h2>
                                                            <div class="card-text text-left" style="min-height: 185px">
                                                                <span class="text-sm d-block mb-1"><i class="far fa-check-square mr-2"></i><%#Eval("Content1")%></span>
                                                                <span class="text-sm d-block mb-1"><i class="far fa-check-square mr-2"></i><%#Eval("Content2")%></span>
                                                                <span class="text-sm d-block mb-1"><i class="far fa-check-square mr-2"></i><%#Eval("Content3")%></span>
                                                                <span class="text-sm d-block mb-1"><%# (string)Eval("Content4") == "" ? "" : "<i class='far fa-check-square mr-2'></i>" + Eval("Content4") %></span>
                                                                <span class="text-sm d-block mb-1"><%# (string)Eval("Content5") == "" ? "" : "<i class='far fa-check-square mr-2'></i>" + Eval("Content5") %></span>
                                                                <span class="text-sm d-block mb-1"><%# (string)Eval("Content6") == "" ? "" : "<i class='far fa-check-square mr-2'></i>" + Eval("Content6") %></span>
                                                                <span class="text-sm d-block mb-1"><%# (string)Eval("Content7") == "" ? "" : "<i class='far fa-check-square mr-2'></i>" + Eval("Content7") %></span>
                                                            </div>
                                                            <asp:Button ID="btnSelectPackage" runat="server" Text="Select" CssClass='<%#Eval("PackageName").ToString().ToLower() + " btn"%>' OnClick="btnSelectPackage_OnClick" PackageID='<%#Eval("PackageID")%>' />
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:ListView>
                                        </div>

                                    </div>
                                </div>

                            </asp:WizardStep>
                            <asp:WizardStep Title="Date & Time" runat="server">
                                <div class="card content">
                                    <div class="card-header card-header-primary text-center">
                                        <h2>Select Booking Date and Time</h2>
                                        <h2 class="text-right">Total: £
                                            <asp:Label ID="lblTotal2" runat="server" Text=""></asp:Label>
                                        </h2>
                                    </div>
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-lg-5">
                                                <h5>Select a Date</h5>
                                                <asp:Calendar ID="bookingDate" runat="server" Height="365" Width="390" OnDayRender="bookingDate_OnDayRender"
                                                    FirstDayOfWeek="Monday" OnSelectionChanged="bookingDate_OnSelectionChanged"></asp:Calendar>
                                            </div>
                                            <div class="col-lg-3">
                                                <h5>Select a Time</h5>
                                                <asp:ListView ID="lstVTimeSlots" runat="server">
                                                    <ItemTemplate>
                                                        <div class="col-md-12 col-lg-6 ml-auto mr-auto">
                                                            <a id="linkSelectedTime" href="#" class='<%# bool.Parse(Eval("IsAvailable").ToString()) ? "time-slot btn btn-outline-primary" : "time-slot btn btn-outline-primary disabled"%>'
                                                                style="width: 120px" runat="server" timeslot='<%#Eval("Value")%>'><%#Eval("Time")%></a>
                                                            <asp:Button ID="btnSelectTime" runat="server" OnClick="btnSelectTime_OnClick" TimeSlot='<%#Eval("Value")%>' CssClass="invisible" />
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:ListView>
                                            </div>
                                            <div class="col-lg-4">
                                                <h5>Additional services (optional)</h5>
                                                <asp:CheckBoxList ID="chkBoxServices" runat="server" CssClass="text-left" AutoPostBack="True" OnSelectedIndexChanged="chkBoxServices_OnSelectedIndexChanged">
                                                    <asp:ListItem Value="1" Text="Wax - (£10)"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="Engine Clean - (£12)"></asp:ListItem>
                                                    <asp:ListItem Value="3" Text="Paintwork Buffed - (£8.5)"></asp:ListItem>
                                                    <asp:ListItem Value="4" Text="Shampoo Self-Cleaning Pack - (£12.5)"></asp:ListItem>
                                                </asp:CheckBoxList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:WizardStep>
                            <asp:WizardStep Title="Add Your Info" runat="server">
                                <div class="card content">
                                    <div class="card-header card-header-primary text-center">
                                        <h2>Add Your Info</h2>
                                        <h2 class="text-right">Total: £
                                            <asp:Label ID="lblTotal3" runat="server" Text=""></asp:Label>
                                        </h2>
                                    </div>
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="bmd-form-group">
                                                    <div class="input-group">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text">
                                                                <i class="far fa-registered"></i>
                                                            </span>
                                                        </div>
                                                        <asp:TextBox runat="server" ID="VehicleReg" CssClass="form-control" TextMode="SingleLine" placeholder="Vehicle Registraion No." />
                                                    </div>
                                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="VehicleReg"
                                                        CssClass="text-danger small" ErrorMessage="The Vehicle Registraion No. is required." />
                                                </div>
                                                <div class="bmd-form-group">
                                                    <div class="input-group">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text">
                                                                <i class="fas fa-wrench"></i>
                                                            </span>
                                                        </div>
                                                        <asp:TextBox runat="server" ID="VehicleMake" CssClass="form-control" TextMode="SingleLine" placeholder="Vehicle Make" />
                                                    </div>
                                                    &nbsp;
                                                </div>
                                                <div class="bmd-form-group">
                                                    <div class="input-group">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text">
                                                                <i class="fas fa-truck-pickup"></i>
                                                            </span>
                                                        </div>
                                                        <asp:TextBox runat="server" ID="VehicleModel" CssClass="form-control" TextMode="SingleLine" placeholder="Vehicle Model" />
                                                    </div>
                                                    &nbsp;
                                                </div>
                                                <div class="bmd-form-group">
                                                    <div class="input-group">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text">
                                                                <i class="fas fa-palette"></i>
                                                            </span>
                                                        </div>
                                                        <asp:TextBox runat="server" ID="VehicleColor" CssClass="form-control" TextMode="SingleLine" placeholder="Vehicle Color" />
                                                    </div>
                                                    &nbsp;
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="bmd-form-group">
                                                    <div class="input-group">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text">
                                                                <i class="fas fa-map-marker-alt"></i>
                                                            </span>
                                                        </div>
                                                        <asp:TextBox runat="server" ID="Address" CssClass="form-control" TextMode="SingleLine" placeholder="Address" />
                                                    </div>
                                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Address"
                                                        CssClass="text-danger small" ErrorMessage="The Address is required." />
                                                </div>
                                                <div class="bmd-form-group">
                                                    <div class="input-group">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text">
                                                                <i class="fas fa-envelope"></i>
                                                            </span>
                                                        </div>
                                                        <asp:TextBox runat="server" ID="PostCode" CssClass="form-control" TextMode="SingleLine" placeholder="Post Code" />
                                                    </div>
                                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="PostCode"
                                                        CssClass="text-danger small" ErrorMessage="The PostCode is required." />
                                                </div>
                                                <div class="bmd-form-group">
                                                    <div class="input-group">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text">
                                                                <i class="far fa-sticky-note"></i>
                                                            </span>
                                                        </div>
                                                        <asp:TextBox runat="server" ID="Remarks" CssClass="form-control" TextMode="MultiLine" placeholder="Remarks" Rows="4" Height="118px" />
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:WizardStep>
                            <asp:WizardStep Title="Summary" runat="server">
                                <div class="card content">
                                    <div class="card-header card-header-primary text-center">
                                        <h2 class="text-center">Booking Summary</h2>
                                    </div>
                                    <asp:Panel ID="panelBookingSummary" runat="server">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-md-12 text-left mb-2"> Booking Date and Time: <asp:Label ID="lblBookingDateAndTime" runat="server" Text=""></asp:Label></div>
                                                <table class="table table-hover table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th class="text-left">
                                                                <h4>Product</h4>
                                                            </th>
                                                            <th class="text-left">
                                                                <h4>Price</h4>
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td class="col-md-9 text-left">Package:
                                                            <asp:Label ID="lblPackageName" runat="server" Text=""></asp:Label></td>
                                                            <td class="col-md-3 text-left">£
                                                            <asp:Label ID="lblPackagePrice" runat="server" Text=""></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                            <td class="col-md-9 text-left">
                                                                <asp:Label ID="lblServices" runat="server" Text="Additional Services:" Visible="False"></asp:Label></td>
                                                            <td class="col-md-3 text-left"></td>
                                                        </tr>
                                                        <asp:ListView ID="lstViewExtras" runat="server">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td class="col-md-9 text-left">&nbsp;&nbsp;<i class="fas fa-dot-circle"></i>&nbsp;&nbsp;<%#Eval("ExtraName")%></td>
                                                                    <td class="col-md-3 text-left">£ <%# string.Format("{0:0.00}",Eval("ExtraPrice"))%></td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:ListView>
                                                        <tr class="font-weight-800">
                                                            <td class="col-md-9 text-left">
                                                                <h4>Total:</h4>
                                                            </td>
                                                            <td class="col-md-3 text-left">
                                                                <h4>£
                                                                <asp:Label ID="lblTotal" runat="server" Text="Total:"></asp:Label></h4>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>

                                            </div>
                                        </div>
                                    </asp:Panel>
                                </div>
                            </asp:WizardStep>
                        </WizardSteps>
                         <HeaderTemplate>
                            <ul id="wizHeader">
                                <asp:Repeater ID="SideBarList" runat="server">
                                    <ItemTemplate>
                                        <li><a class="<%# GetClassForWizardStep(Container.DataItem) %>" title="<%#Eval("Name")%>">
                                            <%# Eval("Name")%></a> </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </HeaderTemplate>
                        <StartNavigationTemplate>
                            <asp:Button ID="StartNextButton" runat="server" Text="Next" CommandName="MoveNext" CssClass="btn btn-default" />
                        </StartNavigationTemplate>
                        <StepNavigationTemplate>
                            <asp:Button ID="StepPreviousButton" Text="Previous" runat="server" CommandName="MovePrevious" CssClass="btn btn-primary" />
                            <asp:Button ID="StepNextButton" runat="server" Text="Next" CommandName="MoveNext" CssClass="btn btn-default" />
                        </StepNavigationTemplate>
                        <FinishNavigationTemplate>
                            <asp:Button ID="FinishPreviousButton" runat="server" Text="Previous" CommandName="MovePrevious" CssClass="btn btn-primary" />
                            <asp:Button ID="FinishButton" runat="server" Text="Book Now" CommandName="MoveComplete" CssClass="btn btn-default" OnClick="FinishButton_OnClick" />
                        </FinishNavigationTemplate>
                    </asp:Wizard>
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
                            <h4 class="heading mt-4">Your booking has been confirmed.</h4>
                            <p>Check your email for details.</p>
                            <div id="dvCountDown" style="display:none;font-size:small;">You will be redirected to Home in <span id="lblCount"></span>&nbsp;seconds.</div>
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
        function redirectToHome() {
            var seconds = 5;
            var dvCountDown = document.getElementById("dvCountDown");
            var lblCount = document.getElementById("lblCount");
            dvCountDown.style.display = "block";
            lblCount.innerHTML = seconds;
            setInterval(function () {
                seconds--;
                lblCount.innerHTML = seconds;
                if (seconds == 0) {
                    window.location = "Default.aspx";
                }
            }, 1000);
        }
    </script>
</asp:Content>
