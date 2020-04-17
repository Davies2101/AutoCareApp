<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="AutoCareApp.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="section text-center">
            <div class="row">
                <div class="col-md-12 ml-auto mr-auto">
                    <div class="row">
                        <div class="col-xl-3 col-md-6">
                            <div class="card card-stats">
                                <!-- Card body -->
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col">
                                            <h5 class="card-title text-uppercase text-muted mb-0">Customers</h5>
                                            <span class="h2 font-weight-bold mb-0" id="totalCustomers">333</span>
                                        </div>
                                        <div class="col-auto">
                                            <div class="icon icon-shape bg-gradient-red text-white rounded-circle shadow">
                                                <i class="fas fa-users"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6">
                            <div class="card card-stats">
                                <!-- Card body -->
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col pr-0">
                                            <h5 class="card-title text-uppercase text-muted mb-0">Current Bookings</h5>
                                            <span class="h2 font-weight-bold mb-0" id="currentBookings">333</span>
                                        </div>
                                        <div class="col-auto">
                                            <div class="icon icon-shape bg-gradient-orange text-white rounded-circle shadow">
                                                <i class="fas fa-business-time"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6">
                            <div class="card card-stats">
                                <!-- Card body -->
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col">
                                            <h5 class="card-title text-uppercase text-muted mb-0">Total Bookings</h5>
                                            <span class="h2 font-weight-bold mb-0" id="totalCompleted">333</span>
                                        </div>
                                        <div class="col-auto">
                                            <div class="icon icon-shape bg-gradient-info text-white rounded-circle shadow">
                                                <i class="ni ni-chart-bar-32"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6">
                            <div class="card card-stats">
                                <!-- Card body -->
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col">
                                            <h5 class="card-title text-uppercase text-muted mb-0">Total Sales</h5>
                                            <span class="h2 font-weight-bold mb-0" id="totalSales">333</span>
                                        </div>
                                        <div class="col-auto">
                                            <div class="icon icon-shape bg-gradient-green text-white rounded-circle shadow">
                                                <i class="ni ni-money-coins"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-xl-8">
                            <div class="card bg-default">
                                <div class="card-header bg-transparent">
                                    <div class="row align-items-center">
                                        <div class="col">
                                            <h6 class="text-light text-uppercase ls-1 mb-1">Weekly Sales</h6>
                                            <h5 class="h3 text-white mb-0">Sales value</h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <!-- Chart -->
                                    <div class="chart">
                                        <div class="chartjs-size-monitor">
                                            <div class="chartjs-size-monitor-expand">
                                                <div class=""></div>
                                            </div>
                                            <div class="chartjs-size-monitor-shrink">
                                                <div class=""></div>
                                            </div>
                                        </div>
                                        <!-- Chart wrapper -->
                                        <canvas id="weekly-chart-sales" class="chart-canvas chartjs-render-monitor" width="635" height="350" style="display: block; width: 635px; height: 350px;"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4">
                            <div class="card">
                                <div class="card-header bg-transparent">
                                    <div class="row align-items-center">
                                        <div class="col">
                                            <h6 class="text-uppercase text-muted ls-1 mb-1">Mostly Picked Packages</h6>
                                            <h5 class="h3 mb-0">Total orders</h5>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <!-- Chart -->
                                    <div class="chart">
                                        <div class="chartjs-size-monitor">
                                            <div class="chartjs-size-monitor-expand">
                                                <div class=""></div>
                                            </div>
                                            <div class="chartjs-size-monitor-shrink">
                                                <div class=""></div>
                                            </div>
                                        </div>
                                        <canvas id="package-chart-bars" class="chart-canvas chartjs-render-monitor" style="display: block; width: 278px; height: 350px;" width="278" height="350"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="/assets/vendor/jquery/dist/jquery.min.js"></script>
    <script src="assets/vendor/chart.js/dist/Chart.min.js"></script>
    <script src="/assets/vendor/chart.js/dist/Chart.extension.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            initPackageChart();
            initSalesChart();
        });

        var packageData;
        function initPackageChart() {
            var $chart = $('#package-chart-bars');
            // Create chart
            var packageChart = new Chart($chart, {
                type: 'bar',
                data: {
                    labels: ['Bronze', 'Silver', 'Gold', 'Platinum'],
                    datasets: [{
                        label: 'Bookings ',
                        data: packageData
                    }]
                }
            });

            // Save to jQuery object
            $chart.data('chart', packageChart);
        }

        var salesData;
        function initSalesChart() {
           
            var $chart = $('#weekly-chart-sales');

            var salesChart = new Chart($chart, {
                type: 'line',
                options: {
                    scales: {
                        yAxes: [{
                            gridLines: {
                                lineWidth: 1,
                                color: Charts.colors.gray[900],
                                zeroLineColor: Charts.colors.gray[900]
                            },
                            ticks: {
                                callback: function (value) {
                                    if (!(value % 10)) {
                                        return '£' + value + 'k';
                                    }
                                }
                            }
                        }]
                    },
                    tooltips: {
                        callbacks: {
                            label: function (item, data) {
                                var label = data.datasets[item.datasetIndex].label || '';
                                var yLabel = item.yLabel;
                                var content = '';

                                if (data.datasets.length > 1) {
                                    content += label;
                                }

                                content += yLabel;
                                return '£ ' + content;
                            }
                        }
                    }
                },
                data: {
                    labels: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday','Sunday'],
                    datasets: [{
                        label: 'Sales',
                        data: salesData
                    }]
                }
            });

            // Save to jQuery object

            $chart.data('chart', salesChart);

        };

        function setTotalCustomers(value) {
            $('#totalCustomers').text(value);
        }
        function setCurrentBookings(value) {
            $('#currentBookings').text(value);
        }
        function setTotalCompleted(value) {
            $('#totalCompleted').text(value);
        }
        function setTotalSales(value) {
            $('#totalSales').text(currencyFormat(Number(value)));
        }
        function setMostlyPickedPackages(data) {
            packageData = JSON.parse(data);
        }
        function setWeeklySales(data) {
            salesData = JSON.parse(data);
        }
        
        //https://blog.abelotech.com/posts/number-currency-formatting-javascript/
        function currencyFormat(num) {
            return '£' + num.toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,')
        }
    </script>
</asp:Content>
