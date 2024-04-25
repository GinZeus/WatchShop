<%-- 
    Document   : Edit_product
    Created on : Oct 16, 2023, 11:26:49 PM
    Author     : datng
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Edit Product Info | Watch Shop</title>
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
                                        Manage Product detail 
                                        <h4 style="color:green">${message}</h4>
                                </header>
                                <div class="panel-body table-responsive">

                                    <div class="panel-body">
                                        <form style ="padding: 0 10vw 0 0;" class="form-horizontal tasi-form" id="editProDetail" action="EditProductController" method="post" enctype="multipart/form-data" onsubmit="return confirm('Do you want to change product detail ?')">
                                            <p style="color:red; margin-left: 1rem">* : Please input in these field </p>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">ID</label>
                                                <div class="col-sm-10">
                                                    <input  type="text" class="form-control" name="p_id" value="${pro.p_id}" readonly="">  
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label required">Product name:</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" name="product_name" value="${pro.product_name}" required>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label required">Brand:</label>
                                                <div class="col-sm-4">
                                                    <select id="brand" name="brand">
                                                        <c:forEach items="${listBrand}" var="b"> 
                                                            <option value="${b.brand_id}" ${bid==b.brand_id ? "selected":""}>${b.brand_name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <label class="col-sm-2 control-label">Category</label>
                                                <div class="col-sm-4">
                                                    <c:forEach items="${listCate}" var ="c">
                                                        <input name='cate' type="checkbox" value='${c.cate_id}'}
                                                               <c:forEach items="${listMid}" var="m">${c.cate_id==m.cate_id ? "checked":""}</c:forEach>
                                                               >${c.cate_name}<br/>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label required">Quantity:</label>
                                                <div class="col-sm-2">
                                                    <input id="quantity" type="number" class="form-control" name="quantity" value="${pro.quantity}" min="1" required>
                                                    <span id="quantityError" style="color: red; display: none; font-size: 1rem">Enter positive integer value.</span>
                                                </div>
                                                <label class="col-sm-2 control-label required">Origin Price:</label>
                                                <div class="col-sm-2">
                                                    <input type="number" step="any" class="form-control" name="ori_price" value="${pro.ori_price}" min="0" required>
                                                </div>
                                                <label class="col-sm-2 control-label required">Sale Price:</label>
                                                <div class="col-sm-2">
                                                    <input type="number" step="any" class="form-control" name="sale_price" value="${pro.sale_price}" min="0" required>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Discount:</label>
                                                <div class="col-sm-4">
                                                    <input type="number" step="any" class="form-control" name="discount" value="${pro.discount}" min="0" max="100">
                                                </div>
                                                <label class="col-sm-2 control-label">Status:</label>
                                                <div class="col-sm-4">
                                                    <select id="brand" name="status">
                                                        <option value="1" ${pro.status==1 ? "selected":""}>Available</option>
                                                        <option value="2" ${pro.status==2 ? "selected":""}>Out of Stock</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Description:</label>
                                                <div class="col-sm-10">
                                                    <span id="charCount"></span>
                                                    <textarea id="des" class="form-control" rows="5" cols="40" name="des" maxlength="1000">${pd.des}</textarea>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Material:</label>
                                                <div class="col-sm-4">
                                                    <input type="text" class="form-control" name="material" value="${pd.material}">
                                                </div>
                                                <label class="col-sm-2 control-label">Width:</label>
                                                <div class="col-sm-4">
                                                    <input type="number" step="any" class="form-control" name="width" min="0" value="${pd.width}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Duration:</label>
                                                <div class="col-sm-4">
                                                    <input type="number" step="any" class="form-control" name="duration" min="0" value="${pd.duration}">
                                                </div>
                                                <label class="col-sm-2 control-label">Shape:</label>
                                                <div class="col-sm-4">
                                                    <input type="text" class="form-control" name="shape" value="${pd.shape}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label required">Thumbnail:</label>
                                                <div class="col-sm-8">
                                                    <input class="form-control" type="file" name="thumbnail" accept="image/*" id="thumbnail">
                                                    <input type="hidden" class="form-control" name="thumnail_cur" value="${pro.thumbnail}">
                                                </div>
                                                <div class="col-sm-2">
                                                    <img src="${pro.thumbnail}" alt="alt"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label required">Image 1:</label>
                                                <div class="col-sm-8">
                                                    <input class="form-control" type="file" name="image1" accept="image/*" id="image1">
                                                    <input type="hidden" class="form-control" name="image1_cur" value="${pd.image1}">
                                                </div>
                                                <div class="col-sm-2">
                                                    <img src="${pd.image1}" alt="alt"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label required">Image 2:</label>
                                                <div class="col-sm-8">
                                                    <input class="form-control" type="file" name="image2" accept="image/*" id="image2">
                                                    <input type="hidden" class="form-control" name="image2_cur" value="${pd.image2}">
                                                </div>
                                                <div class="col-sm-2">
                                                    <img src="${pd.image2}" alt="alt"/>
                                                </div>
                                            </div>
                                            <div class="form-group text-right">
                                                <!--                                                <input class="form-control" type="hidden" value="Product detail change successful !" name="message" >-->
                                                <a href="ManageProductController" class="btn btn-secondary" >Return</a>
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

                if (!isNaN(quantityValue) && Number.isInteger(quantityValue) && quantityValue > 0) {
                    quantityError.style.display = 'none';
                } else {
                    quantityError.style.display = 'block';
                    event.preventDefault();
                }
            });
        </script>
    </body>
</html>

