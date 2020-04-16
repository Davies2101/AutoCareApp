<%@ Page Title="Cleaning your car at a time" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AutoCareApp._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="assets/css/slick.min.css" rel="stylesheet" />
    <link href="assets/css/slick-theme.min.css" rel="stylesheet" />

    <div class="container">
        <div class="ml-auto mr-auto">
            <div class="card">
                <div class="section text-center card-body">
                    <div class="card-header card-header-primary text-center">
                        <h2>Why Choose Us</h2>
                    </div>

                    <div class="row">
                        <div class="card col-lg-3 col-md-6 bg-gradient-secondary">
                            <div class="card-body">
                                <div class="col-auto">
                                    <div class="icon icon-shape bg-orange text-white rounded-top shadow mb-3">
                                        <i class="fab fa-etsy"></i>
                                    </div>
                                </div>
                                <h4 class="card-title">Easy Booking</h4>
                                <p>First things first, you’ll need to either book an appointment with us or just drop by and see if we have a vacant time slot!</p>
                            </div>
                        </div>
                        <div class="card col-lg-3 col-md-6 bg-gradient-secondary">
                            <div class="card-body">
                                <div class="col-auto">
                                    <div class="icon icon-shape bg-blue text-white rounded-top shadow mb-3">
                                        <i class="far fa-thumbs-up"></i>
                                    </div>
                                </div>
                                <h4 class="card-title">Perfect Servicing</h4>
                                <p>When your car’s already at our place, all you’ll have to do is just wait a little bit till it comes out all shiny and clean!</p>
                            </div>
                        </div>
                        <div class="card col-lg-3 col-md-6 bg-gradient-secondary">
                            <div class="card-body">
                                <div class="col-auto">
                                    <div class="icon icon-shape bg-green text-white rounded-top shadow mb-3">
                                        <i class="fas fa-calendar-plus"></i>
                                    </div>
                                </div>
                                <h4 class="card-title">Additional Services</h4>
                                <p>Besides providing the ultimate exterior &amp; interior washing services, we also offer waxing, detailing and vacuuming!</p>
                            </div>
                        </div>
                        <div class="card col-lg-3 col-md-6 bg-gradient-secondary">
                            <div class="card-body">
                                <div class="col-auto">
                                    <div class="icon icon-shape bg-red text-white rounded-top shadow mb-3">
                                        <i class="fas fa-pound-sign"></i>
                                    </div>
                                </div>
                                <h4 class="card-title">Awesome Pricing</h4>
                                <p>With our services all really being top-notch, here’s also the last joy – the ultimately finest pricing, which can save you a lot of money.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="section text-center card-body">
                    <div class="card-header card-header-primary text-center">
                        <h2>Our Packages</h2>
                    </div>
                    <div class="row">
                        <asp:ListView ID="lstVPackage" runat="server">
                            <LayoutTemplate>
                                <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                            </LayoutTemplate>
                            <ItemTemplate>
                                <div class="col-lg-3 col-md-6" runat="server" id="divCard">
                                    <div class="card-body bg-gradient-secondary">
                                        <h2 class="card-title">
                                            <div class="row">
                                                <div class="col">
                                                    <h1 class="card-title font-weight-bold mb-0"><%#Eval("PackageName")%></h1>
                                                </div>
                                                <div class="col-auto">
                                                    <div class='<%#Eval("PackageName").ToString().ToLower() + " icon icon-shape text-white rounded-circle shadow" %>'>
                                                        <i class="fas fa-car"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </h2>
                                        <div class="card-text text-left" style="min-height: 185px">
                                            <span class="text-sm d-block mb-1"><%#Eval("Content1")%></span>
                                            <span class="text-sm d-block mb-1"><%#Eval("Content2")%></span>
                                            <span class="text-sm d-block mb-1"><%#Eval("Content3")%></span>
                                            <span class="text-sm d-block mb-1"><%# (string)Eval("Content4") == "" ? "" : "" + Eval("Content4") %></span>
                                            <span class="text-sm d-block mb-1"><%# (string)Eval("Content5") == "" ? "" : "" + Eval("Content5") %></span>
                                            <span class="text-sm d-block mb-1"><%# (string)Eval("Content6") == "" ? "" : "" + Eval("Content6") %></span>
                                            <span class="text-sm d-block mb-1"><%# (string)Eval("Content7") == "" ? "" : "" + Eval("Content7") %></span>
                                        </div>
                                        <a class="btn btn-icon btn-default" href="Booking.aspx">
                                            <span class="btn-inner--icon">£<%#Eval("PackagePrice")%></span>
                                            <span class="btn-inner--text">Book Now</span>
                                        </a>
                                    </div>
                                </div>
                            </ItemTemplate>

                        </asp:ListView>
                    </div>
                </div>
                <asp:Panel ID="panelReviews" runat="server">

                    <div class="section text-center card-body">
                        <div class="card-header card-header-primary text-center">
                            <h2>What Our Clients Say</h2>
                        </div>
                        <!-- Testimonial Carousel -->
                        <div class="testimonial-reel">
                            <asp:ListView ID="lstReview" runat="server">
                                <LayoutTemplate>
                                    <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <!-- Testimonial -->
                                    <div>
                                        <div class="box">
                                            <!-- Testimonial Image -->
                                            <figure class="image">
                                                <img class="img-fluid rounded-circle" src='<%# "/Content/profile/" + Eval("Picture")%>'>
                                            </figure>
                                            <!-- / Testimonial Image -->
                                            <div class="test-component">
                                                <!-- Title -->
                                                <article class="test-title">
                                                    <h4><%#Eval("FullName")%></h4>
                                                </article>
                                                <!-- / Title -->
                                                <article class="test-content">
                                                    <p>
                                                        <%#Eval("Review")%>
                                                    </p>
                                                </article>
                                                <div class="star-ratings-css">
                                                    <div class="star-ratings-css-top" style='<%# "width:" + ((int) Eval("Rating")*100)/5 + "%" %>'><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div>
                                                    <div class="star-ratings-css-bottom"><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- / Testimonial -->
                                </ItemTemplate>
                            </asp:ListView>
                        </div>
                        <!-- / Testimonial Carousel -->
                    </div>

                </asp:Panel>
            </div>
        </div>
    </div>
    <script src="/assets/vendor/jquery/dist/jquery.min.js"></script>
    <script src="/assets/js/slick.min.js"></script>
    <%--https://codepen.io/CoderBear/pen/KLNQjg--%>
    <%--https://codepen.io/Bluetidepro/pen/GkpEa--%>
    <script type="text/javascript">
        //Slick Carousel Controllers
        $(".testimonial-reel").slick({
            centerMode: true,
            centerPadding: "40px",
            dots: true,
            slidesToShow: 3,
            infinite: true,
            arrows: true,
            lazyLoad: "ondemand",
            responsive: [
                {
                    breakpoint: 1024,
                    settings: {
                        slidesToShow: 2,
                        centerMode: false
                    }
                },
                {
                    breakpoint: 767,
                    settings: {
                        slidesToShow: 1
                    }
                }
            ]
        });
    </script>
</asp:Content>
