<%-- 
    Document   : Manage_ToShip
    Created on : 29-10-2023, 16:29:37
    Author     : DELL
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
                                        Manage Orders
                                    <c:if test="${listO.size()==0}">
                                        <h4 style="color:red">Number of orders: ${listO.size()}</h4>
                                    </c:if>
                                    <c:if test="${listO.size() >=1}">
                                        <h4 style="color:green">Number of orders: ${listO.size()}</h4>
                                    </c:if>
                                </header>
                                <div class="box-header"> 
                                    <div class="nav flex-column nav-pills text-center flex-md-row btn-group-lg ">
                                        <a href="ToConfirmController" class="rounded-0 flex-sm-fill text-sm-center btn  btn-default "> <i class="fa fa-check">                     </i>To confirm</a>
                                        <a href="ToPackController" class="rounded-0 flex-sm-fill text-sm-center btn btn-default "> <i class="fa fa-inbox">                      </i>To pack</a>
                                        <a href="ToShipController" class="rounded-0 flex-sm-fill text-sm-center btn btn-default "> <i class="fa fa-truck">                  </i>To ship</a>
                                        <a href="ToReceiveController" class="rounded-0 flex-sm-fill text-sm-center btn btn-default "> <i class="fa fa-inbox">                  </i>Received</a>
                                        <a href="OrderHistoryController" class="rounded-0 flex-sm-fill text-sm-center btn btn-default "> <i class="fa fa-inbox">                  </i>History</a>

                                        <a href="CancelledController" class="rounded-0 flex-sm-fill text-sm-center btn btn-default active "> <i class="fa fa-ban">                  </i>Cancelled</a>


                                    </div>

                                </div> 
                                <div class="panel-body table-responsive">

                                    <table class="table table-hover" id="toConfirmTable">
                                        <thead>
                                            <tr>
                                                <th>Order</th>

                                                <th>Name</th>
                                                <th>Status</th>
                                                <th>Date</th>

                                                <th >Total</th>


                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listO}" var="o">
                                                <tr>
                                                    <th># ${o.order_id}</th>
                                                    <td> ${o.fullName} </td>
                                                    <td><p class="badge badge-danger">Cancelled</p></td>
                                                    <td>${o.order_date}</td>

                                                    <td>$ ${o.total}</td>

                                                    <td><a href="OrderDetailController?o_id=${o.order_id}" class="btn btn-default btn-sm"><i class="fa fa-eye"></i></a>
                                                        
                              
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>

                                    

                                </div><!-- /.box-body -->
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
        <script>
                                                $('#editOrderModal').on('show.bs.modal', function (e) {

                                                    var opener = e.relatedTarget;


                                                    var order_id = $(opener).attr('order_id');
                                                    var fullName = $(opener).attr('fullname');
                                                    var phoneNumber = $(opener).attr('email');
                                                    var order_date = $(opener).attr('order_date');
                                                    var email = $(opener).attr('address');
                                                    var note = $(opener).attr('note');
                                                    var address = $(opener).attr('phoneNumber');


                                                    $('#editOrderForm').find('[name="order_id"]').val(order_id);
                                                    $('#editOrderForm').find('[name="fullname"]').val(fullName);
                                                    $('#editOrderForm').find('[name="phone_number"]').val(phoneNumber);
                                                    $('#editOrderForm').find('[name="email"]').val(email);
                                                    $('#editOrderForm').find('[name="address"]').val(address);  
                                                    $('#editOrderForm').find('[name="order_date"]').val(order_date);
                                                    $('#editOrderForm').find('[name="note"]').val(note);

                                                });
        </script>
        <script>
            function removeAscent(str) {
                if (str === null || str === undefined)
                    return str;
                str = str.toLowerCase();
                str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, "a");
                str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, "e");
                str = str.replace(/ì|í|ị|ỉ|ĩ/g, "i");
                str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, "o");
                str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, "u");
                str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, "y");
                str = str.replace(/đ/g, "d");
                return str;
            }

            function validateOrder() {
                var phoneNumber = document.forms["editOrderForm"]["phone_number"].value;
                var fullName = document.forms["editOrderForm"]["fullname"].value;
                fullName = removeAscent(fullName);
                var address = document.forms["editOrderForm"]["address"].value;
                address = removeAscent(address);
                var phoneRegex = /((09|03|07|08|05)+([0-9]{8})\b)/g;
                var letterRegex = /^[a-zA-Z0-9 ]{6,25}$/;
                var addressRegex = /^[a-zA-Z0-9 , ]{3,30}$/;

                if (letterRegex.test(fullName) && phoneRegex.test(phoneNumber) && addressRegex.test(address)) {

                    document.getElementById("editOrderForm").submit();

                } else {
                    event.preventDefault();
                    if (!letterRegex.test(fullName)) {
                        document.querySelector("#fullNameMessage").innerHTML = "Full name must contain only letter and length must be  from 6 to 25";
                        document.querySelector("#fullNameMessage").style.color = "red";
                    } else {
                        document.querySelector("#fullNameMessage").innerHTML = "";
                    }

                    if (!phoneRegex.test(phoneNumber)) {
                        document.querySelector("#phoneMessage").innerHTML = "Phone number is not valid, must be (+84) format";
                        document.querySelector("#phoneMessage").style.color = "red";
                    } else {
                        document.querySelector("#phoneMessage").innerHTML = "";
                    }

                    if (!addressRegex.test(address)) {
                        document.querySelector("#addressMessage").innerHTML = "Address must contain 6 to 30 characters including letter and (,)";
                        document.querySelector("#addressMessage").style.color = "red";
                    } else {
                        document.querySelector("#addressMessage").innerHTML = "";
                    }
                }
            }




        </script>
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
                        null,
                        {orderable: false}

                    ]
                });
            });
            let pageStatus = document.querySelector('#Order');
            pageStatus.className = "active";
        </script>
        
    </body>
</html>





