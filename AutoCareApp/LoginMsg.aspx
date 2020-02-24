<%@ Page Title="Account Required" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoginMsg.aspx.cs" Inherits="AutoCareApp.LoginMsg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div class="container main-content">
        <div class="section text-center">
            <div class="row">
                <div class="col-md-12">
                    <h3 class="title">You are required to login in with an account to continue booking</h3>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <a href="Login">
                        <h3>Login</h3>
                    </a>
                </div>
                <div class="col-md-6">
                    <a href="Register">
                        <h3>Register</h3>
                    </a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
