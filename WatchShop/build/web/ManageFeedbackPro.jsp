<%-- 
    Document   : ManageFeedbackPro
    Created on : Oct 17, 2023, 4:52:18 PM
    Author     : datng
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Manage Product | Watch Shop</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <meta name="description" content="Developed By M Abdur Rokib Promy">
        <meta name="keywords" content="Admin, Bootstrap 3, Template, Theme, Responsive">
        <!-- bootstrap 3.0.2 -->
        <link href="css_dashbroad/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="css_dashbroad/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="css_dashbroad/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- google font -->
        <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <!-- Theme style -->
        <link href="css_dashbroad/style.css" rel="stylesheet" type="text/css" />

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
        <style>
            td{
                text-align: center;
            }
            th{
                text-align: center;
            }
        </style>
    </head>
    <body class="skin-black">
        <jsp:include page="component/header_dashbroad.jsp"></jsp:include>
            <div class="wrapper row-offcanvas row-offcanvas-left">
            <jsp:include page="component/sidebar_dashbroad.jsp"></jsp:include>

                <!-- Right side column. Contains the navbar and content of the page -->
                <aside class="right-side">

                    <!-- Main content -->
                    <section class="content">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="panel">
                                    <header class="panel-heading">Manage Feedback of Product</header>
                                    <table class="table table-hover">
                                        <thead>
                                            <tr style="text-align: center">
                                                <th>ID</th>
                                                <th>User</th>
                                                <th>Product</th>
                                                <th>Content</th>
                                                <th>Rate Star</th>
                                                <th>Update time</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <c:forEach items="${listFeedbackPro}" var="fb">
                                                <tr>
                                                    <td>${fb.fb_id}</td>
                                                    <c:set var="user" value="${userDAO.getUserInfo(fb.user_id)}" />
                                                    <td>${user.fullName}</td>
                                                    <c:set var="pro" value="${proDAO.getProductById(fb.p_id)}" />
                                                    <td>${pro.product_name}</td>
                                                    <td>${fb.content}</td>
                                                    <td>${fb.rate_s}/5</td>
                                                    <td>${fb.update_time}</td>   
                                                    <td><a href="DeleteManageFbController?fbid=${fb.fb_id}&pid=${fb.p_id}" style="color: red; font-size: 2rem"><i class="fa fa-trash-o" onclick="return confirm('Do you want to delete this feedback ?')"></i></a></td>
                                                </tr>
                                            </c:forEach>

                                        </tbody>



                                    </table>
                                   
                                </div><!-- /.box-body -->
                                <div class="form-group text-right">
                                    <a href="ManageProductController" class="btn btn-primary" >Return</a>
                                </div>
                                 
                            </div><!-- /.box -->
                        </div>
                    </div>
                </section><!-- /.content -->
                <div class="footer-main">
                    Copyright &copy Director, 2014
                </div>
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->


        <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script src="js_dashbroad/jquery.min.js" type="text/javascript"></script>

        <!-- Bootstrap -->
        <script src="js_dashbroad/bootstrap.min.js" type="text/javascript"></script>
        <!-- Director App -->
        <script src="js_dashbroad/Director/app.js" type="text/javascript"></script>
        <script src="js_dashbroad/Director/multiple_modal.js" type="text/javascript"></script>
    </body>
</html>