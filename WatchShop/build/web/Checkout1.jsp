<%-- 
    Document   : Checkout1
    Created on : Sep 10, 2023, 11:35:35 PM
    Author     : datng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
        .must{
            
            color: red;
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
                                    <li aria-current="page" class="breadcrumb-item active">Checkout - Address</li>
                                </ol>
                            </nav>
                        </div>
                        <div id="checkout" class="col-lg-9">
                            <div class="box">

                                <h1>Checkout - Address</h1>
                                <div class="nav flex-column flex-md-row nav-pills text-center">
                                    <a href="OrderReviewController" class="nav-link flex-sm-fill text-sm-center "> <i class="fa fa-eye">                     </i>Order Review</a>
                                    <a href="DeliveryController" class="nav-link flex-sm-fill text-sm-center "> <i class="fa fa-money">                      </i>Payment Method</a>
                                    <a href="BillAddressController" class="nav-link flex-sm-fill text-sm-center active"> <i class="fa fa-map-marker">                  </i>Address</a>
                                </div>
                                <div class="content py-3 ">
                                    <form id="CheckoutAddress" name="CheckoutAddress" onsubmit="validateCheckoutAddress()" action="PlaceOrder" method="POST" >
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="firstname">Full name</label><span class="must">(*)</span><span class="specificMessage" id="fullNameMessage"></span>
                                                    <input required  name="fullname" type="text" class="form-control" value="${us.getFullName()}" placeholder="Enter your name" >
                                                </div>
                                            </div>

                                        </div>
                                        <!-- /.row-->
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="address">Address</label><span class="must">(*)</span><span class="specificMessage" id="addressMessage"></span>
                                                    <input  name="address" type="text" class="form-control" value="${us.getAddress()}" required placeholder="Enter your address">
                                                </div>
                                            </div>

                                        </div>
                                        <!-- /.row-->
                                        <div class="row">
                                            <div class="col-md-12 col-lg-8">
                                                <div class="form-group">
                                                    <label for="phone_number">Phone number</label><span class="must">(*)</span><span class="specificMessage" id="phoneMessage"></span>
                                                    <input  name="phone_number" type="text" class="form-control" value="${us.getPhoneNumber()}" required placeholder="Enter your phone number">
                                                </div>
                                            </div>
                                            <div class="col-md-12 col-lg-4">   
                                                <div class="form-group">
                                                    <label for="email">Email</label><span class="must">(*)</span>
                                                    <input id="email" name="email" type="text" class="form-control" value="${sessionScope.account.getEmail()}" readonly>
                                                </div>
                                            </div>
                                                
                                            <div class="col-md-12">
                                                <div class="form-group" >
                                                    <label for="note">Note</label>
                                                    <textarea id="note" name="note"  class="form-control" placeholder="Enter a message"></textarea>
                                                </div>
                                            </div>

                                        </div>  
                                        <!-- /.row-->
                                </div>
                                <div class="box-footer d-flex justify-content-between"><a href="DeliveryController" class="btn btn-outline-secondary"><i class="fa fa-chevron-left"></i>Back to Payment Method</a>
                                    <input type="hidden" name="total" value="${cart.getTotalMoney()+10}" >
                                    <input type="submit" class="btn btn-primary" value="Place an order">
                                </div>
                                </form>
                            </div>
                            <!-- /.box-->
                        </div>
                        <!-- /.col-lg-9-->
                        <div class="col-lg-3">
                            <div id="order-summary" class="box">
                                <div class="box-header">
                                    <h3 class="mb-0">Order summary</h3>
                                </div>
                                <p class="text-muted">Shipping and additional costs are calculated based on the values you have entered.</p>
                                <div class="table-responsive">
                                    <table class="table">
                                        <tbody>
                                            <tr>
                                                <td>Order subtotal</td>
                                                <th><p style="margin: 0px">
                                                        <fmt:setLocale value = "en_US"/>
                                                        <fmt:formatNumber value = "${cart.getTotalMoney()}" type = "currency"/></p></th>
                                            </tr>
                                            <tr>
                                                <td>Shipping and handling</td>
                                                <th>$10.00</th>
                                            </tr>
                                            
                                            <tr class="total">
                                                <td>Total</td>
                                                <th><p style="margin: 0px">
                                                        <fmt:setLocale value = "en_US"/>
                                                        <fmt:formatNumber value = "${cart.getTotalMoney()+10}" type = "currency"/></p></th>
                                                </p></th>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!--                        
                                                    </div>
                            <!-- /.col-lg-3-->
                        </div>
                        <!-- /.col-lg-3-->
                    </div>
                </div>
            </div>
        </div>

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
        return str;
    }

    function validateCheckoutAddress() {
        var phoneNumber = document.forms["CheckoutAddress"]["phone_number"].value;
        var fullName = document.forms["CheckoutAddress"]["fullname"].value;
        fullName = removeAscent(fullName);
        var address = document.forms["CheckoutAddress"]["address"].value;
        address = removeAscent(address);
        var phoneRegex = /((09|03|07|08|05)+([0-9]{8})\b)/g;
        var letterRegex = /^[a-zA-Z0-9 ]{6,25}$/;
        var addressRegex = /^[a-zA-Z0-9 , ]{3,30}$/;

        if (letterRegex.test(fullName) && phoneRegex.test(phoneNumber) && addressRegex.test(address)) {
            
            document.getElementById("CheckoutAddress").submit();
            
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
                document.querySelector("#addressMessage").innerHTML = "Address must contain 6 to 30 characters including letter and (,)";
                document.querySelector("#addressMessage").style.color = "red";
            } else {
                document.querySelector("#addressMessage").innerHTML = "";
            }
        }
    }




        </script>
    </body>
</html>
