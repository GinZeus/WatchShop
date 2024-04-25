<%-- 
    Document   : Home
    Created on : Sep 10, 2023, 11:28:04 PM
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
    </head>
    <body>
        <!-- navbar-->
        <jsp:include page="component/header.jsp" />
        <div id="all">
            <div id="content">
                <div class="container">
                    <div class="row">

                        <div class="col-md-12">
                            <div id="main-slider" class="owl-carousel owl-theme">

                                <c:forEach items="${sl}" var="o">
                                    <div class="item" ><img style="max-height: 500px ; object-fit:fill " src="${o.thumbnail}" alt="" class="img-fluid"></div>
                                    </c:forEach>
                            </div>
                            <!-- /#main-slider-->
                        </div>

                    </div>
                </div>
                <!--
                *** ADVANTAGES HOMEPAGE ***
                _________________________________________________________
                -->

                <!-- /#advantages-->
                <!-- *** ADVANTAGES END ***-->
                <!--
                *** HOT PRODUCT SLIDESHOW ***
                _________________________________________________________
                -->
                <div id="hot">
                    <div class="box py-4">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <h2 class="mb-0" style="font-weight: 400;">New products</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="product-slider owl-carousel owl-theme">
                            <c:forEach items="${list}" var="o">
                                <div class="item">
                                    <div class="product">
                                        <div class="flip-container">
                                            <div class="flipper">
                                                <div class="front"><a href="DetailController?pid=${o.p_id}"><img src="${o.thumbnail}" alt="" class="img-fluid"></a></div>
                                                <div class="back"><a href="DetailController?pid=${o.p_id}"><img src="${o.thumbnail}" alt="" class="img-fluid"></a></div>
                                            </div>
                                        </div><a href="DetailController?pid=${o.p_id}" class="invisible"><img src="${o.thumbnail}" alt="" class="img-fluid"></a>
                                        <div class="text">
                                            <h3><a href="DetailController?pid=${o.p_id}">${o.product_name}</a></h3>
                                            <p class="price"> 
                                                <del></del>$${o.sale_price}
                                            </p>
                                        </div>

                                        <!-- /.ribbon-->
                                        <div class="ribbon sale" >
                                            <div class="theribbon" style="background-color: red; font-size: 20px">-${o.discount}%</div>
                                            <div class="ribbon-background"></div>
                                        </div>


                                    </div>
                                    <!-- /.product-->
                                </div>
                            </c:forEach>
                            <!-- /.product-slider-->
                        </div>
                        <!-- /.container-->
                    </div>
                    <!-- /#hot-->
                    <!-- *** HOT END ***-->
                </div>


                <div class="box text-center">
                    <div class="container">
                        <div class="col-md-12">
                            <h3 class="text-uppercase">From our blog</h3>
                            <p class="lead mb-0">What's new in the world of watches? <a href="BlogController">Check our blog!</a></p>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="col-md-12">
                        <div id="blog-homepage" class="row">
                            <c:forEach items="${blog}" var="o" varStatus="loop">
                                <c:if test="${o.status==1 and loop.index < 2}">
                                    <div class="col-sm-6">
                                        <div class="post">
                                            <h4><a href="PostController?blog_id=${o.blog_id}">${o.title}</a></h4>
                                            <p class="author-category">By <a href="#">${o.author}</a> </p>
                                            <hr>
                                            <p class="intro">${o.intro}</p>
                                            <p class="read-more"><a href="PostController?blog_id=${o.blog_id}" class="btn btn-primary">Continue reading</a></p>
                                        </div>
                                    </div>  
                                </c:if>
                            </c:forEach>
                        </div>
                        <!-- /#blog-homepage-->
                    </div>
                </div>
                <!-- /.container-->
                <!-- *** BLOG HOMEPAGE END ***-->
            </div>
        </div>
        <jsp:include page="component/footer.jsp" />

        <!-- JavaScript files-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="vendor/jquery.cookie/jquery.cookie.js"></script>
        <script src="vendor/owl.carousel/owl.carousel.min.js"></script>
        <script src="vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.js"></script>
        <script src="js/front.js"></script>
    </body>
</html>
