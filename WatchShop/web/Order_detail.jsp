<%-- 
    Document   : My_order
    Created on : Sep 10, 2023, 11:45:51 PM
    Author     : datng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                                    <li aria-current="page" class="breadcrumb-item"><a href="#">My orders</a></li>
                                    <li aria-current="page" class="breadcrumb-item active">Order # 1735</li>
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
                        <div id="customer-order" class="col-lg-9">
                            <c:if test="${order.status!=5}">
                                <div class="box">

                                    <div class="nav flex-column flex-md-row nav-pills text-center ">
                                        <a href="ToConfirmController" class="nav-link flex-sm-fill text-sm-center  "> <i class="fa fa-check">                     </i>To confirm</a>
                                        <a href="ToPackController" class="nav-link flex-sm-fill text-sm-center "> <i class="fa fa-inbox">                      </i>To pack</a>
                                        <a href="ToShipController" class="nav-link flex-sm-fill text-sm-center  "> <i class="fa fa-truck">                  </i>To ship</a>
                                        <a href="ToReceiveController" class="nav-link flex-sm-fill text-sm-center  "> <i class="fa fa-opencart">                  </i>To receive</a>

                                        <a href="CancelledController" class="nav-link flex-sm-fill text-sm-center "> <i class="fa fa-ban">                  </i>Cancelled</a>


                                    </div>
                                </div>
                            </c:if>
                            
                            <div class="box">
                                <h1>Order # ${order.order_id}</h1>
                                <p class="lead">was placed on <strong>${order.order_date}</strong>. </p>
                                <p class="text-muted">If you have any questions, please feel free to <a href="contact.jsp">contact us</a>, our customer service center is working for you 24/7.</p>
                                <hr>
                                <div class="table-responsive mb-4">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>Name</th>
                                                <th>Quantity</th>
                                                <th>Unit price</th>
                                                <th>Discount</th>
                                                <th>Total</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <c:forEach items="${listOd}" var="o">  
                                                <c:set var="p" value="${pd.getProductById(o.p_id)}"/>
                                                <tr>
                                                    <td><a href="DetailController?pid=${p.getP_id()}"><img src="${p.getThumbnail()}" alt="White Blouse Armani"></a></td>
                                                    <td><a href="DetailController?pid=${p.getP_id()}">${p.getProduct_name()}</a></td>
                                                    <td>${o.quantity}</td>
                                                    <td>${o.price}</td>
                                                    <td>${p.getDiscount()}%</td>
                                                    <td><p style="margin: 0px"><fmt:setLocale value = "en_US"/>
                                                            <fmt:formatNumber value = "${o.i_total}" type = "currency"/>
                                                        </p></td>
                                                        <c:if test="${order.status==4}">
                                                            <c:if test="${fbDAO.getFeedbackProFromUid(Integer.toString(p.getP_id()), user_id)==null}">
                                                            <td><a href="FeedbackOrderController?pid=${p.getP_id()}&oid=${order.order_id}" class="btn btn-primary" >Feedback</a></td>
                                                        </c:if>

                                                    </c:if> 
                                                </tr>
                                            
                                        </c:forEach>
                                        </tbody>
                                        <tfoot>   
                                            <tr>
                                                <th colspan="6"></th>
                                                    <c:if test="${order.status==4}">
                                                    <td><a href="CompleteOrderController?o_id=${order.order_id}" class="btn btn-primary" >Finish</a></td>
                                                </c:if>
                                            </tr>
                                            <tr>
                                                <th colspan="6"></th>
                                                    <c:if test="${order.status==5}">
                                                    <td><a href="OrderHistoryController" class="btn btn-secondary" >Return</a></td>
                                                </c:if>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                                <!-- /.table-responsive-->

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

    </body>
</html>
