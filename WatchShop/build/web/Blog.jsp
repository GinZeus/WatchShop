<%-- 
    Document   : Blog
    Created on : Sep 10, 2023, 11:30:57 PM
    Author     : datng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                                    <li class="breadcrumb-item"><a href="HomeController">Home</a></li>
                                    <li aria-current="page" class="breadcrumb-item active">Blog listing</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <div class="row">
                        <!--
                        *** LEFT COLUMN ***
                        _________________________________________________________
                        -->
                        <div id="blog-listing" class="col-lg-9">
                            <div class="box">
                                <h1>Blog category name</h1>
                                <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper.</p>
                            </div>
                            <c:forEach items="${blogS}" var="o">

                                <!-- post-->
                                <div class="post">
                                    <h2><a href="PostController?blog_id=${o.blog_id}">${o.title}</a></h2>
                                    <p class="author-category">By <a href="#">${o.author}</a></p>
                                    <hr>
                                    <p class="date-comments"><a href="PostController?blog_id=${o.blog_id}"><i class="fa fa-calendar-o"></i>Update ${o.update_time}</a>
                                    <div class="image"><a href="PostController?blog_id=${o.blog_id}"><img src="${o.thumbnail}" alt="Example blog post alt" class="img-fluid"></a></div>
                                    <p class="intro">${o.intro}</p>
                                    <p class="read-more"><a href="PostController?blog_id=${o.blog_id}" class="btn btn-primary">Continue reading</a></p>
                                </div>
                            </c:forEach>
                            <div class="pages">

                                <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                                    <ul class="pagination">
                                        <c:forEach begin="1" end="${pageNum}" var="i">
                                            <li class="page-item ${i==index?"active":"  "}"><a href="BlogController?index=${i}" class="page-link">${i}</a></li>
                                            </c:forEach>
                                    </ul>


                                </nav>
                            </div>

                        </div>
                        <!-- /.col-lg-9-->
                        <!-- *** LEFT COLUMN END ***-->

                        <div class="col-lg-3">
                            <!--
                            *** BLOG MENU ***
                            _________________________________________________________
                            -->
                            <div class="card sidebar-menu mb-4">
                                <div class="card-header">
                                    <h3 class="h4 panel-title">Blog</h3>
                                </div>
                                <form action="SearchAuthor" method="post" class="ml-auto">
                                    <div class="input-group">
                                        <input value="${authorS}" type="text" name="searchauthor" placeholder="Search author  " class="form-control">
                                        <div class="input-group-append">
                                            <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <!-- /.col-lg-3-->
                            <!-- *** BLOG MENU END ***-->
                            <div class="banner"><a href="#"><img src="img/banner.jpg" alt="sales 2014" class="img-fluid"></a></div>
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
