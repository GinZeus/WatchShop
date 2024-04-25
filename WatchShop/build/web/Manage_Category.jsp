<%-- 
    Document   : Manage_Category
    Created on : Oct 29, 2023, 5:21:58 PM
    Author     : datng
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Manage Category | Watch Shop</title>
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

        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css" />

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
        <style>
            td{
                text-align: center;
                max-width: 10vw;
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
            }
            th{
                text-align: center;
            }

            table.dataTable thead th, table.dataTable thead td, table.dataTable tfoot th, table.dataTable tfoot td{
                text-align: center;
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
                                    <header class="panel-heading">Manage Category<h4 style="${totalCateCount >0 ? "color: green;":"color: red;"}">Number of categories: ${totalCateCount}</h4></header>

                                <!-- </div> -->
                                <div class="panel-body table-responsive">
                                    <div class="box-tools m-b-15" style="display: flex; justify-content: space-between">
                                        <div class=" add-task-row">
                                            <a class="btn btn-success btn-sm pull-left" href="#addCateModal"  data-toggle="modal" data-target="#addCateModal">Add New Category</a>
                                        </div>
                                    </div>
                                    <table class="display" style="width:100%"  id="cateTable">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Category Name</th>
                                                <th>Status</th>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <c:forEach items="${cateList}" var="cate">
                                                <tr style="height: 10vh;">

                                                    <td >${cate.cate_id}</td>
                                                    <td >${cate.cate_name}</td>
                                                    <td><span class="label label-success">Available</span></td>
                                                    <td><a href="#editCateModal"  data-toggle="modal" data-target="#editCateModal" style="font-size: 2rem"
                                                           title="View/edit Category info"
                                                           cate_id="${cate.cate_id}"
                                                           cate_name="${cate.cate_name}">
                                                            <i class="fa fa-pencil"></i></a></td>
                                                    <td><a href="DeleteCateController?cate_id=${cate.cate_id}" 
                                                           onclick="return confirm('Do you want to delete this category ?')" 
                                                           style="color: red; font-size: 2rem" title="Delete Cate"><i class="fa fa-trash-o"></i></a></td>
                                                </tr>
                                            </c:forEach>

                                        </tbody>



                                    </table>

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

        <!-- Add cate Modal -->
        <div class="modal fade" id="addCateModal" tabindex="-1" role="dialog" aria-labelledby="addCateModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" >Add new category</h5>
                    </div>
                    <div class="modal-body">
                        <div class="panel-body">
                            <p style="color:red; margin-left: 1rem">* : Please input in these field </p>
                            <form class="form-horizontal tasi-form" id="addCateForm" action="AddCateController" method="post">
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label required">Category Name</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="cate_name" required="">
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary">Add</button>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <!-- Edit cate info Modal -->
        <div class="modal fade" id="editCateModal" tabindex="-1" role="dialog" aria-labelledby="editCateModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit category info</h5>
                    </div>
                    <div class="modal-body">
                        <div class="panel-body">

                            <form class="form-horizontal tasi-form" id="editCateForm" action="EditCateController" method="post">
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">ID</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="cate_id" readonly="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">Name</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="cate_name" required="">
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary">Save changes</button>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script src="js_dashbroad/jquery.min.js" type="text/javascript"></script>

        <!-- Bootstrap -->
        <script src="js_dashbroad/bootstrap.min.js" type="text/javascript"></script>
        <!-- Director App -->
        <script src="js_dashbroad/Director/app.js" type="text/javascript"></script>
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.js"></script>
        <script>

                                        // SEND INFO FROM TABLE TO EDIT cate MODAL //
                                        $('#editCateModal').on('show.bs.modal', function (e) {
                                            // get information to update quickly to modal view as loading begins
                                            var opener = e.relatedTarget;//this holds the element who called the modal

                                            //get details from table
                                            var cate_id = $(opener).attr('cate_id');
                                            var cate_name = $(opener).attr('cate_name');


                                            //set what we got to our form
                                            $('#editCateForm').find('[name="cate_id"]').val(cate_id);
                                            $('#editCateForm').find('[name="cate_name"]').val(cate_name);
                                        });


                                        $(document).ready(function () {
                                            $('#cateTable').DataTable({
                                                pagingType: 'full_numbers',
                                                columns: [
                                                    null,
                                                    null,
                                                    {orderable: false},
                                                    {orderable: false},
                                                    {orderable: false}
                                                ]
                                            });
                                        });
        </script>
        <script>
            // change active in sidebar
            let pageStatus = document.querySelector('#mangeCate');
            pageStatus.className = "active";
        </script>
    </body>
</html>