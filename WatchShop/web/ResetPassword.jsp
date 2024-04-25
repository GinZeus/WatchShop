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
        <style>
            .required::after{
            content: "(*)";
            color:red;
            font-size: 15px;
        }
        </style>
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
                                    <li class="breadcrumb-item"><a href="HomeController">Home</a></li>
                                    <li class="breadcrumb-item"><a href="Login.jsp">Sign in</a></li>
                                    <li aria-current="page" class="breadcrumb-item active">Forget password</li>
                                </ol>
                            </nav>
                        </div>
                        <div class="col-lg-3"></div>    
                        <div class="col-lg-6">
                            <div class="box">
                                <h1>Reset password</h1>

                                <hr>
                                <form action="ResetPasswordController" method="post" onsubmit=" validatePassword()">
                                    <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                          <input hidden name="email" type="text" value="${requestScope.email}">
                        <label for="password_1">New password</label>
                        <input required name="password_1" id="password_1" type="password" class="form-control" pattern="(?=.*\d)(?=.*[a-z]).{8,50}" title="Must contain  8 to 50 characters">
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="password_2">Retype new password</label>
                        <input required name="password_2" id="password_2" type="password" class="form-control" pattern="(?=.*\d)(?=.*[a-z]).{8,50}" title="Must contain  8 to 50 characters">
                      </div>
                    </div>
                  </div>
                                    <div class="text-center">
                                        <p id="message1" style="color:red;"></p>
                                        <p style="color:green;">${requestScope.mess}</p>
                                        <button ${requestScope.toLogin==true?hidden:""} type="submit" class="btn btn-primary"><i class="fa fa-sign-in"></i> Reset password</button>
                                        <a ${requestScope.toLogin==true?"":hidden} href="Login.jsp" class="btn btn-primary"><i class="fa fa-sign-in"></i> Go to Login</a>
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
        <script>
            function validatePassword(){
                var pass1 = document.querySelector("#password_1").value;
                var pass2 = document.querySelector("#password_2").value;
                
                    if(pass1 !== pass2){
                        event.preventDefault();
                        document.querySelector("#message1").innerHTML = "Please retype the same new password";
                        document.querySelector("#password_2").value = "";
                    }else{
                        if(!confirm("Do you want to change your password ?")){
                            event.preventDefault();
                        }
                    }
            }
        </script>
    </body>
</html>
