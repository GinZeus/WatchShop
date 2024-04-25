<%-- 
    Document   : Product_detail
    Created on : Sep 10, 2023, 11:51:24 PM
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
        <link rel='stylesheet prefetch' href='https://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css'>
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
        <link rel="stylesheet" href="css/rate_star.css">
        <!-- Tweaks for older IEs--><!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
        <style>
            div.stars {
                display: inline-block;
            }

            input.star {
                display: none;
            }

            label.star {
                float: right;
                padding: 10px;
                font-size: 20px;
                color: #444;
                transition: all .2s;
            }

            input.star:checked ~ label.star:before {
                content: '\f005';
                color: #FD4;
                transition: all .25s;
            }

            input.star-5:checked ~ label.star:before {
                color: #FE7;
                text-shadow: 0 0 20px #952;
            }

            input.star-1:checked ~ label.star:before {
                color: #F62;
            }

            label.star:hover {
                transform: rotate(-15deg) scale(1.3);
            }

            label.star:before {
                content: '\f006';
                font-family: FontAwesome;
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
                                    <li class="breadcrumb-item"><a href="ShopController">Shop</a></li>
                                    <li aria-current="page" class="breadcrumb-item active">${pro.product_name}</li>
                                </ol>
                            </nav>
                        </div>
                        <div class="col-lg-12 order-1 order-lg-2">
                            <div id="productMain" class="row">
                                <div class="col-md-6">
                                    <div data-slider-id="1" class="owl-carousel shop-detail-carousel">
                                        <div class="item"> <img src="${pro.thumbnail}" alt="" class="img-fluid"></div>
                                        <div class="item"> <img src="${pdetail.image1}" alt="" class="img-fluid"></div>
                                        <div class="item"> <img src="${pdetail.image2}" alt="" class="img-fluid"></div>
                                    </div>
                                    <div class="ribbon sale">
                                        <div class="theribbon" style="background-color: red; font-size: 20px">-${pro.discount}%</div>
                                        <div class="ribbon-background"></div>
                                    </div>
                                    <c:if test="${pro.status==2}">
                                        <div class="ribbon new">
                                            <div class="theribbon" style="font-size: 12px">SOLD OUT</div>
                                            <div class="ribbon-background"></div>
                                        </div>
                                    </c:if>
                                    <!-- /.ribbon-->
                                </div>
                                <div class="col-md-6">
                                    <div class="box">
                                        <h1 class="text-center">${pro.product_name}</h1>
                                        <p class="goToDescription"><a href="#details" class="scroll-to">Scroll to product details, material &amp; shape and duration</a></p>

                                        <p class="price">$${pro.sale_price}</p>
                                        <c:if test="${sessionScope.account.getRole_id()==4}">
                                            <c:if test="${pro.status==1}">
                                                <p class="text-center buttons"><a href="#" class="btn btn-primary" data-toggle="modal" data-target="#checkModal" onclick="addToCart(${pro.p_id}, 1)"><i class="fa fa-shopping-cart"></i> Add to cart</a></p>
                                            </c:if>  
                                        </c:if>
                                        <c:if test="${sessionScope.account.getRole_id()!=4}">
                                            <c:if test="${pro.status==1}">        
                                                <p class="text-center buttons"><a href="#" class="btn btn-primary" data-toggle="modal" data-target="#checkModal" ><i class="fa fa-shopping-cart"></i> Add to cart</a></p>
                                            </c:if>
                                        </c:if>                                       
                                    </div>
                                    <div data-slider-id="1" class="owl-thumbs content-center">
                                        <button class="owl-thumb-item"><img src="${pro.thumbnail}" alt="" class="img-fluid"></button>
                                        <button class="owl-thumb-item"><img src="${pdetail.image1}" alt="" class="img-fluid"></button>
                                        <button class="owl-thumb-item"><img src="${pdetail.image2}" alt="" class="img-fluid"></button>
                                    </div>          
                                </div>

                            </div>
                            <div id="details" class="box">
                                <h3 class="text-primary"><fmt:formatNumber type = "number" maxFractionDigits = "1" value = "${pro.rate}" />/5 <i class="fa fa-star" style="color: orange"></i></h3>
                                <h4>Product details</h4>
                                <p>${pdetail.des}</p>
                                <h4>Material &amp; Shape</h4>
                                <ul>
                                    <li>Material: ${pdetail.material}</li>
                                    <li>Shape: ${pdetail.shape}</li>
                                </ul>
                                <h4>Width</h4>
                                <ul>
                                    <li>Case width approx: ${pdetail.width} mm</li>
                                </ul>
                                <h4>Duration</h4>
                                <ul>
                                    <li>Battery duration: ${pdetail.duration} hours</li>
                                </ul>

                                <hr>
                                <div class="social">
                                    <h4>Show it to your friends</h4>
                                    <p><a href="#" class="external facebook"><i class="fa fa-facebook"></i></a><a href="#" class="external gplus"><i class="fa fa-google-plus"></i></a><a href="#" class="external twitter"><i class="fa fa-twitter"></i></a><a href="#" class="email"><i class="fa fa-envelope"></i></a></p>
                                </div>
                            </div>
                            <div id="comment-form">
                                <h2>Feedback</h2> 
                                <hr/>
                                <c:if test="${checkBuy == true}">
                                    <c:if test="${fb_uid == null}">
                                        <form action="DetailController?pid=${pro.p_id}" method="post">
                                            <div class="stars">
                                                <input class="star star-5" id="star-5" type="radio" name="starValue" value="5"/>
                                                <label class="star star-5" for="star-5"></label>
                                                <input class="star star-4" id="star-4" type="radio" name="starValue"  value="4"/>
                                                <label class="star star-4" for="star-4"></label>
                                                <input class="star star-3" id="star-3" type="radio" name="starValue"  value="3">
                                                <label class="star star-3" for="star-3"></label>
                                                <input class="star star-2" id="star-2" type="radio" name="starValue"  value="2"/>
                                                <label class="star star-2" for="star-2"></label>
                                                <input class="star star-1" id="star-1" type="radio" name="starValue"  value="1" required/>
                                                <label class="star star-1" for="star-1"></label>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <span id="charCount"></span>
                                                        <label for="comment"><span class="required"></span></label>
                                                        <textarea name="content" id="comment" rows="4" class="form-control" maxlength="500"></textarea>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12 text-right">
                                                    <button type="submit" class="btn btn-primary"> Post </button>
                                                </div>
                                            </div>
                                        </form>
                                    </c:if>
                                </c:if>
                                <c:if test="${fb_uid != null}">
                                    <div>
                                        <h4>Your Feedback</h4>
                                        <c:set var="user" value="${userDAO.getUserInfo(fb_uid.user_id)}" />
                                        <div class="row comment"> 
                                            <div class="col-md-2 col-lg-1 text-center text-md-center">
                                                <p><img src="${user.avatar}" alt="" class="img-fluid rounded-circle" style="width: 4rem; height: 4rem;"></p>
                                            </div>
                                            <div class="col-md-10 col-lg-11">

                                                <div style="display: flex; justify-content: space-between">
                                                    <h5 style="font-weight: bold"><c:out value="${user.fullName}" /></h5> 
                                                    <p class="posted" style="margin-bottom: 0"><i class="fa fa-clock-o"></i>${fb_uid.update_time}</p>
                                                </div>
                                                <div>
                                                    <div class="rated-stars">
                                                        <div class="star-ratings-css" data-rate="${fb_uid.rate_s}"></div>
                                                    </div>
                                                </div>
                                                <div style="display: flex; justify-content: space-between">
                                                    <p>${fb_uid.content}</p>
                                                    <div style="font-size: 1rem">
                                                        <a href="#editFeedback" data-toggle="modal"><i class="fa fa-pencil"></i></a>
                                                        <a onclick="return confirm('Do you want to delete this feedback ?')" href="DeleteFeedbackController?fbid=${fb_uid.fb_id}&pid=${pro.p_id}" style="color: red;"><i class="fa fa-trash-o" ></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Modal Feedback -->   
                                    <div class="modal fade" id="editFeedback" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Edit Feedback</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <form action="EditMyFeedbackController?pid=${pro.p_id}" method="post">
                                                    <div class="modal-body">
                                                        <div class="stars">
                                                            <p>Rate star</p>
                                                            <input class="star star-5" id="star-5" type="radio" name="starEditValue" value="5"/>
                                                            <label class="star star-5" for="star-5"></label>
                                                            <input class="star star-4" id="star-4" type="radio" name="starEditValue"  value="4"/>
                                                            <label class="star star-4" for="star-4"></label>
                                                            <input class="star star-3" id="star-3" type="radio" name="starEditValue"  value="3">
                                                            <label class="star star-3" for="star-3"></label>
                                                            <input class="star star-2" id="star-2" type="radio" name="starEditValue"  value="2"/>
                                                            <label class="star star-2" for="star-2"></label>
                                                            <input class="star star-1" id="star-1" type="radio" name="starEditValue"  value="1" required/>
                                                            <label class="star star-1" for="star-1"></label>
                                                        </div>
                                                        <div class="form-group">
                                                            <span id="charCount"></span>
                                                            <label for="comment"><span class="required"></span></label>
                                                            <textarea name="content_edit" id="comment" rows="4" class="form-control" maxlength="500"></textarea>
                                                        </div>

                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn btn-primary">Edit</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                                <hr/>
                            </div>
                            <!-- /#post-content-->

                            <div id="comments">
                                <h4 style="margin-bottom: 3rem">${total_fb} feedbacks</h4>
                                <c:forEach items="${fb_list}" var="f">
                                    <c:set var="user" value="${userDAO.getUserInfo(f.user_id)}" />
                                    <div class="row comment">
                                        <div class="col-md-2 col-lg-1 text-center text-md-center">
                                            <p><img src="${user.avatar}" alt="" class="img-fluid rounded-circle" style="width: 4rem; height: 4rem;"></p>
                                        </div>
                                        <div class="col-md-10 col-lg-11">

                                            <div style="display: flex; justify-content: space-between">
                                                <h5 style="font-weight: bold"><c:out value="${user.fullName}" /></h5> 

                                                <p class="posted" style="margin-bottom: 0"><i class="fa fa-clock-o"></i>${f.update_time}</p>
                                            </div>
                                            <div>
                                                <div class="rated-stars">
                                                    <div class="star-ratings-css" data-rate="${f.rate_s}"></div>
                                                </div>
                                            </div>
                                            <p>${f.content}</p>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <!-- /.col-md-9-->
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
                                                                const textarea = document.getElementById('comment');
                                                                const charCount = document.getElementById('charCount');
                                                                const charLimitError = document.getElementById('charLimitError');

                                                                textarea.addEventListener('input', function () {
                                                                    const inputText = this.value;
                                                                    const remainingChars = 500 - inputText.length;
                                                                    charCount.textContent = remainingChars + ' characters remaining';

                                                                });

                                                                textarea.addEventListener('blur', function () {
                                                                    charCount.style.display = 'none';
                                                                });

                                                                textarea.addEventListener('focus', function () {
                                                                    charCount.style.display = 'inline';
                                                                });
        </script>
        <script>
            function addToCart(id, num) {
                event.preventDefault();
                $.ajax({
                    url: "/WatchShop/AddToCartController",
                    type: "get",
                    data: {
                        p_id: id,
                        num: num
                    },
                    success: function (response) {
                        // Xử lý phản hồi từ Servlet (nếu cần)
                    },
                    error: function (xhr) {
                        // Xử lý lỗi nếu có
                    }
                });
            }
        </script>
    </body>
</html>
