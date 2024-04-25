<%-- 
    Document   : Customer_Account
    Created on : Sep 10, 2023, 11:45:03 PM
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
            content: "*";
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
                  <li class="breadcrumb-item"><a href="#">Home</a></li>
                  <li aria-current="page" class="breadcrumb-item active">My account</li>
                </ol>
              </nav>
            </div>
            <div class="col-lg-3">
              <!--
              *** CUSTOMER MENU ***
              _________________________________________________________
              -->
              <div class="card sidebar-menu">
                <div class="card-header">
                  <h3 class="h4 card-title">Customer section</h3>
                </div>
                <div class="card-body">
                    <ul class="nav nav-pills flex-column">
                        <a href="profileControl" class="nav-link" style="width: 100%;"><i class="fa fa-user"></i>My Profile</a>
                        <a href="passwordControl" class="nav-link active" style="width: 100%;"><i class="fa fa-lock"></i>Change Password</a>
                        <a href="ToConfirmController" class="nav-link" style="width: 100%;"><i class="fa fa-shopping-basket"></i>My Order</a>
                        <a href="OrderHistoryController" class="nav-link" style="width: 100%;"><i class="fa fa-history"></i>Order History</a>
                        <a href="LogoutController" class="nav-link" style="width: 100%;"><i class="fa fa-arrow-left"></i>Logout</a>
                    </ul>
                </div>
              </div>
              <!-- /.col-lg-3-->
              <!-- *** CUSTOMER MENU END ***-->
            </div>
            <div class="col-lg-9">
              <div class="box">
                <h1>Change password</h1>
                <p class="lead">Change your password here</p>
                <div class="row">
                          <div class="col-md-4">
                          <p style="color:red">* : Please input in these field </p>
                      </div>
                      <div class="col-md-8">
                      </div>
                </div>
                <form name="passwordChange" action="passwordControl" method="post" onsubmit="validatePassword()" >
                    <input name="acc_id" type="text" value="${requestScope.acc.acc_id}" hidden>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group showPassword">
                        <label class="required" for="password_old">Old password</label>
                        <div class="row">
                            <div class="col-md-11" style="padding-right:0;"><input value="" name="password_old" id="password_old" type="password" class="form-control"> </div>
                            <div class="col-md-1" style="padding:0;"><span onclick="passwordToggle()" class=" field-icon toggle-password fa-2x"></span></div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="required" for="password_1">New password</label>
                        <input required name="password_1" id="password_1" type="password" class="form-control" pattern="(?=.*\d)(?=.*[a-z]).{8,50}" title="Must contain  8 to 50 characters">
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="required" for="password_2">Retype new password</label>
                        <input required name="password_2" id="password_2" type="password" class="form-control" pattern="(?=.*\d)(?=.*[a-z]).{8,50}" title="Must contain  8 to 50 characters">
                      </div>
                    </div>
                  </div>
                  <!-- /.row-->
                    <div class="col-md-12 text-center">
                      <p style="color: red; font-weight: bold; display: block; padding: 0; background-color: #fff;" id="message1">${requestScope.message1}</p>
                      <p style="color: green; font-weight: bold; display: block; padding: 0; background-color: #fff;" id="message2">${requestScope.message2}</p>
                      <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Save new password</button>
                  </div>  
                </form> 
              </div>
                    <div style="display: none;" id="message2">
                          <h3>Password must contain the following:</h3>
                          <p id="letter" class="passinvalid">A <b>lowercase</b> letter</p>
                          <p id="number" class="passinvalid">A <b>number</b></p>
                          <p id="length" class="passinvalid">Minimum <b>8 characters</b></p>
                    </div> 
            </div>
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
    <script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="vendor/owl.carousel/owl.carousel.min.js"></script>
    <script src="vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.js"></script>
    <script src="js/front.js"></script>
    
    <script>
        //  hide, show password
            function passwordToggle() {
            var x = document.getElementById("password_old");
                if (x.type === "password") {
                     x.type = "text";
                    } else {
                    x.type = "password";
                    }
                    
                }
                
            function validatePassword(){
                var oldPass = document.querySelector("#password_old").value;
                var pass1 = document.querySelector("#password_1").value;
                var pass2 = document.querySelector("#password_2").value;
                
                if(oldPass === pass1){
                    event.preventDefault();
                    document.querySelector("#message1").innerHTML = "New password cannot be the same as old password";
                    document.querySelector("#password_1").value = "";
                    document.querySelector("#password_2").value = "";
                }else{
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
            }
            
            const form = document.querySelector('form');
            form.addEventListener('submit',() =>{
                event.preventDefault();
                document.querySelector("#message").innerHTML = "Change password successfully!";
                setTimeout(() => form.submit(), 5000);
            });
            
            var myInput = document.getElementById("password_1");
            var letter = document.getElementById("letter");
            var capital = document.getElementById("capital");
            var number = document.getElementById("number");
            var length = document.getElementById("length");

// When the user clicks on the password field, show the message box
            myInput.onfocus = function () {
                document.getElementById("message2").style.display = "block";
            };

// When the user clicks outside of the password field, hide the message box
            myInput.onblur = function () {
                document.getElementById("message2").style.display = "none";
            };

// When the user starts to type something inside the password field
            myInput.onkeyup = function () {
                // Validate lowercase letters
                var lowerCaseLetters = /[a-z]/g;
                if (myInput.value.match(lowerCaseLetters)) {
                    letter.classList.remove("passinvalid");
                    letter.classList.add("passvalid");
                } else {
                    letter.classList.remove("passvalid");
                    letter.classList.add("passinvalid");
                }

                // Validate numbers
                var numbers = /[0-9]/g;
                if (myInput.value.match(numbers)) {
                    number.classList.remove("passinvalid");
                    number.classList.add("passvalid");
                } else {
                    number.classList.remove("passvalid");
                    number.classList.add("passinvalid");
                }

                // Validate length
                if (myInput.value.length >= 8) {
                    length.classList.remove("passinvalid");
                    length.classList.add("passvalid");
                } else {
                    length.classList.remove("passvalid");
                    length.classList.add("passinvalid");
                }
            };

    </script>
  </body>
</html>
