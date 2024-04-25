<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Watch Shop</title>
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
            .specificMessage{
                margin: 0px 0px 0px 5px;
            }
            .must{

                color: red;
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
                                    Add new account

                                </header>
                                <div class="panel-body table-responsive">

                                    <div class="panel-body">
                                        <form style ="padding: 0 10vw 0 0;" action="AddAccount" id="addAccountForm" name="addAccountForm" onsubmit="validateAccount()" method="POST">
                                            
                                            <div class="form-group ">
                                                <label class="col-sm-12 control-label">Username<span class="must">(*)</span> <span class="specificMessage" id="usernameMessage"></span></label>
                                                <div class="col-sm-12">
                                                    <input  type="text" class="form-control" name="username" value="${acc.username}" required/>  </br>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-12 control-label required">Email<span class="must">(*)</span><span class="specificMessage" id="emailMessage"></span></label>
                                                <div class="col-sm-12">
                                                    <input type="text" class="form-control" name="email" value="${acc.email}" required></br>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-12 control-label">Password<span class="must">(*)</span><span class="specificMessage" id="passwordMessage"></span></label>
                                                <div class="col-sm-12">
                                                    <input  type="password" class="form-control" name="password"  >  </br>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-12 control-label required">Repassword<span class="must">(*)</span><span class="specificMessage" id="repasswordMessage"></span></label>
                                                <div class="col-sm-12">
                                                    <input type="password" class="form-control" name="repassword"  required></br>
                                                </div>
                                            </div>  
                                            <div class="form-group">
                                                <label class="col-sm-1 control-label required">Role<span class="must">(*)</span></label>
                                                <div class="col-sm-2">
                                                    <select name="role_id" id="role_id">
                                                        <option value="1">Admin</option>
                                                        <option value="2">Manager</option> 
                                                        <option value="3">Seller</option>
                                                        <option value="4" selected>Customer</option>
                                                    </select>
                                                </div>
                                            </div> 
                                             <div class="form-group">
                                                <div class="col-sm-12 text-center">
                                                    <h4 style="color: red"  class="font-weight-bold ">${mess}</h4>
                                                    <h4 style="color: green" class="font-weight-bold ">${messdone}</h4>
                                                </div>
                                            </div>   
                                            <div class="form-group text-right">
                                                <a href="ManageAccountsController" class="btn btn-default" >Return</a>
                                                <button  class="btn btn-primary">Add</button>
                                            </div>
                                        </form>
                                    </div>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
                        </div>
                    </div>
                </section><!-- /.content -->
                <div class="footer-main">

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
                                            function validateAccount() {
                                                var username = document.forms["addAccountForm"]["username"].value;
                                                var email = document.forms["addAccountForm"]["email"].value;
                                                var password = document.forms["addAccountForm"]["password"].value;
                                                var repassword = document.forms["addAccountForm"]["repassword"].value;

                                                var usernameRegex = /^[A-Za-z0-9]{4,32}$/;
                                                var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                                                var passwordRegex = /(?=.*\d)(?=.*[a-z]).{8,50}/;

                                                if (usernameRegex.test(username) && emailRegex.test(email) && passwordRegex.test(password) && repassword === password) {

                                                    document.getElementById("addAccountForm").submit();

                                                } else {
                                                    event.preventDefault();
                                                    if (!usernameRegex.test(username)) {
                                                        document.querySelector("#usernameMessage").innerHTML = "Username must contain 4 to 32 characters and has no special symbols";
                                                        document.querySelector("#usernameMessage").style.color = "red";
                                                    } else {
                                                        document.querySelector("#usernameMessage").innerHTML = "";
                                                    }

                                                    if (!emailRegex.test(email)) {
                                                        document.querySelector("#emailMessage").innerHTML = "Email is invalid!";
                                                        document.querySelector("#emailMessage").style.color = "red";
                                                    } else {
                                                        document.querySelector("#emailMessage").innerHTML = "";
                                                    }

                                                    if (!passwordRegex.test(password)) {
                                                        document.querySelector("#passwordMessage").innerHTML = "Password must contain 8 to 50 characters including at least a upcase, a lowcase and digits! ";
                                                        document.querySelector("#passwordMessage").style.color = "red";
                                                    } else {
                                                        document.querySelector("#passwordMessage").innerHTML = "";
                                                    }
                                                    if (repassword !== password) {
                                                        document.querySelector("#repasswordMessage").innerHTML = "Password does not match!";
                                                        document.querySelector("#repasswordMessage").style.color = "red";
                                                    } else {
                                                        document.querySelector("#repasswordMessage").innerHTML = "";
                                                    }
                                                }
                                            }




        </script>
    </body>
</html>

