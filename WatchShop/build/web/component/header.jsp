<%-- 
    Document   : Home
    Created on : Sep 10, 2023, 11:28:04 PM
    Author     : datng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- navbar-->
<header class="header mb-5" style="position: fixed; z-index: 99; width: 100%; top: 0">

    <nav class="navbar navbar-expand-lg">
        <div class="container"><a href="HomeController" class="navbar-brand home"><img src="img/logo.png" alt="Obaju logo" class="d-none d-md-inline-block"><img src="img/logo-small.png" alt="Obaju logo" class="d-inline-block d-md-none"><span class="sr-only">Obaju - go to homepage</span></a>
            <div class="navbar-buttons" style="display: flex; align-items: baseline;">
                <button type="button" data-toggle="collapse" data-target="#navigation" class="btn btn-outline-secondary navbar-toggler"><span class="sr-only">Toggle navigation</span><i class="fa fa-align-justify"></i></button>
                <button type="button" data-toggle="collapse" data-target="#search" class="btn btn-outline-secondary navbar-toggler"><span class="sr-only">Toggle search</span><i class="fa fa-search"></i></button>
                <a href="CartController" class="btn btn-outline-secondary navbar-toggler"><i class="fa fa-shopping-cart"></i></a>
                <div class="dropdown dropdown-slide">
                    <a href="#!" class="btn btn-outline-secondary navbar-toggler" data-toggle="dropdown" data-hover="dropdown">
                        <i class="fa fa-user"></i></a>
                    <div class="dropdown-menu test" style="padding-bottom: 0px;">
                        <div class="row"> 
                            <div class="col-lg-12 col-md-12 mb-sm-3" style="margin-bottom: 0px!important; ">
                                <ul class="list-unstyled">
                                    <c:if test="${sessionScope.account == null}">
                                        <li class="nav-item"><a href="Login.jsp" class="nav-link" style="width: 100%;">Login</a></li> 
                                        <li class="nav-item"><a href="Register.jsp" class="nav-link" style="width: 100%;">Register</a></li> 
                                        </c:if>
                                        <c:if test="${sessionScope.account != null}">                                        
                                        <li class="nav-item"><p class="text-primary" style="padding: 0.25rem 1rem; margin-bottom: 0">Hello ${sessionScope.username}</p></li>
                                        <hr style="margin: 0"/>
                                        <li class="nav-item"><a href="profileControl" class="nav-link" style="width: 100%;"><i class="fa fa-user"></i>My Profile</a></li>
                                        <li class="nav-item"><a href="passwordControl" class="nav-link" style="width: 100%;"><i class="fa fa-lock"></i>Change Password</a></li>
                                        <li class="nav-item"><a href="ToConfirmController" class="nav-link" style="width: 100%;"><i class="fa fa-shopping-basket"></i>My Order</a></li>
                                        <li class="nav-item"><a href="OrderHistoryController" class="nav-link" style="width: 100%;"><i class="fa fa-history"></i>Order History</a></li>
                                        <li class="nav-item"><a href="LogoutController" class="nav-link" style="width: 100%;"><i class="fa fa-arrow-left"></i>Logout</a></li> 
                                        </c:if>  
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="navigation" class="collapse navbar-collapse">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item"><a href="HomeController" class="nav-link">Home</a></li>
                    <li class="nav-item"><a href="ShopController" class="nav-link">Shop</a></li>

                    <li class="nav-item"><a href="BlogController" class="nav-link ">Blog</a></li>


                    <li class="nav-item"><a href="Contact.jsp" class="nav-link ">Contact Us</a></li>
                </ul>
                <div class="navbar-buttons d-flex justify-content-end">
                    <!-- /.nav-collapse-->
                    <div id="search-not-mobile" class="navbar-collapse collapse"></div><a data-toggle="collapse" href="#search" class="btn navbar-btn btn-primary d-none d-lg-inline-block"><span class="sr-only">Toggle search</span><i class="fa fa-search"></i></a>
                    <div id="basket-overview" class="navbar-collapse collapse d-none d-lg-block"><a href="CartController" class="btn btn-primary navbar-btn"><i class="fa fa-shopping-cart"></i><span></span></a></div>
                    <div class="dropdown dropdown-slide d-none d-lg-block">
                        <a href="#!" class="btn btn-primary navbar-btn" data-toggle="dropdown" data-hover="dropdown">
                            <i class="fa fa-user"></i></a>
                        <div class="dropdown-menu test" style="padding-bottom: 0px; position: absolute; left: -7rem; width: 12rem">
                            <div class="row"> 
                                <div class="col-lg-12 col-md-12 mb-sm-3" style="margin-bottom: 0px!important; ">
                                    <ul class="list-unstyled">
                                        <c:if test="${sessionScope.account == null}">
                                            <li class="nav-item"><a href="Login.jsp" class="nav-link" style="width: 100%;">Login</a></li> 
                                            <li class="nav-item"><a href="Register.jsp" class="nav-link" style="width: 100%;">Register</a></li> 
                                            </c:if>
                                            <c:if test="${sessionScope.account != null}">                                        
                                            <li class="nav-item"><p class="text-primary" style="padding: 0.25rem 1rem; margin-bottom: 0">Hello ${sessionScope.username}</p></li>
                                            <hr style="margin: 0"/>
                                            <c:if test="${sessionScope.account.getRole_id() == 4}">
                                                <li class="nav-item"><a href="profileControl" class="nav-link" style="width: 100%;"><i class="fa fa-user"></i>My Profile</a></li>
                                                <li class="nav-item"><a href="passwordControl" class="nav-link" style="width: 100%;"><i class="fa fa-lock"></i>Change Password</a></li>

                                                <li class="nav-item"><a href="ToConfirmController" class="nav-link" style="width: 100%;"><i class="fa fa-shopping-basket"></i>My Order</a></li>

                                                <li class="nav-item"><a href="OrderHistoryController" class="nav-link" style="width: 100%;"><i class="fa fa-history"></i>Order History</a></li>
                                                </c:if>
                                                <c:if test="${sessionScope.account.getRole_id() == 3}">
                                                <li class="nav-item"><a href="SaleDashboardController" class="nav-link" style="width: 100%;">Sale dashboard</a></li>

                                            </c:if>  
                                            <c:if test="${sessionScope.account.getRole_id() == 2}">
                                                <li class="nav-item"><a href="SaleDashboardController" class="nav-link" style="width: 100%;">Sale dashboard</a></li>
                                                </c:if>
                                                <c:if test="${sessionScope.account.getRole_id() == 1}">
                                                <li class="nav-item"><a href="AdminDashboardController" class="nav-link" style="width: 100%;">Admin dashboard</a></li>
                                                </c:if>  
                                            <li class="nav-item"><a href="LogoutController" class="nav-link" style="width: 100%;"><i class="fa fa-arrow-left"></i>Logout</a></li> 
                                            </c:if> 
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>
    <div id="search" class="collapse">
        <div class="container">
            <form role="search" action="SearchController" class="ml-auto">
                <div class="input-group">
                    <input type="text" name="search_mess" placeholder="Search products  " class="form-control">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</header>
