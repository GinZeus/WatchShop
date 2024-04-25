<%-- 
    Document   : Register
    Created on : Sep 10, 2023, 11:54:03 PM
    Author     : datng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                                    <li aria-current="page" class="breadcrumb-item active">New account / Sign in</li>
                                </ol>
                            </nav>
                        </div>
                        <div class="col-lg-3"></div>    
                        <div class="col-lg-6">
                            <div class="box">
                                <h1>Login</h1>
                                <p > New account?  <a href="Register.jsp">Register</a></p> 
                                <p > Forget your password?  <a href="ForgetPassword.jsp">Reset password</a></p> 

                                <p class="lead  text-danger font-weight-bold" > ${mess1} </p>
                                <p class="lead text-danger font-weight-bold" > ${needLogin} </p>

                                <p class="lead text-danger font-weight-bold" >${mess2} </p>

                                <hr>
                                <form action="<c:url value='/LoginController'/>" method="post">
                                    <div class="form-group">
                                        <label for="username">Username</label>
                                        <input id="username" name="username" type="text" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="password">Password</label>
                                        <input id="password" name="password" type="password" class="form-control" required>
                                    </div>
                                    <div class="text-center">
                                        <button type="submit" class="btn btn-primary"><i class="fa fa-sign-in"></i> Log in</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-lg-3"></div>  
                    </div>
                </div>
            </div>
        </div>
        <!--
        *** FOOTER ***
        _________________________________________________________
        -->

        <jsp:include page="component/footer.jsp"/>
        <!-- *** COPYRIGHT END ***-->
        <!-- JavaScript files-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="vendor/jquery.cookie/jquery.cookie.js"></script>
        <script src="vendor/owl.carousel/owl.carousel.min.js"></script>
        <script src="vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.js"></script>
        <script src="js/front.js"></script>
    </body>
</html>
