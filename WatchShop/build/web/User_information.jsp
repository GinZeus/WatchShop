<%-- 
    Document   : User_information
    Created on : 01-11-2023, 18:12:31
    Author     : DELL
--%>

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
                                        <h3 class="mt-5 text-center">User information</h3>

                                    </header>
                                    <!-- <div class="box-header"> -->
                                    <!-- <h3 class="box-title">Responsive Hover Table</h3> -->

                                    <!-- </div> -->
                                    <div class="panel-body table-responsive">
                                        <div class="box-tools m-b-15" style="display: flex; justify-content: space-between"></div>
                                        <div class="panel-body">
                                            <a href="ManageAccountsController" class="btn btn-danger"><i class="fa fa-chevron-left mr-1"></i></a>
                                            <div class="row text-center">
                                                <div class="col">
                                                    <img class="rounded-circle profilePicture" src="${requestScope.user.avatar}" alt="profilePicture">
                                            </div>
                                        </div>

                                        <br>

                                        <div class="row text-center">

                                        </div>

                                        <form  id="userProfile" name="userProfile" action="ManageUserInformation" method="post" onsubmit="validateUserProfile()" enctype="multipart/form-data">
                                            <!--                        row-->
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="username">ID</label>
                                                        <input readonly required name="acc_id" id="acc_id" value="${requestScope.acc.acc_id}" placeholder="Enter your name" type="text" class="form-control">
                                                    </div>
                                                </div>
                                            </div>
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

                                                <h4>${successMessage}</h4>
                                                <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Save changes</button>
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
                                            function removeAscent(str) {
                                                if (str === null || str === undefined)
                                                    return str;
                                                str = str.toLowerCase();
                                                str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, "a");
                                                str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, "e");
                                                str = str.replace(/ì|í|ị|ỉ|ĩ/g, "i");
                                                str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, "o");
                                                str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, "u");
                                                str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, "y");
                                                str = str.replace(/đ/g, "d");
                                                str = str.replace(/,/g, "");
                                                return str;
                                            }

                                            function validateUserProfile() {
                                                var phoneNumber = document.forms["userProfile"]["phoneNumber"].value;
                                                var fullName = document.forms["userProfile"]["fullName"].value;
                                                fullName = removeAscent(fullName);
                                                var address = document.forms["userProfile"]["address"].value;
                                                address = removeAscent(address);

                                                var phoneRegex = /^(09|03|07|08|05)+([0-9]{8})$/;
                                                var letterRegex = /^[a-zA-Z ]{6,25}$/;
                                                var addressRegex = /^[a-zA-Z0-9 ]{3,30}$/;

                                                if (letterRegex.test(fullName) && phoneRegex.test(phoneNumber) && addressRegex.test(address)) {
                                                    if (confirm("Change user information ?")) {
                                                        setTimeout(document.getElementById("userProfile").submit(), 10000);
                                                    } else {
                                                        document.querySelector("#userProfileMessage").innerHTML = "";
                                                        event.preventDefault();
                                                    }
                                                } else {
                                                    event.preventDefault();
                                                    if (!letterRegex.test(fullName)) {
                                                        document.querySelector("#fullNameMessage").innerHTML = "Full name must contain only letter and length must be  from 6 to 25";
                                                        document.querySelector("#fullNameMessage").style.color = "red";
                                                    } else {
                                                        document.querySelector("#fullNameMessage").innerHTML = "";
                                                    }

                                                    if (!phoneRegex.test(phoneNumber)) {
                                                        document.querySelector("#phoneMessage").innerHTML = "Phone number is not valid, must be (+84) format";
                                                        document.querySelector("#phoneMessage").style.color = "red";
                                                    } else {
                                                        document.querySelector("#phoneMessage").innerHTML = "";
                                                    }

                                                    if (!addressRegex.test(address)) {
                                                        document.querySelector("#addressMessage").innerHTML = "Address is invalid, length must be from 6 to 30";
                                                        document.querySelector("#addressMessage").style.color = "red";
                                                    } else {
                                                        document.querySelector("#addressMessage").innerHTML = "";
                                                    }
                                                }
                                            }
                                            let pageStatus = document.querySelector('#manageAcc');
                                            pageStatus.className = "active";
        </script>
    </body>
</html>


