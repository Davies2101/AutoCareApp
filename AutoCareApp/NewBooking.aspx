<%@ Page Title="Booking" Language="C#" MasterPageFile="~/Booking.Master" AutoEventWireup="true" CodeBehind="NewBooking.aspx.cs" Inherits="AutoCareApp.NewBooking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .bootstrap-datetimepicker-widget.dropdown-menu{width: 100%;}

    </style>
    <!--   Big container   -->
    <div class="container ">
        <div class="row">
            <div class="col-sm-8 col-sm-offset-2">
                <!--      Wizard container        -->
                <div class="wizard-container">
                    <div class="card wizard-card" data-color="purple" id="wizard">
                        <form runat="server" novalidate="novalidate">
                            <div class="wizard-header">
                                <h3 class="wizard-title">Book a Room
                                </h3>
                                <asp:Label ID="lblError" runat="server" Text="Please enter your vehicle details" Visible="False"></asp:Label>
                                <div class="row">
                                    <h4>Total Price: £ <span id="spnPrice"></span></h4>
                                </div>
                            </div>
                            <div class="wizard-navigation">
                                <ul class="nav nav-pills">
                                    <li class="active" style="width: 25%;"><a href="#packages" data-toggle="tab" aria-expanded="true">Packages</a></li>
                                    <li class="" style="width: 25%;"><a href="#vehicle" data-toggle="tab" aria-expanded="false">Vehicle</a></li>
                                    <li class="" style="width: 25%;"><a href="#address" data-toggle="tab" aria-expanded="false">Address</a></li>
                                    <li class="" style="width: 25%;"><a href="#summary" data-toggle="tab" aria-expanded="false">Summary</a></li>
                                </ul>
                                <div class="moving-tab" style="width: 250px; transform: translate3d(-8px, 0px, 0px); transition: all 0.5s cubic-bezier(0.29, 1.42, 0.79, 1) 0s;">Account</div>
                            </div>

                            <div class="tab-content">
                                <div class="tab-pane active" id="packages">
                                    <div class="row">
                                        <div class="col-sm-10 col-sm-offset-1">
                                            <asp:ListView ID="lstVPackage" runat="server">
                                                <LayoutTemplate>
                                                    <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                                                </LayoutTemplate>
                                                <ItemTemplate>
                                                    <div class="col-md-3">
                                                        <div class="choice" data-toggle="wizard-radio" rel="tooltip" title="" data-original-title="Price: £ <%#Eval("PackagePrice")%>">
                                                            <input type="radio" name="package" value="<%#Eval("PackageID")%>" data-packageprice="<%#Eval("PackagePrice")%>" data-packagename="<%#Eval("PackageName")%>">
                                                            <div class="icon">
                                                                <i class="material-icons">directions_car</i>
                                                            </div>
                                                            <h6><%#Eval("PackageName")%></h6>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:ListView>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-10 col-sm-offset-1 additional-service-list">
                                            <h5 class="title">Additional Services</h5>
                                            <asp:ListView ID="lstServices" runat="server">
                                                <LayoutTemplate>
                                                    <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                                                </LayoutTemplate>
                                                <ItemTemplate>
                                                    <div class="form-check col-md-5">
                                                        <label class="form-check-label">
                                                            <input class="form-check-input" type="checkbox" value="<%#Eval("ServiceID")%>" data-serviceprice="<%#Eval("ServicePrice")%>" data-servicename="<%#Eval("ServiceName")%>">
                                                            <%#Eval("ServiceName")%>
                                                            <span class="form-check-sign">
                                                                <span class="check"></span>
                                                            </span>
                                                        </label>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:ListView>
                                            <asp:HiddenField ID="hdnPackages" runat="server" value="-1" />
                                            <asp:HiddenField ID="hdnServiceList" runat="server" />
                                        </div>
                                    </div>

                                </div>
                                <div class="tab-pane" id="vehicle">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="material-icons">directions_car</i>
                                                </span>
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label">Vehicle Registration Number</label>
                                                    <asp:TextBox runat="server" ID="VehicleReg" CssClass="form-control" TextMode="SingleLine" AutoPostBack="False" OnTextChanged="VehicleReg_TextChanged" />
                                                    <span class="material-input"></span>
                                                </div>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="VehicleReg"
                                                    CssClass="text-danger small" ErrorMessage="Vehicle Registration Number field is required." />
                                            </div>
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="material-icons">branding_watermark</i>
                                                </span>
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label">Vehicle Make</label>
                                                    <asp:TextBox runat="server" ID="VehicleMake" CssClass="form-control" TextMode="SingleLine" />
                                                    <span class="material-input"></span>
                                                </div>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="VehicleMake"
                                                    CssClass="text-danger small" ErrorMessage="Vehicle Make field is required." />
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="material-icons">beenhere</i>
                                                </span>
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label">Vehicle Model</label>
                                                    <asp:TextBox runat="server" ID="VehicleModel" CssClass="form-control" TextMode="SingleLine" />
                                                    <span class="material-input"></span>
                                                </div>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="VehicleModel"
                                                    CssClass="text-danger small" ErrorMessage="Vehicle Model field is required." />
                                            </div>
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="material-icons">color_lens</i>
                                                </span>
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label">Vehicle Color</label>
                                                    <asp:TextBox runat="server" ID="VehicleColor" CssClass="form-control" TextMode="SingleLine" />
                                                    <span class="material-input"></span>
                                                </div>
                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="VehicleColor"
                                                    CssClass="text-danger small" ErrorMessage="Vehicle Color field is required." />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="address">
                                    <div class="col-md-6">
                                        <div class="input-group">
                                            <span class="input-group-addon">
                                                <i class="material-icons">location_on</i>
                                            </span>
                                            <div class="form-group label-floating is-empty">
                                                <label class="control-label">Address</label>
                                                <asp:TextBox runat="server" ID="Address" CssClass="form-control" TextMode="SingleLine" />
                                                <span class="material-input"></span>
                                            </div>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Address"
                                                CssClass="text-danger small" ErrorMessage="Address field is required." />
                                        </div>
                                        <div class="input-group">
                                            <span class="input-group-addon">
                                                <i class="material-icons">markunread</i>
                                            </span>
                                            <div class="form-group label-floating is-empty">
                                                <label class="control-label">Post Code</label>
                                                <asp:TextBox runat="server" ID="PostCode" CssClass="form-control" TextMode="SingleLine" />
                                                <span class="material-input"></span>
                                            </div>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="PostCode"
                                                CssClass="text-danger small" ErrorMessage="Post Code field is required." />
                                        </div>

                                    </div>
                                 
                                    <div class="col-md-6">
                                        <div class="input-group">
                                            <span class="input-group-addon">
                                                <i class="material-icons">calendar_today</i>
                                            </span>
                                            <div class="form-group label-floating is-empty">
                                                <label class="control-label">Date</label>
                                                <asp:TextBox runat="server" ID="BookingDate" CssClass="form-control datetimepicker" TextMode="SingleLine" />
                                                <span class="material-input"></span>
                                            </div>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="BookingDate"
                                                                        CssClass="text-danger small" ErrorMessage="Booking Date field is required." />
                                        </div>
                                        <div class="form-group is-empty">
                                            <label>Remark</label>
                                            <asp:TextBox runat="server" ID="Remarks" CssClass="form-control" TextMode="MultiLine" Rows="5" />
                                            <span class="material-input"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="summary">
                                    <table class="table table-hover summary-table">
                                        <thead>
                                            <tr>
                                                <th>Product</th>
                                                <th></th>
                                                <th></th>
                                                <th class="text-left">Price</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="col-md-9">Package: <span id='selectedPackage'></span></td>
                                                <td class="col-md-1"></td>
                                                <td class="col-md-1"></td>
                                                <td class="col-md-1 text-left"> £<span id='selectedPackagePrice'></span></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                </div>
                <div class="wizard-footer">
                    <div class="pull-right">
                        <input type="button" class="btn btn-next btn-fill btn-primary btn-wd" name="next" value="Next" style="">
                        <asp:Button runat="server" OnClick="BookNow_Click" Text="Book Now" CssClass="btn btn-finish btn-fill btn-primary btn-wd" Style="display: none;" OnClientClick="validate();" />
                    </div>
                    <div class="pull-left">
                        <input type='button' class='btn btn-previous btn-fill btn-default btn-wd' name='previous' value='Previous' />
                    </div>

                    <div class="clearfix"></div>
                </div>
                        
                        <!--  big container -->
                        <asp:Panel runat="server" ID="panelPopup" Visible="false">
                            <div class="modal fade" id="myModal">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title">Booking</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            Booking submited successfully
                                        </div>
                                        <div class="modal-footer">
                                            <asp:Button runat="server" type="button" Text="OK" class="btn btn-success waves-effect waves-light" PostBackUrl="~/Default.aspx" />
                                        </div>

                                    </div>

                                </div>
                            </div>
                        </asp:Panel>
                </form>
            </div>
        </div>
        <!-- wizard container -->
    </div>
    </div>
    <div class="modal fade" id="errorModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Error!</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    
                </div>
                <div class="modal-footer">
                    <input id="btnModalOk" type="button" value="Close" data-dismiss="modal" class="btn btn-default"/>
                </div>

            </div>

        </div>
    </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#myModal").modal('show');
            $("#myModal").removeClass('fade');
            $('.datetimepicker').datetimepicker({
                icons: {
                    time: "fa fa-clock-o",
                    date: "fa fa-calendar",
                    up: "fa fa-chevron-up",
                    down: "fa fa-chevron-down",
                    previous: 'fa fa-chevron-left',
                    next: 'fa fa-chevron-right',
                    today: 'fa fa-screenshot',
                    clear: 'fa fa-trash',
                    close: 'fa fa-remove'
                },
                format: 'MM/DD/YYYY'
              
            });
        });

        $(".additional-service-list input[type='checkbox']").change(function () {
            calculateTotal();
        });

        function calculateTotal() {
            var selectedValues = [];
            $('.summary-table .service').remove();
            $('.summary-table .total').remove();
            var total = Number($('#selectedPackagePrice').text());
            $.each($(".additional-service-list input[type='checkbox']:checked"), function () {
                selectedValues.push($(this).val());
                var servicePrice = $(this).attr('data-serviceprice');
                total = Number(total) + Number(servicePrice);
                $('.summary-table tbody').append(getServiceDetails($(this).attr('data-servicename'), servicePrice));
            });
            $('.summary-table tbody').append(getTotal(total));
            document.getElementById('<%= hdnServiceList.ClientID %>').value = selectedValues;
            setPrice();
        }
        function getServiceDetails(serviceName, servicePrice) {
            return '<tr class="service"><td class="col-md-9">' +
                serviceName +
                '</td><td class="col-md-1"></td><td class="col-md-1"></td><td class="col-md-1 text-left">£' +
                servicePrice +
                '</td></tr>';
        }

        function getTotal(total) {
            return '<tr class="total"><td></td><td></td><td class="text-right"><h6 class="title">Total: </h5></td><td class="text-left"><h5 class="title">£<span> ' +
                total +
                '</span></h5></td></tr>';
        }
        function changePackage() {
            var selectedElement = $("input[name='package']:checked");
            document.getElementById('<%= hdnPackages.ClientID %>').value = $(selectedElement).val();
            $('#selectedPackage').text($(selectedElement).attr('data-packagename'));
            $('#selectedPackagePrice').text($(selectedElement).attr('data-packageprice'));
            calculateTotal();
        }

        function setPrice() {
            $.ajax({
                type: "POST",
                url: "<%= ResolveUrl("NewBooking.aspx/SetPrices") %>",
                data: JSON.stringify({ 'packageId': $('#' + '<%= hdnPackages.ClientID%>').val(), 'services': $('#' + '<%= hdnServiceList.ClientID%>').val() }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    $('#spnPrice').text(response.d);
                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        }
       
        function validate() {
            var errorMessage = '';
            if (document.getElementById('<%=hdnPackages.ClientID%>').value === '-1') {
                errorMessage = '<div class="error">Please select a Package.</div>'
            }
            if (document.getElementById('<%=VehicleReg.ClientID%>').value === '') {
                errorMessage += '<div class="error">The Vehicle Registration is required.</div>'
            }
            if (document.getElementById('<%=VehicleMake.ClientID%>').value === '') {
                errorMessage += '<div class="error">The Vehicle Make is required.</div>'
            }
            if (document.getElementById('<%=VehicleModel.ClientID%>').value === '') {
                errorMessage += '<div class="error">The Vehicle Model is required.</div>'
            }
            if (document.getElementById('<%=VehicleColor.ClientID%>').value === '') {
                errorMessage += '<div class="error">The Vehicle Color is required.</div>'
            }
            if (document.getElementById('<%=Address.ClientID%>').value === '') {
                errorMessage += '<div class="error">The Address is required.</div>'
            }
            if (document.getElementById('<%=PostCode.ClientID%>').value === '') {
                errorMessage += '<div class="error">The Post Code is required.</div>'
            }
            if (document.getElementById('<%=BookingDate.ClientID%>').value === '') {
                errorMessage += '<div class="error">The Booking Date is required.</div>'
            }

            if (errorMessage !== '') {
                $('#errorModal .modal-body').html(errorMessage);
                $("#errorModal").modal('show');
                $("#errorModal").removeClass('fade');
                return false;
            }
            return true;
        }
    </script>
</asp:Content>


