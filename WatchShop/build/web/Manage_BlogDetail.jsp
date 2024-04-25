<%-- 
    Document   : Manage_blogDetail
    Created on : Oct 12, 2023, 8:25:11 AM
    Author     : hungnv
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Manage Blog | Watch Shop</title>
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
            form{
                padding: 0 10vw 0 0;
            }
            .required::after{
            content: "*";
            color:red;
            font-size: 15px;
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
                                    <header class="panel-heading">
                                        Blog detail 
                                        <h4 style="color:green">${message}</h4>
                                    </header>
                                    <!-- <div class="box-header"> -->
                                    <!-- <h3 class="box-title">Responsive Hover Table</h3> -->

                                    <!-- </div> -->
                                    <div class="panel-body table-responsive">
                                        <div class="box-tools m-b-15" style="display: flex; justify-content: space-between"></div>
                                            <div class="panel-body">
                                                <p style="color:red; margin-left: 1rem">* : Please input in these field </p>
                                                <form class="form-horizontal tasi-form" id="editBlogDetail" action="BlogDetailManagerController" method="post" 
                                                      onsubmit="return confirm('Do you want to change blog details ?')" enctype="multipart/form-data">
                                                    <div class="form-group">
                                                        <label class="col-sm-2 col-sm-2 control-label">ID</label>
                                                        <div class="col-sm-10">
                                                          <input disabled type="text" class="form-control" value="${BlogDetail.bdetail_id}">
                                                          <input type="hidden" class="form-control" name="bdetail_id" value="${BlogDetail.bdetail_id}">  
                                                        </div>
                                                    </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 col-sm-2 control-label required required">Header 1</label>
                                                        <div class="col-sm-10">
                                                            <input required pattern=".{1,500}" title="Contain 1 to 500 character" type="text" class="form-control" name="header1" value="${BlogDetail.header1}">
                                                        </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 col-sm-2 control-label required">Content 1</label>
                                                    <div class="col-sm-10">
                                                        <textarea required pattern=".{1,4000}" title="Contain 1 to 4000 character" class="form-control" rows="5" cols="40" name="cont1">${BlogDetail.cont1}</textarea>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 col-sm-2 control-label">Image</label>
                                                    <div class="col-sm-4">
                                                        <input class="form-control" placeholder="Image file" type="file" accept="image/*" name="image">
                                                    </div>
                                                    <div class="col-sm-6 text-center">
                                                        <img style="width:10vw; height: 15vh;" src="${BlogDetail.image}" alt="Blog_detail image">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 col-sm-2 control-label required">Header 2</label>
                                                    <div class="col-sm-10">
                                                        <input required pattern=".{1,500}" title="Contain 1 to 500 character" class="form-control" type="text" name="header2" value="${BlogDetail.header2}">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 col-sm-2 control-label required">Content 2</label>
                                                    <div class="col-sm-10">
                                                        <textarea required pattern=".{1,4000}" title="Contain 1 to 4000 character" class="form-control" rows="5" cols="40" name="cont2">${BlogDetail.cont2}</textarea>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 col-sm-2 control-label required">Conclusion</label>
                                                    <div class="col-sm-10">
                                                        <textarea required pattern=".{1,4000}" title="Contain 1 to 4000 character" class="form-control" rows="5" cols="40" name="conclusion" >${BlogDetail.conclusion}</textarea>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 col-sm-2 control-label">Status</label>
                                                    <div class="col-sm-10">
                                                        <input disabled class="form-control" type="text" name="status" value="${BlogDetail.status}">
                                                        <input  class="form-control" type="hidden" name="status" value="${BlogDetail.status}">
                                                    </div>
                                                </div>  
                                                <div class="form-group text-right">
                                                      <input class="form-control" type="hidden" value="Blog detail change successful !" name="message" >
                                                      <a href="BlogListTableController" class="btn btn-secondary" >Return</a>
                                                      <button  class="btn btn-primary">Save changes</button>
                                                </div>
                                                </form>
                                            </div>
                                </div><!-- /.box-body -->
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
    </body>
</html>

