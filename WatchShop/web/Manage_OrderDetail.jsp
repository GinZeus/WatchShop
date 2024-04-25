<%-- 
    Document   : Manage_OrderDetail
    Created on : 29-10-2023, 16:57:58
    Author     : DELL
--%>



<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Watch Shop</title>
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
            .specificMessage{
                margin: 0px 0px 0px 25px;
            }
            .must{

                color: red;
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
                                        Order Details
                                    
                                </header>
                                <div class="box-header"> 
                                    <div class="nav flex-column nav-pills text-center flex-md-row btn-group-lg ">
                                        <a href="ToConfirmController" class="rounded-0 flex-sm-fill text-sm-center btn  btn-default "> <i class="fa fa-check">                     </i>To confirm</a>
                                        <a href="ToPackController" class="rounded-0 flex-sm-fill text-sm-center btn btn-default "> <i class="fa fa-inbox">                      </i>To pack</a>
                                        <a href="ToShipController" class="rounded-0 flex-sm-fill text-sm-center btn btn-default "> <i class="fa fa-truck">                  </i>To ship</a>
                                        <a href="ToReceiveController" class="rounded-0 flex-sm-fill text-sm-center btn btn-default "> <i class="fa fa-inbox">                  </i>Received</a>
                                        <a href="OrderHistoryController" class="rounded-0 flex-sm-fill text-sm-center btn btn-default "> <i class="fa fa-inbox">                  </i>History</a>
                                        
                                        <a href="CancelledController" class="rounded-0 flex-sm-fill text-sm-center btn btn-default "> <i class="fa fa-ban">                  </i>Cancelled</a>


                                    </div>
                                    <h3>Order # ${order.order_id}</h3>
                                </div> 
                                <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>Name</th>
                                                <th>Quantity</th>
                                                <th>Unit price</th>
                                                <th>Discount</th>
                                                <th>Total</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                            
                                            <c:forEach items="${listOd}" var="o">  
                                                <c:set var="p" value="${pd.getProductById(o.p_id)}"/>
                                                <tr>
                                                    <td><a href="DetailController?pid=${p.getP_id()}"><img src="${p.getThumbnail()}" style="width: 6rem"></a></td>
                                                    <td><a href="DetailController?pid=${p.getP_id()}">${p.getProduct_name()}</a></td>
                                                    <td>${o.quantity}</td>
                                                    <td>${o.price}</td>
                                                    <td>${p.getDiscount()}%</td>
                                                    <td><p style="margin: 0px"><fmt:setLocale value = "en_US"/>
                                                            <fmt:formatNumber value = "${o.i_total}" type = "currency"/>
                                                        </p></td>
                                                    
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                        <tfoot>
                                            
<!--                                            <tr>
                                                <th colspan="5" class="text-right font-weight-bold">Shipping and handling</th>
                                                <th>$10.00</th>
                                            </tr>
                                            
                                            <tr>
                                                <th colspan="5" class="text-right font-weight-bold">Total</th>
                                                <th><p style="margin: 0px">$<fmt:formatNumber type = "number" 
                                                                  maxFractionDigits = "3"  
                                                                  value = "${order.getTotal()}" 
                                                                  /></p></th>
                                            </tr>-->    
                                            <tr>
                                                <th colspan="6"></th>
                                               
                                            </tr>
                                        </tfoot>
                                    </table>
                            </div><!-- /.box -->
                        </div>
                    </div>
                </section><!-- /.content -->
               
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->
        
        

        
        

        <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script src="js_dashbroad/jquery.min.js" type="text/javascript"></script>

        <!-- Bootstrap -->
        <script src="js_dashbroad/bootstrap.min.js" type="text/javascript"></script>
        <!-- Director App -->
        <script src="js_dashbroad/Director/app.js" type="text/javascript"></script>
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.js"></script>
        
        
        <script src="//cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#toConfirmTable').DataTable({
                    pagingType: 'full_numbers',
                    columns: [

                        null,
                        null,
                        null,
                        null,
                        null

                    ]
                });
            });
            let pageStatus = document.querySelector('#Order');
            pageStatus.className = "active";
        </script>
        
    </body>
</html>



