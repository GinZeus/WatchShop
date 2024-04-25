<%-- 
    Document   : Checkout3
    Created on : Sep 10, 2023, 11:36:25 PM
    Author     : datng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Obaju : e-commerce template</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="robots" content="all,follow">
        <!-- Bootstrap CSS-->
        <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
        <!-- Font Awesome CSS-->
        <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
        <!-- Google fonts - Roboto -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700">
        <!-- owl carousel-->
        <link rel="stylesheet" href="vendor/owl.carousel/assets/owl.carousel.css">
        <link rel="stylesheet" href="vendor/owl.carousel/assets/owl.theme.default.css">
        <!-- theme stylesheet-->
        <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
        <!-- Custom stylesheet - for your changes-->
        <link rel="stylesheet" href="css/custom.css">
        <!-- Favicon-->
        <link rel="shortcut icon" href="favicon.png">
        <!-- Tweaks for older IEs--><!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    </head>
    <body>
        <!-- navbar-->
        <jsp:include page="component/header.jsp"/>
        <div id="all">
            <div id="content">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <!-- breadcrumb-->
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li aria-current="page" class="breadcrumb-item active">Checkout - Payment method</li>
                                </ol>
                            </nav>
                        </div>
                        <div id="checkout" class="col-lg-9">
                            <div class="box">
                                <form method="get" action="checkout4.html">
                                    <h1>Checkout - Payment method</h1>
                                    <div class="nav flex-column flex-sm-row nav-pills">
                                        <a href="OrderReviewController" class="nav-link flex-sm-fill text-sm-center "> <i class="fa fa-eye">                     </i>Order Review</a>
                                        <a href="DeliveryController" class="nav-link flex-sm-fill text-sm-center active "> <i class="fa fa-money">                      </i>Payment Method</a>
                                        <a href="#" class="nav-link flex-sm-fill text-sm-center disabled"> <i class="fa fa-map-marker">                  </i>Address</a>
                                    </div>
                                    <div class="content py-3">
                                        <div class="row">

                                            <div class="col-md-6">
                                                <div class="box payment-method">
                                                    <h4>Cash on delivery</h4>
                                                    <p>You pay when you get it.</p>
                                                    <div class="box-footer text-center">
                                                        <input type="radio" name="payment" value="payment3" checked>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /.row-->
                                    </div>
                                    <!-- /.content-->
                                    <div class="box-footer d-flex justify-content-between"><a href="OrderReviewController" class="btn btn-outline-secondary"><i class="fa fa-chevron-left"></i>Back to Order Review</a>
                                        <a href="BillAddressController" class="btn btn-primary">Continue to Address<i class="fa fa-chevron-right"></i></a>
                                    </div>
                                </form>
                                <!-- /.box-->
                            </div>
                        </div>
                        <!-- /.col-lg-9-->
                        <div class="col-lg-3">
                            <div id="order-summary" class="box">
                                <div class="box-header">
                                    <h3 class="mb-0">Order summary</h3>
                                </div>
                                <p class="text-muted">Shipping and additional costs are calculated based on the values you have entered.</p>
                                <div class="table-responsive">
                                    <table class="table">
                                        <tbody>
                                            <tr>
                                                <td>Order subtotal</td>
                                                <th><p style="margin: 0px">
                                                        <fmt:setLocale value = "en_US"/>
                                                        <fmt:formatNumber value = "${cart.getTotalMoney()}" type = "currency"/></p></th>
                                            </tr>
                                            <tr>
                                                <td>Shipping and handling</td>
                                                <th>$10.00</th>
                                            </tr>
                                            
                                            <tr class="total">
                                                <td>Total</td>
                                                <th><p style="margin: 0px">
                                                        <fmt:setLocale value = "en_US"/>
                                                        <fmt:formatNumber value = "${cart.getTotalMoney()+10}" type = "currency"/></p></th>
                                                </p></th>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!--                        
                                                    </div>
                            <!-- /.col-lg-3-->
                        </div>
                        <!-- /.col-lg-3-->
                    </div>
                </div>
            </div>
        </div>
        <!--
        *** FOOTER ***
        _________________________________________________________
        -->

        <!-- /#footer-->
        <!-- *** FOOTER END ***-->

        <jsp:include page="component/footer.jsp"/>


        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="vendor/jquery.cookie/jquery.cookie.js"></script>
        <script src="vendor/owl.carousel/owl.carousel.min.js"></script>
        <script src="vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.js"></script>
        <script src="js/front.js"></script>
    </body>
</html>
