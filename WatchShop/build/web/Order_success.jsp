<%-- 
    Document   : Checkout4
    Created on : Sep 10, 2023, 11:36:47 PM
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
                                    <li aria-current="page" class="breadcrumb-item active">Order completed</li>
                                </ol>
                            </nav>
                        </div>
                        <div id="checkout" class="col-lg">
                            <div class="box">
                                <h1>Order complete</h1>
                                <div class="col-md-12 text-center ">
                                    <p  style="font-size: 12rem"><i class=" fa fa-check-circle text-primary " ></i></p>
                                    <h1 style="font-size: 4rem">Order successful!</h1>
                                    <h2>Order # ${order.order_id} was placed on ${order.order_date}. Track your order in the "My Orders"! </h2>
                                    <p>
                                        <a href="HomeController"class="btn btn-primary mt-lg-3"><i class="fa fa-home"></i>Home</a>
                                        <a href="ToConfirmController"class="btn btn-primary btn-outline mt-lg-3"><i class="fa fa-shopping-basket"></i>My order</a>
                                    </p>
                                </div>
                            </div>
                            <!-- /.box-->
                        </div>
                        <!-- /.col-lg-9-->

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
            
        
            <script src="vendo r/jquery/jquery.min.js"></script>
            <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
            <script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
            <script src="vendor/owl.carousel/owl.carousel.min.js"></script>
            <script src="vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.js"></script>
            <script src="js/front.js"></script>
          </body>
        </html>
