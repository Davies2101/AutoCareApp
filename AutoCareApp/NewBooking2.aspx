<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewBooking2.aspx.cs" Inherits="AutoCareApp.NewBooking2" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 class="mt-4 mb-3">New Booking</h2>
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a runat="server" href="~/Default">Home</a>
        </li>
        <li class="breadcrumb-item active">Booking</li>
    </ol>

    <div class="row">
        <div class="col-sm-6">
            <div class="form-horizontal">
        <asp:Label ID="lblError" runat="server" Text="Please enter your vehicle details"></asp:Label>
        <hr />

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="cmbPackage" CssClass="col-md-4 control-label">Select Package</asp:Label>
            <div class="col-md-8">
                <asp:DropDownList ID="cmbPackage" AutoPostBack="False" CssClass="form-control" runat="server" OnSelectedIndexChanged="cmbPackage_SelectedIndexChanged"></asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="cmbPackage"
                    CssClass="text-danger" ErrorMessage="Service Package is required." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="VehicleReg" CssClass="col-md-4 control-label">Vehicle Registration</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="VehicleReg" CssClass="form-control" TextMode="SingleLine" AutoPostBack="False" OnTextChanged="VehicleReg_TextChanged" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="VehicleReg"
                    CssClass="text-danger" ErrorMessage="Vehicle Registration field is required." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="VehicleMake" CssClass="col-md-4 control-label">Vehicle Make</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="VehicleMake" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="VehicleMake"
                    CssClass="text-danger" ErrorMessage="Vehicle Make field is required." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="VehicleModel" CssClass="col-md-4 control-label">Vehicle Model</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="VehicleModel" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="VehicleModel"
                    CssClass="text-danger" ErrorMessage="Vehicle Model field is required." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="VehicleColor" CssClass="col-md-4 control-label">Vehicle Color</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="VehicleColor" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="VehicleColor"
                    CssClass="text-danger" ErrorMessage="Vehicle Color field is required." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Address" CssClass="col-md-4 control-label">Address</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="Address" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Address"
                    CssClass="text-danger" ErrorMessage="Address field is required." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="PostCode" CssClass="col-md-4 control-label">PostCode</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="PostCode" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="PostCode"
                    CssClass="text-danger" ErrorMessage="PostCode field is required." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Remarks" CssClass="col-md-4 control-label">Comments</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="Remarks" CssClass="form-control" TextMode="MultiLine" />
            </div>
        </div>


        <div class="form-group">
            <div class="col-md-offset-2 col-md-8">
                <asp:Button runat="server" OnClick="BookNow_Click" Text="Book Now" CssClass="btn btn-primary" />
            </div>
        </div>
    </div>
        </div>
        <div class="col-sm-6">
            <h3>Additional Services</h3>

            <asp:CheckBoxList ID="chkServiceList" AutoPostBack="False" runat="server" OnSelectedIndexChanged="chkServiceList_SelectedIndexChanged"></asp:CheckBoxList>

            <br />
            <h3>Total Price</h3>
            <h4>Price: £ <asp:Label ID="lblPrice" runat="server" Text="0.00"></asp:Label></h4>
        </div>
    </div>

    


    <asp:Panel runat="server" id="panelPopup" Visible="false">
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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#myModal").modal('show');
        });
    </script>

</asp:Content>


