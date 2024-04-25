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
        .specificMessage{
            margin: 0px 0px 0px 25px;
        }
        .required::after{
            content: "*";
            color:red;
            font-size: 15px;
        }
        .profilePicture{
                width: 250px;
                height: 200px;
                margin: 50px 0 50px 0;
                border:3px solid black;
                border-radius: 50%;
                padding: 2px;
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
                      <a href="profileControl" class="nav-link active" style="width: 100%;"><i class="fa fa-user"></i>My Profile</a>
                      <a href="passwordControl" class="nav-link" style="width: 100%;"><i class="fa fa-lock"></i>Change Password</a>
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
                  
                  <h3 class="mt-5 text-center">Personal details</h3>
                  <p class="lead">Change your personal details here</p>
                  <div class="row">
                      <div class="col-md-4">
                          <h4>Profile picture</h4>
                      </div>
                      <div class="col-md-8">
                          <img class="rounded-circle profilePicture"  src="${requestScope.user.avatar}" alt="profilePicture">
                      </div>
                  </div>
                      <br>
                      
                     <div class="row">
                    <h4 style="color:red">${needProfile}</h4>
                    </div>
                      <div class="row">
                          <div class="col-md-4">
                          <p style="color:red">* : Please input in these field </p>
                      </div>
                      <div class="col-md-8">
                      </div>
                      </div>
                  
                    <form  id="userProfile" name="userProfile" action="profileControl" method="post" onsubmit="validateUserProfile()" enctype="multipart/form-data">
<!--                        row-->
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="username">Username</label>
                                    <input readonly required name="username" id="username" value="${requestScope.acc.username}" placeholder="Enter your name" type="text" class="form-control">
                                </div>
                            </div>
                        </div>
                       <!--row-->
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="gmail">Email</label> <span class="specificMessage" id="emailMessage"></span>
                                    <input readonly required name="gmail" id="Gmail" value="${requestScope.acc.email}" placeholder="Enter your name" type="text" class="form-control">
                                </div>
                            </div>
                        </div>
          <!--                   second row-->          
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                          <label class="required" for="fullName">Fullname</label> <span class="specificMessage" id="fullNameMessage"></span>
                        <input required name="fullName" id="fullName" value="${requestScope.user.fullName}" placeholder="Enter your name" type="text" class="form-control">
                      </div>
                    </div>
                  </div>
<!--                     third row -->
                    <div class="row">
                       <div class="col-md-12">
                      <div class="form-group">
                        <label class="required" for="address">Address</label> <span class="specificMessage" id="addressMessage"></span>
                        <input required name="address" id="address" value="${requestScope.user.address}" placeholder="Enter your address" type="text" class="form-control">
                      </div>
                    </div> 
                    </div>
<!--fourth row-->
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                          <label class="required" for="phoneNumber">Phone number</label>  <span class="specificMessage" id="phoneMessage"></span>
                        <input required name="phoneNumber" id="phoneNumber"  value="${requestScope.user.phoneNumber}" placeholder="Enter you phone number" type="text" class="form-control">
                      </div>
                    </div>
                  </div>
                     
                  <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="avatar">Change avatar</label>
                                    <input name="avatar" id="avatar" placeholder="Image file" type="file" accept="image/*" class="form-control">
                                </div>
                            </div>
                  </div>
                      
                <div class="col-md-12 text-center">
                    <p id="userProfileMessage" style="color:green; font-weight: bold">${requestScope.successMessage}</p>
                    <input type="hidden" name="successMessage" value="Edit profile successfully!">
                    <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Save new changes</button>
                  </div>
                </form>
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
    
    <script src='js/userProfile.js'></script>
  </body>
</html>
