%-- 
Document   : Register
Created on : Sep 10, 2023, 11:54:03 PM
Author     : Nhimsmnm
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
                        <div class="col-lg-8">
                            <div class="box">
                                <h1>New account</h1>
                                <p class="lead">You are our customer ? <a href="Login.jsp"> Login</a></p>
                                <p class="text-danger" >${messpassword}<p/>
                                <p class="text-danger" >${messusername}<p/>
                                <p class="text-danger" >${messemail}<p/>
                                <p class="text-success" id="successMessage">${messdone}</p>
                                <p class="text-danger" id="errorMessage">You must complete the entire form have (*)</p>

                                <hr>
                                <form name="register-form" action="RegisterController" method="post">
                                    <div class="form-group">
                                        <label for="name">Username <span style="color: red;">*</span></label>

                                        <input id="username" name="username" type="text" class="form-control required" title="Please input like 'Violet','LonDon123'..."  pattern="^[A-Za-z0-9]{4,32}$" >

                                    </div>
                                    <div class="form-group">
                                        <label for="email">Email <span style="color: red;">*</span></label>
                                        <input id="email" name="email" type="email" class="form-control required" title="Please input like 'violet@abc.com','london123@abc.com'..."  pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" required>

                                    </div>
                                    <div class="form-group">
                                        <label for="password">Password <span style="color: red;">*</span></label>
                                        <input id="password" name="password" type="password" class="form-control required" title="Please input like '123abcde','abcd1234'..." pattern="(?=.*\d)(?=.*[a-z]).{8,50}" required>
                                    </div>                                   
                                    <div class="form-group">
                                        <label for="password">Repassword <span style="color: red;">*</span></label>
                                        <input id="repassword" name="repassword" type="password" class="form-control required" >
                                    </div>

                                    <div class="text-center">
                                        <button type="submit" class="btn btn-primary"><i class="fa fa-user-md required"></i> Register</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!--<div class="col-lg-4">
                            <div class="box">
                                <div id="message" class="form-group">
                                    <h5>Username must contain the following:</h5>
                                    <p id="space" class="passinvalid">No <b>space</b></p>
                                    <p id="tall" class="passinvalid">Minimum <b>4 characters</b><br> Maximum<b>32 characters</b></p>
                                    <h5>Email must contain the following:</h5>
                                    <p id="emailForm" class="passinvalid">abc@abc.abc or abc.abc@abc.abc</p>
                                    <h5>Password must contain the following:</h5>
                                    <p id="letter" class="passinvalid">A <b>lowercase</b> letter</p>
                                    <p id="number" class="passinvalid">A <b>number</b></p>
                                    <p id="length" class="passinvalid">Minimum <b>8 characters</b><br> Maximum<b>50 characters</b></p>
                                </div>
                            </div>
                        </div>-->
                    </div>
                </div>
            </div>
        </div>
        <!--
        * FOOTER *
        _______________________________________________________
        -->
        <jsp:include page="component/footer.jsp"/>
        <!-- * COPYRIGHT END ***-->
        <!-- JavaScript files-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="vendor/jquery.cookie/jquery.cookie.js"></script>
        <script src="vendor/owl.carousel/owl.carousel.min.js"></script>
        <script src="vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.js"></script>
        <script src="js/front.js"></script>
        <script>
            function {
            }
        </script>
        <script>
            // Lấy phần tử có id "errorMessage"
            var errorMessage = document.getElementById("errorMessage");

            // Lấy giá trị của biến messdone
            var messdone = "Giá trị messdone"; // Thay đổi giá trị này theo nhu cầu

            // Kiểm tra nếu messdone có giá trị thì ẩn errorMessage
            if (messdone) {
                errorMessage.style.display = "none";
            }
        </script>
        <script>
            var email = document.getElementById("email");
            var emailForm = document.getElementById("emailForm");

            var username = document.getElementById("username");
            var space = document.getElementById("space");
            var tall = document.getElementById("tall");

            var password = document.getElementById("password");
            var letter = document.getElementById("letter");
            var capital = document.getElementById("capital");
            var number = document.getElementById("number");
            var length = document.getElementById("length");

// When the user clicks on the password field, show the message box
            password.onfocus = function () {
                document.getElementById("message").style.display = "block";
            };

// When the user clicks outside of the password field, hide the message box
            password.onblur = function () {
                document.getElementById("message").style.display = "none";

            };
// When the user clicks on the password field, show the message box
            email.onfocus = function () {
                document.getElementById("message").style.display = "block";
            };

// When the user clicks outside of the password field, hide the message box
            email.onblur = function () {
                document.getElementById("message").style.display = "none";

            };
// When the user clicks on the password field, show the message box
            username.onfocus = function () {
                document.getElementById("message").style.display = "block";
            };

// When the user clicks outside of the password field, hide the message box
            username.onblur = function () {
                document.getElementById("message").style.display = "none";

            };

// Name
            username.onkeyup = function () {
                // Lấy giá trị nhập vào từ trường input
                var inputValue = username.value;

                // Kiểm tra xem giá trị có chứa khoảng trống hay không
                if (/\s/.test(inputValue)) {
                    space.classList.remove("passvalid");
                    space.classList.add("passinvalid");
                } else {
                    space.classList.remove("passinvalid");
                    space.classList.add("passvalid");
                }

                // Validate length
                if (username.value.tall >= 4 && username.value.tall <= 32) {
                    tall.classList.remove("passinvalid");
                    tall.classList.add("passvalid");
                } else {
                    event.preventDefault();
                    tall.classList.remove("passvalid");
                    tall.classList.add("passinvalid");
                }
            };



// Email
            email.onkeyup = function () {
                // Validate letters
                var Form = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                if (email.value.match(Form)) {
                    emailForm.classList.remove("passinvalid");
                    emailForm.classList.add("passvalid");
                } else {
                    revent.preventDefault();
                    emailForm.classList.remove("passvalid");
                    emailForm.classList.add("passinvalid");
                }

            };

// When the user starts to type something inside the password field
            password.onkeyup = function () {
                // Validate lowercase letters
                var lowerCaseLetters = /[a-z]/g;
                if (password.value.match(lowerCaseLetters)) {
                    letter.classList.remove("passinvalid");
                    letter.classList.add("passvalid");
                } else {

                    letter.classList.remove("passvalid");
                    letter.classList.add("passinvalid");
                }

                // Validate numbers
                var numbers = /[0-9]/g;
                if (password.value.match(numbers)) {
                    number.classList.remove("passinvalid");
                    number.classList.add("passvalid");
                } else {
                    number.classList.remove("passvalid");
                    number.classList.add("passinvalid");
                }

                // Validate length
                if (myInput.value.length >= 8 && myInput.value.length <= 50) {
                    lengthpassword.classList.remove("passinvalid");
                    lengthpassword.classList.add("passvalid");
                } else {
                    lengthpassword.classList.remove("passvalid");
                    lengthpassword.classList.add("passinvalid");
                }
            };
        </script>
    </body>
</html>