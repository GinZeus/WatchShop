<%-- 
    Document   : changePassword for seller, manager, admin
    Created on : Oct 25, 2023, 8:25:11 AM
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
                                        <h3 class="mt-5 text-center">Change password</h3>
                                        <h4 style="color:green">${message}</h4>
                                    </header>
                                    <!-- <div class="box-header"> -->
                                    <!-- <h3 class="box-title">Responsive Hover Table</h3> -->

                                    <!-- </div> -->
                                    <div class="panel-body table-responsive">
                                        <div class="box-tools m-b-15" style="display: flex; justify-content: space-between"></div>
                                            <div class="panel-body">
                                                <p class="lead">Change your password here</p>

                                                    <br>
                                                    
                                                    <div class="row">
                                                        <div class="col">
                                                            <p style="color:red; margin-left: 20px;">* : Please input in these field </p>
                                                        </div>
                                                    </div>
                                                    
                                                    <form name="passwordChange" action="PasswordControllerV2" method="post" onsubmit="validatePassword()" >
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
            
            
            
        </script>
    </body>
</html>

