<%-- 
    Document   : sidebar_dashbroad
    Created on : Oct 6, 2023, 5:03:47 PM
    Author     : datng
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Left side column. contains the logo and sidebar -->
<aside class="left-side sidebar-offcanvas">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left info">
                <p>Hello, ${sessionScope.account.username}</p>
            </div>
        </div>
        <ul class="sidebar-menu">
            <c:if test="${(sessionScope.account.role_id == 2) || (sessionScope.account.role_id == 3)}">
                <li id="SaleDashboard">
                    <a href="SaleDashboardController">
                        <i class="fa fa-dashboard"></i> <span>Sale Dashboard</span>
                    </a>
                </li>
                <li id="manageProduct">
                    <a href="ManageProductController">
                        <i class="fa fa-archive"></i> <span>Manage Product</span>
                    </a>
                </li>
                
            </c:if>
            <c:if test="${(sessionScope.account.role_id == 1)}">
                <li id="AdminDashboard">
                    <a href="AdminDashboardController">
                        <i class="fa fa-dashboard"></i> <span>Admin Dashboard</span>
                    </a>
                </li>
                <li id="manageAcc">
                    <a href="ManageAccountsController">
                        <i class="fa fa-users"></i> <span>Manage Account</span>
                    </a>
                </li>
            </c:if>

            <c:if test="${(sessionScope.account.role_id == 2)}">
                <li id="manageBlog">
                    <a href="BlogListTableController">
                        <i class="fa fa-book"></i> <span>Manage Blog</span>
                    </a>
                </li>
                <li id="manageBrand">
                    <a href="ManageBrandController">
                        <i class="fa fa-tags"></i> <span>Manage Brand</span>
                    </a>
                </li>
                <li id="manageCate">
                    <a href="ManageCateController">
                        <i class="fa fa-bars"></i> <span>Manage Category</span>
                    </a>
                </li>
                <li id="manageSlider">
                    <a href="ManageSliderController">
                        <i class="fa fa-picture-o"></i> <span>Manage Slider</span>
                    </a>
                </li>
            </c:if>

            <c:if test="${(sessionScope.account.role_id == 3)}">
                <li id="manageOrder">
                    <a href="ToConfirmController">
                        <i class="fa fa-clipboard"></i> <span>Manage Order</span>
                    </a>
                </li>
            </c:if>

        </ul>
    </section>
    <!-- /.sidebar -->
</aside>

