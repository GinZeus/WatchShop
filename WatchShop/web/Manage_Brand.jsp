<%-- 
    Document   : Manage_blog
    Created on : Oct 20, 2023, 8:25:11 AM
    Author     : hungnv
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Manage Brand | Watch Shop</title>
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
            .required::after{
            content: "*";
            color:red;
            font-size: 15px;
            }
            
            table.dataTable thead th, table.dataTable thead td, table.dataTable tfoot th, table.dataTable tfoot td{
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
                                    <header class="panel-heading">
                                        Manage Brand
                                    <c:if test="${totalBrandCount==0}">
                                        <h4 style="color:red">Number of brands: ${totalBrandCount}</h4>
                                    </c:if>
                                    <c:if test="${totalBrandCount >=1}">
                                        <h4 style="color:green">Number of brands: ${totalBrandCount}</h4>
                                    </c:if>
                                    </header>
                                    <!-- <div class="box-header"> -->
                                    <!-- <h3 class="box-title">Responsive Hover Table</h3> -->

                                    <!-- </div> -->
                                    <div class="panel-body table-responsive">
                                        <div class="box-tools m-b-15" style="display: flex; justify-content: space-between">
                                            <div class=" add-task-row">
                                                <a class="btn btn-success btn-sm pull-left" href="#addBrandModal"  data-toggle="modal" data-target="#addBrandModal">Add New Brand</a>
                                            </div>
                                        </div>
                                        <table class="display" style="width:100%"  id="brandTable">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Name</th>
                                                    <th>Address</th>
                                                    <th>Status</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                            <c:forEach items="${brandList}" var="brand">
                                                <tr style="height: 10vh;">

                                                    <td style="width: 2vw;">${brand.brand_id}</td>
                                                    <td style="width: 5vw;">${brand.brand_name}</td>
                                                    <td style="width: 5vw;">${brand.brand_address}</td>
                                                    <c:if test="${brand.brand_status ==1}">
                                                        <td style="width: 2vw;"><span class="label label-success">Available</span></td>
                                                    </c:if>
                                                    <c:if test="${brand.brand_status ==0}">
                                                        <td style="width: 2vw;"><span class="label label-danger">Disabled</span></td>
                                                    </c:if>
                                                    <td style="width: 2vw;"><a href="#editBrandModal"  data-toggle="modal" data-target="#editBrandModal" style="font-size: 2rem"
                                                                               title="View/edit brand info"
                                                                               brand_id="${brand.brand_id}"
                                                                               brand_name="${brand.brand_name}"
                                                                               brand_address="${brand.brand_address}"
                                                                               brand_status="${brand.brand_status}"><i class="fa fa-pencil"></i></a>
                                                    </td>
                                                </tr>
                                            </c:forEach>

                                        </tbody>



                                    </table>
                                                    
                                    <div class="pages text-center">
                                        <nav aria-label="Page navigation" class="d-flex justify-content-center">
                                             <ul class="pagination">
                                                <c:forEach begin="1" end="${endPage}" var="i">
                                                 <li class="page-item ${i==index?"active":"  "}"><a href="ManageBrandController?index=${i}" class="page-link">${i}</a></li>
                                                 </c:forEach>
                                             </ul>
                                        </nav>
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

        <!-- Add brand Modal -->
<div class="modal fade" id="addBrandModal" tabindex="-1" role="dialog" aria-labelledby="addBrandModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" >Add new brand</h5>
      </div>
      <div class="modal-body">
          <div class="panel-body">
              <p style="color:red; margin-left: 1rem">* : Please input in these field </p>
              <form class="form-horizontal tasi-form" id="addBrandForm" action="AddBrandController" method="post">
                  <div class="form-group">
                      <label class="col-sm-2 col-sm-2 control-label required">Name</label>
                      <div class="col-sm-10">
                          <input required pattern=".{1,100}" title="Contain 1 to 100 chatacter" type="text" class="form-control" name="brand_name">
                      </div>
                  </div>
                  <div class="form-group">
                      <label class="col-sm-2 col-sm-2 control-label required">Address</label>
                      <div class="col-sm-10">
                          <input pattern=".{1,100}" title="Contain 1 to 100 chatacter" type="text" class="form-control round-input" name="brand_address">
                      </div>
                  </div>
                  <div class="form-group">
                      <label class="col-sm-2 col-sm-2 control-label">Status</label>
                      <div class="col-sm-10">
                          <select class="form-select" aria-label="Default select example" name="brand_status">
                                <option value="1" >Available</option>
                                <option value="0" >Disabled</option>
                          </select>
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
        
        <!-- Edit brand info Modal -->
        <div class="modal fade" id="editBrandModal" tabindex="-1" role="dialog" aria-labelledby="editBrandModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit brand info</h5>
                    </div>
                    <div class="modal-body">
                        <div class="panel-body">
                            <p style="color:red; margin-left: 1rem">* : Please input in these field </p>
                            <form class="form-horizontal tasi-form" id="editBrandForm" action="EditBrandController" method="post">
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">ID</label>
                                    <div class="col-sm-10">
                                        <input disabled type="text" class="form-control" name="brand_id">
                                        <input type="hidden" class="form-control" name="brand_id">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label required">Name</label>
                                    <div class="col-sm-10">
                                        <input required pattern=".{1,100}" title="Contain 1 to 100 chatacter" type="text" class="form-control" name="brand_name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label required">Address</label>
                                    <div class="col-sm-10">
                                        <input required pattern=".{1,100}" title="Contain 1 to 100 chatacter" type="text" class="form-control round-input" name="brand_address">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">Status</label>
                                    <div class="col-sm-10">
                                        <select class="form-select" aria-label="Default select example" name="brand_status">
                                            <option value="1" >Available</option>
                                            <option value="0" >Disabled</option>
                                        </select>
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
            // SEND INFO FROM TABLE TO EDIT BRAND MODAL //
            $('#editBrandModal').on('show.bs.modal', function (e) {
            // get information to update quickly to modal view as loading begins
            var opener=e.relatedTarget;//this holds the element who called the modal
   
            //get details from table
            var brand_id=$(opener).attr('brand_id');
            var brand_name=$(opener).attr('brand_name');
            var brand_address=$(opener).attr('brand_address');
            var brand_status=$(opener).attr('brand_status');
            

            //set what we got to our form
            $('#editBrandForm').find('[name="brand_id"]').val(brand_id);
            $('#editBrandForm').find('[name="brand_name"]').val(brand_name);
            $('#editBrandForm').find('[name="brand_address"]').val(brand_address);
            $('#editBrandForm').find('[name="brand_status"]').val(brand_status);
            });
            
            
            $(document).ready(function () {
                $('#brandTable').DataTable({
                    pagingType: 'full_numbers',
                    columns: [
                        null,
                        null,
                        null,
                        null,
                        { orderable: false }
                    ]
                });
            });
            
            // change active in sidebar
            let pageStatus = document.querySelector('#manageBrand');
            pageStatus.className = "active";
            
        </script>
    </body>
</html>

