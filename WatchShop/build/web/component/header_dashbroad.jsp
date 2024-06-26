<%-- 
    Document   : header_dashbroad
    Created on : Oct 6, 2023, 5:00:32 PM
    Author     : datng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- header logo: style can be found in header.less -->
<header class="header">
    <a href="HomeController" class="logo" style="background-color: white">
        <!-- Add the class icon to your logo image or logo icon to add the margining -->
        <img src="img/logo-small.png" alt="alt"/>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top" role="navigation">
        <!-- Sidebar toggle button-->
        <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </a>
        <div class="navbar-right">
            <ul class="nav navbar-nav">
                <!-- Messages: style can be found in dropdown.less-->
                
                <li class="dropdown tasks-menu">
                    
<!--                    <ul class="dropdown-menu">

                        <li class="header">You have 9 tasks</li>
                        <li>
                             inner menu: contains the actual data 
                            <ul class="menu">
                                <li> Task item 
                                    <a href="#">
                                        <h3>
                                            Design some buttons
                                            <small class="pull-right">20%</small>
                                        </h3>
                                        <div class="progress progress-striped xs">
                                            <div class="progress-bar progress-bar-success" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                <span class="sr-only">20% Complete</span>
                                            </div>
                                        </div>
                                    </a>
                                </li> end task item 
                                <li> Task item 
                                    <a href="#">
                                        <h3>
                                            Create a nice theme
                                            <small class="pull-right">40%</small>
                                        </h3>
                                        <div class="progress progress-striped xs">
                                            <div class="progress-bar progress-bar-danger" style="width: 40%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                <span class="sr-only">40% Complete</span>
                                            </div>
                                        </div>
                                    </a>
                                </li> end task item 
                                <li> Task item 
                                    <a href="#">
                                        <h3>
                                            Some task I need to do
                                            <small class="pull-right">60%</small>
                                        </h3>
                                        <div class="progress progress-striped xs">
                                            <div class="progress-bar progress-bar-info" style="width: 60%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                <span class="sr-only">60% Complete</span>
                                            </div>
                                        </div>
                                    </a>
                                </li> end task item 
                                <li> Task item 
                                    <a href="#">
                                        <h3>
                                            Make beautiful transitions
                                            <small class="pull-right">80%</small>
                                        </h3>
                                        <div class="progress progress-striped xs">
                                            <div class="progress-bar progress-bar-warning" style="width: 80%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                <span class="sr-only">80% Complete</span>
                                            </div>
                                        </div>
                                    </a>
                                </li> end task item 
                            </ul>
                        </li>
                        <li class="footer">
                            <a href="#">View all tasks</a>
                        </li>

                    </ul>-->
                </li>
                <!-- User Account: style can be found in dropdown.less -->
                <li class="dropdown user user-menu">

                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-user"></i>
                        <span>${sessionScope.account.username} <i class="caret"></i></span>
                    </a>
                    <ul class="dropdown-menu dropdown-custom dropdown-menu-right">
                        <li class="dropdown-header text-center">Account</li>


                        <li class="divider"></li>

                        <li>
                            <a href="ProfileControllerV2">
                                <i class="fa fa-user fa-fw pull-right"></i>
                                Profile
                            </a>
                            <a href="PasswordControllerV2">
                                <i class="fa fa-key fa-fw pull-right"></i>
                                Change password
                            </a>
                        </li>

                        <li class="divider"></li>

                        <li>
                            <a href="LogoutController"><i class="fa fa-ban fa-fw pull-right"></i> Logout</a>
                        </li>
                    </ul>

                </li>
            </ul>
        </div>
    </nav>
</header>

