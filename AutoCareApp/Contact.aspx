<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="AutoCareApp.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="alertBox" runat="server" Visible="False">
        <div class="alert alert-dismissible fade show text-center" role="alert" runat="server">
            <span class="alert-text">
                <asp:Label ID="lblAlert" runat="server" Text=""></asp:Label></span>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </asp:Panel>
    <div class="container">
        <div class="section text-center">
            <div class="row">
                <div class="col-md-6 ml-auto mr-auto card">
                    <div class="card-header card-header-primary">
                        <h2>Send us a Message</h2>
                    </div>
                    <div class="card-body">
                        <div class="bmd-form-group">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <i class="fas fa-user"></i>
                                    </span>
                                </div>
                                <asp:TextBox runat="server" ID="ContactName" CssClass="form-control" TextMode="SingleLine" placeholder="Name" />
                            </div>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="ContactName"
                                CssClass="text-danger small" ErrorMessage="Name is required." />
                        </div>
                        <div class="bmd-form-group">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <i class="fas fa-envelope"></i>
                                    </span>
                                </div>
                                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" placeholder="Email" />
                            </div>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                CssClass="text-danger small" ErrorMessage="Email is required." />
                        </div>
                        <div class="bmd-form-group">
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
                        <div class="bmd-form-group">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <i class="fas fa-sticky-note"></i>
                                    </span>
                                </div>
                                <asp:TextBox runat="server" ID="Message" CssClass="form-control" TextMode="MultiLine" placeholder="Message" Rows="10" />

                            </div>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Message"
                                CssClass="text-danger small" ErrorMessage="Message is required."/>
                        </div>
                    </div>

                    <div class="control-group form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" OnClick="ContactSend_Click" Text="Send Message" CssClass="btn btn-default" />
                        </div>
                    </div>
                </div>


                <div class="col-md-6 ml-auto mr-auto card">
                    <div class="card-header card-header-primary">
                        <h2>Contact Details</h2>
                    </div>
                    <div class="mt-2">
                    <p class="h5">40 Ballyronan Rd,<br />Magherafelt BT45 6EN</p>
                    <p class="h5">Phone: +44 7703549800</p>
                    <p class="h5">Email: <a href="mailto:almosthomeadopt@gmail.com">autocarebookings@gmail.com</a></p>
                    <p class="h5">Hours: Monday - Friday: 9:00 AM to 5:00 PM</p>
                    </div>
                    <!-- Embedded Google Map -->
                    <iframe width="100%" height="400px" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2302.7653582143807!2d-6.601448684138646!3d54.748928980296874!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x48605b7d4c6fbc47%3A0xaabfb67d09cd2f58!2s40%20Ballyronan%20Rd%2C%20Magherafelt%20BT45%206EN!5e0!3m2!1sen!2suk!4v1581079083380!5m2!1sen!2suk">
                        <%--src="http://maps.google.com/maps?hl=en&amp;ie=UTF8&amp;ll=37.0625,-95.677068&amp;spn=56.506174,79.013672&amp;t=m&amp;z=4&amp;output=embed">--%>
                    </iframe>
                </div>

            </div>
        </div>
    </div>

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
                        Message submited successfully

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
