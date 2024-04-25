<%-- 
    Document   : Cart
    Created on : Sep 10, 2023, 11:30:01 PM
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
        <link rel="stylesheet" href="//cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css"/>
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
                                    <li aria-current="page" class="breadcrumb-item active">Shopping cart</li>
                                </ol>
                            </nav>
                        </div>
                        <div id="basket" class="col-lg-9">
                            <div class="box">

                                <h1>Shopping cart</h1>
                                <p class="text-muted">You currently have ${requestScope.size} item(s) in your cart.</p>
                                <div class="table-responsive">
                                    <table class="table" id="cartTable">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>Name</th>
                                                <th>Quantity</th>
                                                <th>Unit price</th>
                                                <th>Discount</th>
                                                <th colspan="2">Total</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody id="c_table">
                                            <c:set var="o" value="${requestScope.cart}"/>
                                            <c:set var="tt" value="0"/>
                                            <c:forEach items="${o.items}" var="i">
                                                <c:set var="tt" value="${tt+1}"/>
                                                <tr>
                                                    <td><a href="DetailController?pid=${i.getProduct().getP_id()}"><img src="${i.getProduct().getThumbnail()}" alt=""></a></td>
                                                    <td><a href="DetailController?pid=${i.getProduct().getP_id()}">${i.getProduct().getProduct_name()}</a></td>
                                                    <td>
                                                        <button class="btn btn-sm btn-outline-primary m-0" href="#" onclick="modifyQuantity(${i.getProduct().getP_id()}, -1)">-</button>
                                                        ${i.getQuantity()}
                                                        <c:if test="${i.getProduct().getQuantity() > i.quantity}">
                                                            <button class="btn btn-sm btn-outline-primary m-0" href="#" onclick="modifyQuantity(${i.getProduct().getP_id()}, 1)">+</button>
                                                        </c:if>
                                                    </td>
                                                    <td>$${i.getSale_price()}</td>
                                                    <td>${i.getProduct().getDiscount()}%</td>
                                                    <td><p style="margin: 0px"><fmt:setLocale value = "en_US"/>
                                                            <fmt:formatNumber value = "${i.getQuantity()*i.getSale_price()*(1-(i.getProduct().getDiscount()*0.01))}" type = "currency"/>
                                                        </p></td>
                                                    <td><a href="#" onclick="deleteItem(${i.getProduct().getP_id()})"><i class="fa fa-trash-o"></i></a></td>
                                                </tr>

                                            </c:forEach>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th colspan="5">Total</th>
                                                <th colspan="2"><p style="margin: 0px"><fmt:setLocale value = "en_US"/>
                                                        <fmt:formatNumber value = "${o.getTotalMoney()}" type = "currency"/>
                                                    </p></th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                                <!-- /.table-responsive-->
                                <div class="box-footer d-flex justify-content-between flex-column flex-lg-row">
                                    <div class="left"><a href="ShopController" class="btn btn-outline-secondary"><i class="fa fa-chevron-left"></i> Continue shopping</a></div>
                                    <div class="right">
                                        <!--                                            <button class="btn btn-outline-secondary"><i class="fa fa-refresh"></i> Update cart</button>-->

                                        <a ${size ==0 ?' data-toggle="modal" data-target="#checkModal"': 'href="OrderReviewController"'} class="btn btn-primary">Proceed to checkout <i class="fa fa-chevron-right"></i></a>

                                    </div>
                                </div>

                            </div>

                            <!-- /.box-->
                            <!--                            <div class="row same-height-row">
                                                            <div class="col-lg-3 col-md-6">
                                                                <div class="box same-height">
                                                                    <h3>You may also like these products</h3>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-3 col-sm-6">
                                                                <div class="product same-height">
                                                                    <div class="flip-container">
                                                                        <div class="flipper">
                                                                            <div class="front"><a href="detail.html"><img src="img/product2.jpg" alt="" class="img-fluid"></a></div>
                                                                            <div class="back"><a href="detail.html"><img src="img/product2_2.jpg" alt="" class="img-fluid"></a></div>
                                                                        </div>
                                                                    </div><a href="detail.html" class="invisible"><img src="img/product2.jpg" alt="" class="img-fluid"></a>
                                                                    <div class="text">
                                                                        <h3>Fur coat</h3>
                                                                        <p class="price">$143</p>
                                                                    </div>
                                                                </div>
                                                                 /.product
                                                            </div>
                                                            <div class="col-md-3 col-sm-6">
                                                                <div class="product same-height">
                                                                    <div class="flip-container">
                                                                        <div class="flipper">
                                                                            <div class="front"><a href="detail.html"><img src="img/product1.jpg" alt="" class="img-fluid"></a></div>
                                                                            <div class="back"><a href="detail.html"><img src="img/product1_2.jpg" alt="" class="img-fluid"></a></div>
                                                                        </div>
                                                                    </div><a href="detail.html" class="invisible"><img src="img/product1.jpg" alt="" class="img-fluid"></a>
                                                                    <div class="text">
                                                                        <h3>Fur coat</h3>
                                                                        <p class="price">$143</p>
                                                                    </div>
                                                                </div>
                                                                 /.product
                                                            </div>
                                                            <div class="col-md-3 col-sm-6">
                                                                <div class="product same-height">
                                                                    <div class="flip-container">
                                                                        <div class="flipper">
                                                                            <div class="front"><a href="detail.html"><img src="img/product3.jpg" alt="" class="img-fluid"></a></div>
                                                                            <div class="back"><a href="detail.html"><img src="img/product3_2.jpg" alt="" class="img-fluid"></a></div>
                                                                        </div>
                                                                    </div><a href="detail.html" class="invisible"><img src="img/product3.jpg" alt="" class="img-fluid"></a>
                                                                    <div class="text">
                                                                        <h3>Fur coat</h3>
                                                                        <p class="price">$143</p>
                                                                    </div>
                                                                </div>
                                                                 /.product
                                                            </div>
                                                        </div>-->
                        </div>
                        <div class="modal fade" id="checkModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">

                                    <div class="modal-header bg-primary">

                                        <h4 class="modal-title text-light" id="exampleModalLabel">Notice</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>

                                    <div class="modal-body">
                                        <div class="container-fluid">
                                            <div class="row text-center content-center">

                                                <span ><i class="fa fa-exclamation-circle text-primary  display-4"></i></span>

                                                <h3 class="col-md-12 m-lg-4">Please select products to continue !</h3>


                                                <button type="button" class="btn btn-secondary offset-md-6 col-md-2" data-dismiss="modal">Close</button>
                                                <a href="ShopController" class="btn btn-primary col-md-3">Go to shop</a>
                                            </div>
                                        </div>




                                    </div>
                                </div>
                            </div>
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
                                                <th><p style="margin: 0px">$<fmt:formatNumber type = "number" 
                                                                  maxFractionDigits = "3"  
                                                                  value = "${o.getTotalMoney()}" 
                                                                  /></p></th>
                                            </tr>
                                            <tr>
                                                <td>Shipping and handling</td>
                                                <th>$10.00</th>
                                            </tr>

                                            <tr class="total">
                                                <td>Total</td>
                                                <th><p style="margin: 0px">$<fmt:formatNumber type = "number" 
                                                                  maxFractionDigits = "3"  
                                                                  value = "${o.getTotalMoney()+10}" 
                                                                  /></p></th>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!--                            <div class="box">
                                                            <div class="box-header">
                                                                <h4 class="mb-0">Coupon code</h4>
                                                            </div>
                                                            <p class="text-muted">If you have a coupon code, please enter it in the box below.</p>
                                                            <form>
                                                                <div class="input-group">
                                                                    <input type="text" class="form-control"><span class="input-group-append">
                                                                        <button type="button" class="btn btn-primary"><i class="fa fa-gift"></i></button></span>
                                                                </div>
                                                                 /input-group
                                                            </form>
                                                        </div>-->
                        </div>
                        <!-- /.col-md-3-->
                    </div>
                </div>
            </div>
        </div>
        <!--
        *** FOOTER ***
        _________________________________________________________
        -->
        <jsp:include page="component/footer.jsp"/>
        <!-- /#footer-->
        <!-- *** FOOTER END ***-->



        <!-- *** COPYRIGHT END ***-->
        <!-- JavaScript files-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="vendor/jquery.cookie/jquery.cookie.js"></script>
        <script src="vendor/owl.carousel/owl.carousel.min.js"></script>
        <script src="vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.js"></script>
        <script src="js/front.js"></script>
        <script>
                                                                function checkCart(size) {
                                                                    if (size === 0) {
                                                                        window.alert("Please select items to continue the action!");
                                                                        window.location.href = "ShopController";
                                                                    } else {
                                                                        window.location.href = "OrderReviewController";
                                                                    }
                                                                }
                                                                function deleteItem(id) {
                                                                    if (confirm("Remove item")) {

                                                                        window.location = "deleteItem?p_id=" + id;

                                                                    }
                                                                }
                                                                function modifyQuantity(id, num) {

                                                                    $.ajax({
                                                                        url: "/WatchShop/ModifyQuantity",
                                                                        type: "get",
                                                                        data: {
                                                                            p_id: id,
                                                                            num: num
                                                                        },
                                                                        success: function (response) {
                                                                            // Xử lý phản hồi từ Servlet (nếu cần)
                                                                            window.location.reload();
                                                                        },
                                                                        error: function (xhr) {
                                                                            // Xử lý lỗi nếu có
                                                                        }
                                                                    });
                                                                }

        </script>
        <script src="//cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
        <script>
                                                                $(document).ready(function () {
                                                                    $('#cartTable').DataTable({
                                                                        pagingType: 'full_numbers',
                                                                        columns: [
                                                                            {orderable: false},
                                                                            null,
                                                                            null,
                                                                            null,
                                                                            null,
                                                                            null,
                                                                            {orderable: false}

                                                                        ]
                                                                    });
                                                                });
        </script>

    </body>
</html>
