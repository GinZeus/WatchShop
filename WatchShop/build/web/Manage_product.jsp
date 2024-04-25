<%-- 
    Document   : Manage_product
    Created on : Oct 6, 2023, 3:25:11 PM
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
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css" />
        <style>
            td{
                text-align: center;
            }
            th{
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
                                    <header class="panel-heading">Manage Products</header>
                                    <div class="panel-body table-responsive">
                                        <div class="box-tools m-b-15" style="display: flex; justify-content: space-between">
                                        <c:if test="${(sessionScope.account.role_id == 2)}">
                                            <div class=" add-task-row">
                                                <a class="btn btn-success btn-sm pull-left" data-toggle="modal" data-target="#addProduct">Add New Product</a>
                                            </div>
                                        </c:if>

                                    </div>
                                    <table class="display" style="width:100%" id="manageProductTable">
                                        <thead>
                                            <tr style="text-align: center">
                                                <th>ID</th>
                                                <th>Image</th>
                                                <th>Name</th>
                                                <th>Brand</th>
                                                <th>Quantity</th>
                                                <th>Origin Price</th>
                                                <th>Sale Price</th>
                                                <th>Discount</th>
                                                <th>Status</th>
                                                <th>Update_time</th>
                                                <th>Feedback</th>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <c:forEach items="${listAllPro}" var="pro">
                                                <tr>

                                                    <td>${pro.p_id}</td>
                                                    <td><img src="${pro.thumbnail}" alt="${pro.product_name}" style="width: 10rem"></td>
                                                    <td style="max-width: 10rem">${pro.product_name}</td>
                                                    <c:set var="brand" value="${brandDAO.getBrandById(pro.brand_id)}" />
                                                    <td><c:out value="${brand.brand_name}" /></td>
                                                    <td>${pro.quantity}</td>
                                                    <td>$${pro.ori_price}</td>
                                                    <td>$${pro.sale_price}</td>
                                                    <td>${pro.discount}%</td>
                                                    <c:if test="${pro.status==1}">
                                                        <td><span class="label label-success">Available</span></td>
                                                    </c:if>
                                                    <c:if test="${pro.status==2}">
                                                        <td><span class="label label-warning">Out of Stock</span></td>
                                                    </c:if>
                                                    <td>${pro.update_time}</td>
                                                    <td><a href="ManageFeedbackController?pid=${pro.p_id}">Feedback</a></td>
                                                    <td><c:if test="${(sessionScope.account.role_id == 2)}"><a href="EditProductController?pid=${pro.p_id}" style="font-size: 2rem"><i class="fa fa-pencil"></i></a></c:if></td>
                                                    <td><c:if test="${(sessionScope.account.role_id == 2)}"><a href="DeleteProductController?pid=${pro.p_id}" style="color: red; font-size: 2rem"><i class="fa fa-trash-o" onclick="return confirm('Do you want to delete this product ?')"></i></a></c:if></td>

                                                </tr>
                                            </c:forEach>

                                        </tbody>
                                    </table>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
                        </div>
                        <div class="modal fade" id="addProduct" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <form action="AddProductController" method="post" enctype="multipart/form-data">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Add Product</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>

                                        <div class="modal-body">
                                            <div class="container-fluid">
                                                <div class="row">
                                                    <p style="color:red; margin-left: 1rem">* : Please input in these field </p>
                                                    <div class="col-md-12">
                                                        <label for="product_name" class="col-form-label required">Product name</label>
                                                        <input name="product_name" type="text" class="form-control" id="product_name" required>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label for="brand" class="col-form-label">Brand:</label> <br/>
                                                        <select id="brand" name="brand">
                                                            <c:forEach items="${listBrand}" var="b">
                                                                <option value="${b.brand_id}">${b.brand_name}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>    
                                                    <div class="col-md-6">
                                                        <label for="cate" class="col-form-label">Category:</label><br/>
                                                        <c:forEach items="${listCate}" var ="c">
                                                            <input name='cate' type="checkbox" value='${c.cate_id}'}>${c.cate_name}<br/>
                                                        </c:forEach>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <label for="ori_price" class="col-form-label required">Origin Price</label>
                                                        <input name="ori_price" step="any" type="number" class="form-control" id="ori_price" required min="0">
                                                    </div>
                                                    <div class="col-md-4">
                                                        <label for="sale_price" class="col-form-label required">Sale Price</label>
                                                        <input name="sale_price" step="any" type="number" class="form-control" id="sale_price" required min="0">
                                                    </div>
                                                    <div class="col-md-4">
                                                        <label for="discount" class="col-form-label">Discount</label>
                                                        <input name="discount" type="number" class="form-control" id="discount" min="0" max="100">
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label for="material" class="col-form-label">Material</label>
                                                        <input name="material" type="text" class="form-control" id="material">
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label for="quantity" class="col-form-label required">Quantity</label> <span id="quantityError" style="color: red; display: none; font-size: 1rem; float: inline-end; padding-top: 5px">Enter a positive integer value.</span>
                                                        <input name="quantity" type="number" class="form-control" id="quantity" min="1" required>

                                                    </div>
                                                    <div class="col-md-12">
                                                        <label for="des" class="col-form-label">Description</label>
                                                        <span id="charCount" style="float: inline-end;"></span>
                                                        <textarea rows="4" class="form-control" id="des" name="des" maxlength="1000"></textarea>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <label for="width" class="col-form-label">Width (mm)</label>
                                                        <input name="width" step="any" type="number" class="form-control" id="width" min="0">
                                                    </div>
                                                    <div class="col-md-4">
                                                        <label for="shape" class="col-form-label">Shape</label>
                                                        <input name="shape" type="text" class="form-control" id="shape">
                                                    </div>
                                                    <div class="col-md-4">
                                                        <label for="duration" class="col-form-label">Duration (hour)</label>
                                                        <input name="duration" step="any" type="number" class="form-control" id="duration" min="0">
                                                    </div>

                                                    <div class="col-md-12">
                                                        <label for="thumbnail" class="col-form-label required">Thumbnail</label>
                                                        <input class="form-control" type="file" name="thumbnail" accept="image/*" required id="thumbnail">
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label for="image1" class="col-form-label required">Image 1</label>
                                                        <input class="form-control" type="file" name="image1" accept="image/*" required id="image1">
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label for="image2" class="col-form-label required">Image 2</label>
                                                        <input class="form-control" type="file" name="image2" accept="image/*" required id="image2">
                                                    </div>

                                                </div>
                                            </div>


                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-primary">Add Product</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
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
        <script>
                                                        const textarea = document.getElementById('des');
                                                        const charCount = document.getElementById('charCount');
                                                        const charLimitError = document.getElementById('charLimitError');

                                                        textarea.addEventListener('input', function () {
                                                            const inputText = this.value;
                                                            const remainingChars = 1000 - inputText.length;
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
            const quantityInput = document.getElementById('quantity');
            const quantityError = document.getElementById('quantityError');

            quantityInput.addEventListener('input', function () {
                const quantityValue = parseInt(this.value);

                if (Number.isInteger(quantityValue) && quantityValue > 0) {
                    quantityError.style.display = 'none';
                } else {
                    quantityError.style.display = 'block';
                    event.preventDefault();
                }
            });
        </script>
        <script src="//cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#manageProductTable').DataTable({
                    pagingType: 'full_numbers',
                    columns: [

                        null,
                        {orderable: false},
                        null,
                        null,
                        null,
                        null,
                        null,
                        null,
                        {orderable: false},
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
            let pageStatus = document.querySelector('#manageProduct');
            pageStatus.className = "active";
        </script>

    </body>
</html>

