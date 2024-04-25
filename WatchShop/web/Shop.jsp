<%-- 
    Document   : Shop
    Created on : Sep 10, 2023, 11:34:21 PM
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
            .img-square{
                aspect-ratio: 1/1;
                object-fit: contain;
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
                                    <li class="breadcrumb-item"><a href="HomeController">Home</a></li>

                                    <li aria-current="page" class="breadcrumb-item active">Shop</li>

                                </ol>
                            </nav>
                        </div>
                        <div class="col-lg-3">
                            <!--
                            * MENUS AND FILTERS *
                            _______________________________________________________
                            -->
                            <div class="card sidebar-menu mb-4">
                                <div class="card-header">
                                    <h3 class="h4 card-title"><a href="ShopController">All categories</a></h3>
                                </div>
                                <div class="card-body">
                                    <ul class="nav nav-pills flex-column category-menu" >
                                        <c:forEach items="${cate}" var="o">
                                            <li >
                                                <a href="#" onclick="cateController(${o.cate_id}, 1)" class="category nav-link">
                                                    ${o.cate_name}</a>

                                            </li>
                                        </c:forEach>

                                    </ul>
                                </div>
                            </div>

                            <div class="card sidebar-menu mb-4">
                                <div class="card-header">
                                    <h3 class="h4 card-title">Brand</h3>
                                </div>
                                <div class="card-body">
                                    <ul class="nav nav-pills flex-column category-menu">
                                        <c:forEach items="${br}" var="o">
                                            <li>
                                                <a href="#" onclick="brandController(${o.brand_id}, 1)"> ${o.brand_name}</a>

                                            </li>
                                        </c:forEach>

                                    </ul>
                                </div>
                            </div>


                            <!-- * MENUS AND FILTERS END ***-->
                            <div class="banner"><a href="#"><img src="https://images.pexels.com/photos/1034063/pexels-photo-1034063.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" alt="sales 2014" class="img-fluid"></a></div>
                        </div>
                        <div id="shop" class="col-lg-9 ">

                            <div class="box info-bar">
                                <div class="row">

                                    <div class="col-md-12 col-lg-4 products-number-sort">
                                        <form class="form-inline d-block d-lg-flex justify-content-between flex-column flex-md-row">
                                            <div class="products-sort-by mt-2 mt-lg-0"><strong>Sort by</strong>
                                                <select id="sort_by" onchange="shopControl(1)" class="form-control">
                                                    <option value="0" >Default</option>
                                                    <option value="1">Lowest price</option>
                                                    <option value="2">Highest price</option>
                                                    <option value="3">Newest</option>
                                                    <option value="4" >Oldest</option>

                                                </select>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="col-md-12 col-lg-4 products-number-sort">
                                        <form class="form-inline d-block d-lg-flex justify-content-between flex-column flex-md-row">
                                            <div class="products-sort-by mt-2 mt-lg-0"><strong>Range</strong>
                                                <select id="range" onclhange="shopControl(1)" class="form-control">
                                                    <option value="0" >All price</option>
                                                    <option value="1" >Under 200$</option>
                                                    <option value="2">200$ to 600$ </option>
                                                    <option value="3" >601$ to 1000$</option>
                                                    <option value="4" >Above 1000$</option>

                                                </select>
                                            </div>
                                        </form>
                                    </div>  
                                    <div class="col-md-12 col-lg-4 products-number-sort">
                                        <form class="form-inline d-block d-lg-flex justify-content-between flex-column flex-md-row">
                                            <div class="products-sort-by mt-2 mt-lg-0">Including <strong>${count}</strong> products<!-- comment -->

                                            </div></form>
                                    </div>             
                                </div>
                            </div>
                            <div class="row products">
                                <c:forEach items="${list}" var="o">
                                    <div class="col-lg-4 col-md-6">
                                        <div class="product">
                                            <div class="flip-container">
                                                <div class="flipper">
                                                    <div class="front"><a href="DetailController?pid=${o.p_id}"><img src="${o.thumbnail}" alt="" class="img-fluid img-square"></a></div>
                                                    <div class="back"><a href="DetailController?pid=${o.p_id}"><img src="${o.thumbnail}" alt="" class="img-fluid img-square"></a></div>
                                                </div>
                                            </div><a href="DetailController?pid=${o.p_id}" class="invisible"><img src="${o.thumbnail}" alt="" class="img-fluid img-square"></a>
                                            <div class="text">
                                                <h3><a href="DetailController?pid=${o.p_id}">${o.product_name}</a></h3>
                                                <p class="price"> 
                                                    <del></del>$${o.sale_price}  
                                                </p>
                                                <p class="buttons">
                                                    <a href="DetailController?pid=${o.p_id}" class="btn btn-outline-secondary">View detail</a>
                                                    <c:if test="${sessionScope.account.getRole_id()==4}">
                                                        <c:if test="${o.status==1}">
                                                            <a href="#" onclick="addToCart(${o.p_id}, 1)" data-toggle="modal" data-target="#checkModal" class="btn btn-primary"><i class="fa fa-shopping-cart"></i>Add to cart</a></p>
                                                        </c:if>
                                                    </c:if>

                                                <c:if test="${sessionScope.account.getRole_id()!=4}">
                                                    <c:if test="${o.status==1}">
                                                        <a href="#" data-toggle="modal" data-target="#checkModal" class="btn btn-primary"><i class="fa fa-shopping-cart"></i>Add to cart</a></p>
                                                    </c:if>
                                                </c:if>

                                            </div>

                                            <!-- /.text-->
                                            <div class="ribbon sale">
                                                <div class="theribbon" style="background-color: red; font-size: 20px">-${o.discount}%</div>
                                                <div class="ribbon-background"></div>
                                            </div>
                                            <c:if test="${o.status==2}">
                                                <div class="ribbon new">
                                                    <div class="theribbon" style="font-size: 12px">SOLD OUT</div>
                                                    <div class="ribbon-background"></div>
                                                </div>
                                            </c:if>    
                                            <!-- /.ribbon-->

                                        </div>
                                        <!-- /.product            -->
                                    </div>

                                </c:forEach>
                                <!-- /.products-->
                            </div>
                            <div class="pages">

                                <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                                    <ul class="pagination">
                                        <c:forEach begin="1" end="${endP}" var="i">
                                            <li class="page-item ${i==index?"active":""}"><a href="ShopController?index=${i}" class="page-link">${i}</a></li>
                                            </c:forEach>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                        <!-- /.col-lg-9-->
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


                                                <c:if test="${sessionScope.account == null}">
                                                    <span ><i class="fa fa-exclamation-triangle text-warning  display-4"></i></span>
                                                    <h3 class="col-md-12 m-lg-4">You need sign in to continue!</h3>
                                                </c:if>
                                                <c:if test="${sessionScope.account != null && sessionScope.account.getRole_id() != 4}">
                                                    <span ><i class="fa fa-exclamation-triangle text-warning  display-4"></i></span>
                                                    <h3 class="col-md-12 m-lg-4">Only customers are eligible to purchase the product!</h3>
                                                </c:if>
                                                <c:if test="${sessionScope.account != null && sessionScope.account.getRole_id() == 4}">
                                                    <span ><i class="fa fa-check-circle-o text-success  display-4"></i></span>
                                                    <h3 class="col-md-12 m-lg-4">Item has been added to your shopping cart!</h3>
                                                </c:if>

                                                <button type="button" class="btn btn-secondary offset-md-8 col-md-2" data-dismiss="modal">Close</button>

                                            </div>
                                        </div>




                                    </div>
                                </div>
                            </div>
                        </div> 
                    </div>
                </div>
            </div>
        </div>
        <!--
        * FOOTER *
        _______________________________________________________
        -->
        <jsp:include page="component/footer.jsp"/>
        <!-- * COPYRIGHT END ***-->
        <!-- JavaScript files-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="vendor/jquery.cookie/jquery.cookie.js"></script>
        <script src="vendor/owl.carousel/owl.carousel.min.js"></script>
        <script src="vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.js"></script>
        <script src="js/front.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
                                                                function addToCart(id, num) {
                                                                    event.preventDefault();

                                                                    $.ajax({
                                                                        url: "/WatchShop/AddToCartController",
                                                                        type: "get",
                                                                        data: {
                                                                            p_id: id,
                                                                            num: num
                                                                        }
                                                                    });
                                                                }


        </script>
        <script>
            function brandController(brandid, index) {
                var sort_by = document.getElementById("sort_by").value;
                var range = document.getElementById("range").value;
                $.ajax({
                    url: "/WatchShop/AjaxBrandController",
                    type: "get",
                    data: {
                        brand_id: brandid,
                        index: index,
                        sort_by: sort_by,
                        range: range

                    },
                    success: function (response) {
                        var content = document.getElementById("shop");
                        content.innerHTML = response;
                    }

                });
            }
            function cateController(cateid, index) {
                var sort_by = document.getElementById("sort_by").value;
                var range = document.getElementById("range").value;
                $.ajax({
                    url: "/WatchShop/AjaxCategoryController",
                    type: "get",
                    data: {
                        cate_id: cateid,
                        index: index,
                        sort_by: sort_by,
                        range: range

                    },
                    success: function (response) {
                        var content = document.getElementById("shop");
                        content.innerHTML = response;
                    }

                });
            }

        </script>
        <script>
            function shopControl(index) {
                var sort_by = document.getElementById("sort_by").value;
                var range = document.getElementById("range").value;
                $.ajax({
                    url: "/WatchShop/AjaxShopController",
                    type: "get",
                    data: {
                        index: index,
                        sort_by: sort_by,
                        range: range

                    },
                    success: function (response) {
                        var content = document.getElementById("shop");
                        content.innerHTML = response;
                    }
                });
            }

        </script>

    </body>
</html>