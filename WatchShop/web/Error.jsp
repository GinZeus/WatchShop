<%-- 
    Document   : 404
    Created on : Sep 10, 2023, 11:31:43 PM
    Author     : datng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                                    <li aria-current="page" class="breadcrumb-item active">Error</li>
                                </ol>
                            </nav>
                            <div id="error-page" class="row">
                                <div class="col-md-6 mx-auto">
                                    <div class="box text-center py-5">
                                        <span ><i class="fa fa-exclamation-circle text-danger display-1"></i></span>
                                        <h1 class="text-danger  ">ERROR</h1>
                                        <c:if test="${sessionScope.account.getRole_id() ==1}">
                                            <p class="buttons"><a href="AdminDashboardController" class="btn btn-primary"><i class="fa fa-home"></i> Go to Admin Dashboard</a></p>
                                        </c:if>
                                            <c:if test="${sessionScope.account.getRole_id() ==2}">
                                            <p class="buttons"><a href="SaleDashboardController" class="btn btn-primary"><i class="fa fa-home"></i> Go to Sale Dashboard</a></p>
                                        </c:if>
                                            <c:if test="${sessionScope.account.getRole_id() ==3}">
                                            <p class="buttons"><a href="SaleDashboardController" class="btn btn-primary"><i class="fa fa-home"></i> Go to Sale Dashboard</a></p>
                                        </c:if>
                                            <c:if test="${sessionScope.account.getRole_id() ==4}">
                                            <p class="buttons"><a href="HomeController" class="btn btn-primary"><i class="fa fa-home"></i> Go to Homepage</a></p>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="component/footer.jsp"/>



        <!-- JavaScript files-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="vendor/jquery.cookie/jquery.cookie.js"></script>
        <script src="vendor/owl.carousel/owl.carousel.min.js"></script>
        <script src="vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.js"></script>
        <script src="js/front.js"></script>
    </body>
</html>