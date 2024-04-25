<%-- 
    Document   : Sale_Dashbroad
    Created on : Oct 29, 2023, 8:25:15 PM
    Author     : datng
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Director | Dashboard</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <meta name="description" content="Developed By M Abdur Rokib Promy">
        <meta name="keywords" content="Admin, Bootstrap 3, Template, Theme, Responsive">
        <!-- bootstrap 3.0.2 -->
        <link href="css_dashbroad/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="css_dashbroad/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="css_dashbroad/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- Morris chart -->
        <link href="css_dashbroad/morris/morris.css" rel="stylesheet" type="text/css" />
        <!-- jvectormap -->
        <link href="css_dashbroad/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
        <!-- Date Picker -->
        <link href="css_dashbroad/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />
        <!-- fullCalendar -->
        <!-- <link href="css/fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css" /> -->
        <!-- Daterange picker -->
        <link href="css_dashbroad/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
        <!-- iCheck for checkboxes and radio inputs -->
        <link href="css_dashbroad/iCheck/all.css" rel="stylesheet" type="text/css" />
        <!-- bootstrap wysihtml5 - text editor -->
        <!-- <link href="css/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" /> -->
        <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <!-- Theme style -->
        <link href="css_dashbroad/style.css" rel="stylesheet" type="text/css" />



        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
          <![endif]-->

        <style type="text/css">

        </style>
    </head>
    <body class="skin-black">
        <!-- header logo: style can be found in header.less -->
        <jsp:include page="component/header_dashbroad.jsp"></jsp:include>
            <div class="wrapper row-offcanvas row-offcanvas-left">
                <!-- Left side column. contains the logo and sidebar -->
            <jsp:include page="component/sidebar_dashbroad.jsp"></jsp:include>

                <aside class="right-side">

                    <!-- Main content -->
                    <section>

                        <div class="row" style="margin-bottom:5px;">
                        <c:if test="${(sessionScope.account.role_id == 2)}">
                            <div class="col-md-4">
                                <div class="sm-st clearfix">
                                    <span class="sm-st-icon st-blue"><i class="fa fa-dollar"></i></span>
                                    <div class="sm-st-info">
                                        <span>${balance}</span>Total Revenue
                                    </div>
                                </div>
                            </div>
                        </c:if>
                        <div class="col-md-4">
                            <div class="sm-st clearfix">
                                <span class="sm-st-icon st-green"><i class="fa fa-check-square-o"></i></span>
                                <div class="sm-st-info">
                                    <span>${totalOrderSuccess}</span>
                                    Total Order Success
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="sm-st clearfix">
                                <span class="sm-st-icon st-violet"><i class="fa fa-comment"></i></span>
                                <div class="sm-st-info">
                                    <span>${totalFb}</span>
                                    Total Feedback
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="sm-st clearfix">
                                <span class="sm-st-icon st-yellow"><i class="fa fa-archive"></i></span>
                                <div class="sm-st-info">
                                    <span>${totalPro}</span>
                                    Total Product
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="sm-st clearfix">
                                <span class="sm-st-icon st-red"><i class="fa fa-bars"></i></span>
                                <div class="sm-st-info">
                                    <span>${totalCate}</span>
                                    Total Category
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="sm-st clearfix">
                                <span class="sm-st-icon st-orange"><i class="fa fa-tags"></i></span>
                                <div class="sm-st-info">
                                    <span>${totalBrand}</span>
                                    Total Brand
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Main row -->
                    <c:if test="${(sessionScope.account.role_id == 2)}">
                        <div class="row">
                            <div class="col-md-1"></div>
                            <div class="col-md-10">
                                <!--earning graph start-->
                                <section class="panel">
                                    <header class="panel-heading">
                                        Last 7 Days Revenue Chart
                                    </header>
                                    <div class="panel-body">
                                        <canvas id="linechart" width="600" height="330"></canvas>
                                    </div>
                                </section>
                                <!--earning graph end-->

                            </div>
                            <div class="col-md-1"></div>
                        </div>
                    </c:if>

                    <div class="row">

                        <div class="col-md-6">
                            <section class="panel">
                                <header class="panel-heading">
                                    Top 5 Best Selling Products
                                </header>
                                <div class="panel-body table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Image</th>
                                                <th>Name</th>
                                                <th>Sale Price</th>
                                                <th>Quantity</th>
                                                <th>Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${Top5BestSelling}" var="o">
                                                <tr>
                                                    <td>${o.p_id}</td>
                                                    <td><img style="width: 6rem" src="${o.thumbnail}" alt="alt"/></td>
                                                    <td>${o.product_name}</td>
                                                    <td>${o.sale_price}$</td>
                                                    <td>${o.quantity}</td>
                                                    <c:if test="${o.status==1}">
                                                        <td><span class="label label-success">Available</span></td>
                                                    </c:if>
                                                    <c:if test="${o.status==2}">
                                                        <td><span class="label label-warning">Out of Stock</span></td>
                                                    </c:if>
                                                </tr>
                                            </c:forEach>


                                        </tbody>
                                    </table>
                                </div>
                            </section>
                        </div><!--end col-6 -->
                        <div class="col-md-6">
                            <section class="panel">
                                <header class="panel-heading">
                                    Top 5 Best Rating Products
                                </header>
                                <div class="panel-body table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Image</th>
                                                <th>Name</th>
                                                <th>Sale Price</th>
                                                <th>Quantity</th>
                                                <th>Rate</th>
                                                <th>Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${Top5Rating}" var="r">
                                                <tr>
                                                    <td>${r.p_id}</td>
                                                    <td><img style="width: 6rem" src="${r.thumbnail}" alt="alt"/></td>
                                                    <td>${r.product_name}</td>
                                                    <td>${r.sale_price}$</td>
                                                    <td>${r.quantity}</td>
                                                    <td>${r.rate}/5</td>
                                                    <c:if test="${r.status==1}">
                                                        <td><span class="label label-success">Available</span></td>
                                                    </c:if>
                                                    <c:if test="${r.status==2}">
                                                        <td><span class="label label-warning">Out of Stock</span></td>
                                                    </c:if>
                                                </tr>
                                            </c:forEach>


                                        </tbody>
                                    </table>
                                </div>
                            </section>
                        </div>

                    </div>

                    <!-- row end -->
                </section><!-- /.content -->
                <div class="footer-main">
                    Copyright &copy Director, 2014
                </div>
            </aside><!-- /.right-side -->

        </div><!-- ./wrapper -->


        <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script src="js_dashbroad/jquery.min.js" type="text/javascript"></script>

        <!-- jQuery UI 1.10.3 -->
        <script src="js_dashbroad/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
        <!-- Bootstrap -->
        <script src="js_dashbroad/bootstrap.min.js" type="text/javascript"></script>
        <!-- daterangepicker -->
        <script src="js_dashbroad/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>

        <script src="js_dashbroad/plugins/chart.js" type="text/javascript"></script>

        <!-- datepicker
        <script src="js/plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>-->
        <!-- Bootstrap WYSIHTML5
        <script src="js/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" type="text/javascript"></script>-->
        <!-- iCheck -->
        <script src="js_dashbroad/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
        <!-- calendar -->
        <script src="js_dashbroad/plugins/fullcalendar/fullcalendar.js" type="text/javascript"></script>

        <!-- Director App -->
        <script src="js_dashbroad/Director/app.js" type="text/javascript"></script>

        <!-- Director dashboard demo (This is only for demo purposes) -->
        <script src="js/Director/dashboard.js" type="text/javascript"></script>

        <!-- Director for demo purposes -->
        <script type="text/javascript">
            $(function () {
                "use strict";
                //BAR CHART
                var data = {
                    labels: [<c:forEach items="${dateList}" var="d">"${d}",</c:forEach>],
                            datasets: [
                                {
                                    label: "My First dataset",
                                    fillColor: "rgba(151,187,205,0.2)",
                                    strokeColor: "rgba(151,187,205,1)",
                                    pointColor: "rgba(151,187,205,1)",
                                    pointStrokeColor: "#fff",
                                    pointHighlightFill: "#fff",
                                    pointHighlightStroke: "rgba(220,220,220,1)",
                                    data: [<c:forEach items="${revenue7Day}" var="o">${o},</c:forEach>]
                                },
                            ]
                };
                new Chart(document.getElementById("linechart").getContext("2d")).Line(data, {
                    responsive: true,
                    maintainAspectRatio: false,
                });

            });
            // Chart.defaults.global.responsive = true;
        </script>
        <script>
            // change active in sidebar
            let pageStatus = document.querySelector('#SaleDashboard');
            pageStatus.className = "active";
        </script>
    </body>
</html>
