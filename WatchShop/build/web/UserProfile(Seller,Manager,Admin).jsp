<%-- 
    Document   : userProfile for seller, manager, admin
    Created on : Oct 12, 2023, 8:25:11 AM
    Author     : hungnv
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Manage Blog | Watch Shop</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <meta name="description" content="Developed By M Abdur Rokib Promy">
        <meta name="keywords" content="Admin, Bootstrap 3, Template, Theme, Responsive">
        <!-- bootstrap 3.0.2 -->
        <link href="css_dashbroad/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="css_dashbroad/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="css_dashbroad/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- google font -->
        <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <!-- Theme style -->
        <link href="css_dashbroad/style.css" rel="stylesheet" type="text/css" />

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
        <style>
            td{
                text-align: center;
            }
            th{
                text-align: center;
            }
            form{
                padding: 0 20vw 0 20vw;
            }
            .specificMessage{
            margin: 0px 0px 0px 25px;
            }
            .required::after{
            content: "*";
            color:red;
            font-size: 15px;
            }
            .profilePicture{
                width: 300px;
                height: 250px;
                margin: 10px 0 10px 0;
                border:3px solid black;
                border-radius: 50%;
                padding: 2px;
            }
        </style>
    </head>
    <body class="skin-black">
        <jsp:include page="component/header_dashbroad.jsp"></jsp:include>
            <div class="wrapper row-offcanvas row-offcanvas-left">
            <jsp:include page="component/sidebar_dashbroad.jsp"></jsp:include>

                <!-- Right side column. Contains the navbar and content of the page -->
                <aside class="right-side">

                    <!-- Main content -->
                    <section class="content">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="panel">
                                    <header class="panel-heading">
                                        <h3 class="mt-5 text-center">Personal details</h3>
                                        <h4 style="color:green">${message}</h4>
                                    </header>
                                    <!-- <div class="box-header"> -->
                                    <!-- <h3 class="box-title">Responsive Hover Table</h3> -->

                                    <!-- </div> -->
                                    <div class="panel-body table-responsive">
                                        <div class="box-tools m-b-15" style="display: flex; justify-content: space-between"></div>
                                            <div class="panel-body">
                                                <p class="lead">Change your personal details here</p>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <h4>Profile picture</h4>
                                                    </div>
                                                    <div class="col-md-8">
                                                    </div>
                                                </div>
                                                 <div class="row text-center">
                                                    <div class="col">
                                                         <img class="rounded-circle profilePicture" src="${requestScope.user.avatar}" alt="profilePicture">
                                                    </div>
                                                </div>
                                                    
                                                    <br>
                                                    
                                                    <div class="row text-center">
                                                        <div class="col">
                                                            <p style="color:red">* : Please input in these field </p>
                                                        </div>
                                                    </div>
                                                    
                                                    <form  id="userProfile" name="userProfile" action="ProfileControllerV2" method="post" onsubmit="validateUserProfile()" enctype="multipart/form-data">
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
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
                        </div>
                    </div>
                </section><!-- /.content -->
                <div class="footer-main">
                    Copyright &copy Director, 2014
                </div>
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->


        <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script src="js_dashbroad/jquery.min.js" type="text/javascript"></script>

        <!-- Bootstrap -->
        <script src="js_dashbroad/bootstrap.min.js" type="text/javascript"></script>
        <!-- Director App -->
        <script src="js_dashbroad/Director/app.js" type="text/javascript"></script>
        <script src='js/userProfile.js'></script>
    </body>
</html>

