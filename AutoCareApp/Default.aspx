<%@ Page Title="Cleaning your car at a time" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AutoCareApp._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="section text-center">
            <div class="row">
                <div class="col-md-8 ml-auto mr-auto">
                    <h2 class="title">A Few Words About Us</h2>
                    <h5 class="description">For nearly 20 years, residents throughout the local area have turned to Car Repair for all of their automotive repair needs. With free estimates and fast turnaround, we are known for our personal service and expertise in all forms of specialized engine repair. We use the latest and most modern diagnostic technology to have you back in your car.</h5>
                </div>
            </div>
        </div>
        <div class="section text-center">
            <h2 class="title">Why Choose Us</h2>
            <div class="row mt-5">
                <div class="col-md-3">
                    <span class="text-primary mdi mdi-timetable mdi-md" style="font-size: 40px"></span>
                    <h4><a class="link" href="Services.aspx">Easy Booking</a></h4>
                    <p>First things first, you’ll need to either book an appointment with us or just drop by and see if we have a vacant time slot!</p>
                </div>
                <div class="col-md-3">
                    <span class="text-primary mdi mdi-hand-pointing-right mdi-md" style="font-size: 40px"></span>
                    <h4><a class="link" href="Services.aspx">Perfect Servicing</a></h4>
                    <p>When your car’s already at our place, all you’ll have to do is just wait a little bit till it comes out all shiny and clean!</p>
                </div>
                <div class="col-md-3">
                    <span class="text-primary mdi mdi-car-wash mdi-md" style="font-size: 40px"></span>
                    <h4><a class="link" href="Services.aspx">Additional Services</a></h4>
                    <p>Besides providing the ultimate exterior &amp; interior washing services, we also offer waxing, detailing and vacuuming!</p>
                </div>
                <div class="col-md-3">
                    <span class="text-primary mdi mdi-cash-usd mdi-md" style="font-size: 40px"></span>
                    <h4><a class="link" href="Services.aspx">Awesome Pricing</a></h4>
                    <p>With our services all really being top-notch, here’s also the last joy – the ultimately finest pricing, which can save you a lot of money.</p>
                </div>
            </div>
        </div>
        <div class="section text-center">
            <h2 class="title">Our Packages</h2>
            <div class="row">
                <asp:ListView ID="lstVPackage" runat="server">
                    <LayoutTemplate>
                        <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                    </LayoutTemplate>
                    <ItemTemplate>
                        <div class="col-md-3">
                            <div class="card">
                                <div class="card-header card-header-primary">
                                    <div class="card-icon">
                                        <i class="material-icons">directions_car</i>
                                    </div>
                                    <h4 class="card-title"><%#Eval("PackageName")%></h4>
                                    <h5 class="category">Price: £ <%#Eval("PackagePrice")%></h5>
                                </div>
                                <div class="card-body">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item" style="max-height: 130px; min-height: 130px;"><%#Eval("PackageDetails")%> <a runat="server" href="~/Services">More...</a> </li>
                                        <li class="list-group-item">
                                            <a href="NewBooking.aspx?id=<%#Eval("PackageID")%>" class="btn btn-primary">Book Now</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
        <div class="section text-center">
            <h2 class="title">What Our Clients Say</h2>
            <div class="team">
                <div class="row">
                    <div class="col-md-4">
                        <div class="team-player">
                            <div class="card card-plain">
                                <div class="col-md-6 ml-auto mr-auto">
                                    <img src="Content/images/quote-1-70x70.jpg" alt="Thumbnail Image" class="img-raised rounded-circle img-fluid">
                                </div>
                                <h4 class="card-title">Samantha Johnson
                    <br>
                                    <small class="card-description text-muted">Manager</small>
                                </h4>
                                <div class="card-body blockquote">
                                    <p class="card-description text-left">
                                        For several dollars a day I can drive a clean car 12 months a year, and it’s truly amazing! As a member of the Cleanmotor loyalty program the past 16 months, my car looks as good as it did the day I drove it off the showroom floor.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="team-player">
                            <div class="card card-plain">
                                <div class="col-md-6 ml-auto mr-auto">
                                    <img src="Content/images/quote-2-70x70.jpg" alt="Thumbnail Image" class="img-raised rounded-circle img-fluid">
                                </div>
                                <h4 class="card-title">Richard Smith
                    <br>
                                    <small class="card-description text-muted">Designer</small>
                                </h4>
                                <div class="card-body blockquote">
                                    <p class="card-description text-left">
                                        I always use Cleanmotor Car Wash. I love their affordable prices and loyalty program - it's so convient to be able to get my car washed any time, any day. The people working there are always nice and friendly.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="team-player">
                            <div class="card card-plain">
                                <div class="col-md-6 ml-auto mr-auto">
                                    <img src="Content/images/quote-3-70x70.jpg" alt="Thumbnail Image" class="img-raised rounded-circle img-fluid">
                                </div>
                                <h4 class="card-title">Dennis Richardson
                    <br>
                                    <small class="card-description text-muted">Teacher</small>
                                </h4>
                                <div class="card-body blockquote">
                                    <p class="card-description text-left">
                                        The friendly staff at Cleanmotor provides good service at their wash. They offer a variety of car washing products including car sprays, car wax etc. They also have a comfortable cafe nearby, where they serve free snacks for every client.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
