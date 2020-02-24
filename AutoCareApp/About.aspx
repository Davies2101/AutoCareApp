<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="AutoCareApp.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container main-content">
        <div class="row">
            <div class="col-md-6 ml-auto mr-auto">
                <div class="profile-tabs">
                    <ul class="nav nav-pills nav-pills-icons justify-content-center" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active show" href="#company" role="tab" data-toggle="tab" aria-selected="true">
                                <i class="material-icons">info</i> Company
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#technology" role="tab" data-toggle="tab" aria-selected="false">
                                <i class="material-icons">important_devices</i> Technology
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#system" role="tab" data-toggle="tab" aria-selected="false">
                                <i class="material-icons">settings</i> System
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="tab-content tab-space">
          <div class="tab-pane text-center gallery active show" id="company">
            <div class="row text-left">
              <div class="col-md-6 ml-auto">
                  <p>AutoCare are a Mobile Car Valeting company who struggle with the management of bookings and cancellations with customers. Recently, the business has become increasingly popular and the need for an electronic system or web-based application would be vitally important for managing its customers and bookings. AutoCare are similar to most ‘small companies’ in the aspect that they also use social media platforms as their means of communication and advertisement. With the increase in demand of mobile car valeting, management is struggling to monitor bookings and cancelations made by customers of AutoCare. This indicating that the current business model is no longer viable</p>
              </div>
              <div class="col-md-6 mr-auto">
                  <img class="img-fluid rounded mb-4" src="Content/images/about1.png" alt="">
              </div>
            </div>
          </div>
          <div class="tab-pane text-center gallery" id="technology">
            <div class="row text-left">
              <div class="col-md-6 ml-auto">
                  <img src="Content/images/about2.jpg" class="rounded">
              </div>
              <div class="col-md-6 mr-auto">
                  <ul>
                      <li class="mb-3">we use the latest innovations in the sphere of car washing technologies including high-speed car wash systems.</li>
                      <li class="mb-3">Our specialists combine various methods of car cleaning to keep your car shining.</li>
                      <li class="mb-3">we also have some special solutions for trucks and other types of non-standard vehicles.</li>
                      <li class="mb-3">traditional car wash technologies are applied to older cars, which require a special cleaning approach.</li>
                  </ul>
              </div>
            </div>
          </div>
          <div class="tab-pane text-center gallery" id="system">
            <div class="row text-left">
              <div class="col-md-6 ml-auto">
                  <p>The need for a storage system where booking details and vehicle information can be kept in a centralised and easily accessible location is a must. The increase in custom at AutoCare means that the turnover in cars must be sped up, ensuring however that the standard of service is still kept to a high. AutoCare often find themselves referring to their appointments schedule (paper-based system) to see when the next customer is due in, sometimes there are crossovers in bookings and in worst case scenarios key information is left out such as the service type or car registration. This can result in poor customer service and waste the time of both staff and customers of AutoCare</p>

                  <p>Organisation is key for the success of a business. With a system that can manage all business functions without the need of a receptionist or person at the other end of a computer will save money, meaning resources can be spent elsewhere. Being organised will also improve the efficiency of tasks, improving the overall work rate and standard of jobs as more time can be spent on it. With an electronic system in place, it means that AutoCare do not need to employ someone to monitor the bookings, making the business more streamlined and allowing them to use the extra resources for building up the company. I believe a smart business move for a small and upcoming company like AutoCare would be to invest resources in a responsive web application that can manage all of the above problems that currently occur. Investing in this type of system will help excel the company in many ways. </p>
              </div>
              <div class="col-md-6 mr-auto">
                  <img src="Content/images/about3.jpg" class="rounded">
              </div>
            </div>
          </div>
        </div>
    </div>
</asp:Content>
