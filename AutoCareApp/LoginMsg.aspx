<%@ Page Title="Account Required" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoginMsg.aspx.cs" Inherits="AutoCareApp.LoginMsg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="section">
            <div class="row">
                <div class="col-md-12 ml-auto mr-auto">
                    <div class="card">
                        <div class="card-header card-header-primary text-center">
                            <h2>You are required to login in with an account to continue booking</h2>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="card col-md-6">
                                    <div class="card-body ml-auto mr-auto">
                                        <p><i class="far fa-user-circle fa-5x"></i></p>
                                        <a href="Login.aspx" class="btn btn-default">Login</a>
                                    </div>
                                </div>
                                
                                <div class="card col-md-6">
                                    <div class="card-body ml-auto mr-auto">
                                        <p><i class="far fa-registered fa-5x"></i></p>
                                        <a href="Register.aspx" class="btn btn-default">Register</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
