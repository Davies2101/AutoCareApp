<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MessageBox.aspx.cs" Inherits="AutoCareApp.MessageBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/SideMenu.css" rel="stylesheet" />
    <div id="wrapper">
        <div id="sidebar-wrapper" class="bg-default">
            <br />
            <ul class="sidebar-nav">
                <div style="text-align: center; background-image: url(Images/bg.jpg); height: 170px;">
                    <br />
                    <asp:Image runat="server" ImageUrl="~/Images/hitesh.png" ID="profileimg" />
                </div>
                <li class="sidebar-brand">
                    <asp:Label ID="lblFullName" runat="server" Text="Label"></asp:Label>

                </li>
                <br />
                <li><a href="Music.aspx"><i class="far fa-user-circle"></i>&nbsp;&nbsp;My Profile</a>
                </li>
                <li><a href="#"><i class="fab fa-bootstrap"></i>&nbsp;&nbsp;My Bookings</a>
                </li>
                <li><a href="#"><i class="far fa-envelope"></i>&nbsp;&nbsp;Notifications</a>
                </li>
            </ul>
        </div>
        <a href="#menu-toggle" id="menu-toggle" class="ml-2"><i class="fas fa-bars"></i></a>
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                  
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Menu Toggle Script -->
   <%-- https://codepen.io/flizoid/pen/EnHed--%>
    <script src="assets/vendor/jquery/dist/jquery.min.js"></script>
    <script>
        $("#menu-toggle").click(function (e) {
            e.preventDefault();
            $("#wrapper").toggleClass("toggled");
        });
    </script>
</asp:Content>
