<%-- 
    Document   : Order_toship
    Created on : 25-10-2023, 22:21:29
    Author     : DELL
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
        <link rel="stylesheet" href="//cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css"/>
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
                                    <li aria-current="page" class="breadcrumb-item active">My orders</li>
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
                                        <a href="passwordControl" class="nav-link" style="width: 100%;"><i class="fa fa-lock"></i>Change Password</a>
                                        <a href="ToConfirmController" class="nav-link active" style="width: 100%;"><i class="fa fa-shopping-basket"></i>My Order</a>
                                        <a href="OrderHistoryController" class="nav-link" style="width: 100%;"><i class="fa fa-history"></i>Order History</a>
                                        <a href="LogoutController" class="nav-link" style="width: 100%;"><i class="fa fa-arrow-left"></i>Logout</a>
                                    </ul>
                                </div>
                            </div>
                            <!-- /.col-lg-3-->
                            <!-- *** CUSTOMER MENU END ***-->
                        </div>
                        <div id="customer-orders" class="col-lg-9"> 
                            <div class="box">

                                <div class="nav flex-column flex-md-row nav-pills text-center ">
                                    <a href="ToConfirmController" class="nav-link flex-sm-fill text-sm-center  "> <i class="fa fa-check">                     </i>To confirm</a>
                                    <a href="ToPackController" class="nav-link flex-sm-fill text-sm-center "> <i class="fa fa-inbox">                      </i>To pack</a>
                                    <a href="ToShipController" class="nav-link flex-sm-fill text-sm-center font-weight-bold border-bottom border-primary "> <i class="fa fa-truck">                  </i>To ship</a>
                                    <a href="ToReceiveController" class="nav-link flex-sm-fill text-sm-center  "> <i class="fa fa-opencart">                  </i>Received</a>
                                    
                                    <a href="CancelledController" class="nav-link flex-sm-fill text-sm-center  "> <i class="fa fa-ban">                  </i>Cancelled</a>


                                </div>
                            </div>
                            <div class="box">    
                                <div class="table-responsive">
                                    <table class="table table-hover" id="toConfirmTable">
                                        <thead>
                                            <tr>
                                                <th>Order</th>
                                                
                                                <th>Name</th>
                                                <th>Status</th>
                                                <th>Date</th>
                                                
                                                <th >Total</th>

                                                
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listO}" var="o">
                                                <tr>
                                                    <th># ${o.order_id}</th>
                                                    <td> ${o.fullName} </td>
                                                    <td><p class="badge badge-warning">Being shipped</p></td>
                                                    <td>${o.order_date}</td>    
                                                    
                                                    <td>$ ${o.total}</td>
                                                    
                                                    <td><a href="OrderDetailController?o_id=${o.order_id}" class="btn btn-primary btn-sm"><i class="fa fa-eye"></i></a>
                                                    
                                                    <a href="ReceiveOrder?o_id=${o.order_id}&status=4" class="btn btn-danger  btn-sm">Received</a></td>
                                                    
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                
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

    function validateOrder() {
        var phoneNumber = document.forms["editOrderForm"]["phone_number"].value;
        var fullName = document.forms["editOrderForm"]["fullname"].value;
        fullName = removeAscent(fullName);
        var address = document.forms["editOrderForm"]["address"].value;
        address = removeAscent(address);
        var phoneRegex = /((09|03|07|08|05)+([0-9]{8})\b)/g;
        var letterRegex = /^[a-zA-Z0-9 ]{6,25}$/;
        var addressRegex = /^[a-zA-Z0-9 , ]{3,30}$/;

        if (letterRegex.test(fullName) && phoneRegex.test(phoneNumber) && addressRegex.test(address)) {
            
            document.getElementById("editOrderForm").submit();
            
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
        <script src="//cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#toConfirmTable').DataTable({
                    pagingType: 'full_numbers',
                    columns: [
                        
                        null,
                        null,
                        null,
                        null,
                        null,
                        { orderable: false }
                        
                    ]
                });
            });
</script>

    </body>
</html>


