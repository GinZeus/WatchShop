

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                                        Manage Accounts
                                    <c:if test="${listA.size()==0}">
                                        <h4 style="color:red">Number of accounts: ${listA.size()}</h4>
                                    </c:if>
                                    <c:if test="${listA.size() >=1}">
                                        <h4 style="color:green">Number of accounts: ${listA.size()}</h4>
                                    </c:if>
                                </header>
                                <!-- <div class="box-header"> -->
                                <!-- <h3 class="box-title">Responsive Hover Table</h3> -->

                                <!-- </div> -->
                                <div class="panel-body table-responsive">
                                    <div class="box-tools m-b-15" style="display: flex; justify-content: space-between">
                                        <div class=" add-task-row">
                                            <a class="btn btn-success btn-sm pull-left" href="Add_NewAccount.jsp" >Add New Account</a>
                                        </div>
                                    </div>
                                    <table class="display" style="width:100%" id="blogTable">
                                        <thead>
                                            <tr style="text-align: center">
                                                <th>ID</th>                          
                                                <th>Username</th>
                                                <th>Email</th>
                                                <th>Role</th>
                                                <th>Status</th>
                                                <th>Create time</th>
                                                <th></th>

                                            </tr>
                                        </thead>
                                        <tbody>

                                            <c:forEach items="${listA}" var="o" >
                                                <tr >
                                                    <th>${o.acc_id}</th   ><!-- comment -->
                                                    <td>${o.username}</td>
                                                    <td>${o.email}</td><!-- comment -->
                                                    <c:if test="${o.role_id == 1}">
                                                        <td>Admin</td><!-- comment -->
                                                    </c:if>
                                                    <c:if test="${o.role_id == 2}">
                                                        <td>Manager</td><!-- comment -->
                                                    </c:if>
                                                    <c:if test="${o.role_id == 3}">
                                                        <td>Seller</td><!-- comment -->
                                                    </c:if>
                                                    <c:if test="${o.role_id == 4}">
                                                        <td>Customer</td><!-- comment -->
                                                    </c:if>
                                                    <c:if test="${o.status == 2}">
                                                        <td><span class="label label-success">Active</span></td><!-- comment -->
                                                    </c:if>
                                                    <c:if test="${o.status == 1}">
                                                        <td><span class="label label-warning">Unverified</span></td><!-- comment -->
                                                    </c:if>
                                                    <c:if test="${o.status == 0}">
                                                        <td><span class="label label-danger">Banned</span></td><!-- comment -->
                                                    </c:if>
                                                    <td>${o.create_time}</td>
                                                    <td>

                                                        <a href="ManageUserInformation?acc_id=${o.acc_id}" class="btn btn-default"><i class="fa fa-eye" title="View user information"></i></a>
                                                        <a href="#editAccountModal"  data-toggle="modal" data-target="#editAccountModal" class="btn btn-primary" 
                                                           acc_id="${o.acc_id}"
                                                           username="${o.username}"
                                                           email="${o.email}"
                                                           role_id="${o.role_id}"
                                                           ><i class="fa fa-pencil" title="Edit role"></i></a>
                                                            <c:if test="${o.status == 0 && o.role_id != 1}">
                                                            <a href="#" onclick="unbanUser(${o.acc_id}, 2)" class="btn btn-danger">Unban</a>
                                                        </c:if>
                                                        <c:if test="${o.status == 2 && o.role_id != 1}">
                                                            <a href="#" onclick="banUser(${o.acc_id}, 0)" class="btn btn-danger">Ban</a>
                                                        </c:if>    
                                                    </td>


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



        <!-- Edit blog info Modal -->
        <div class="modal fade" id="editAccountModal" tabindex="-1" role="dialog" aria-labelledby="editAccountModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit role</h5>
                    </div>
                    <div class="modal-body">
                        <div class="panel-body">
                            <form class="form-horizontal tasi-form" id="editAccountForm" action="changeRole" method="POST" onsubmit="return confirm('Change role ?')">
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">ID</label>
                                    <div class="col-sm-10">
                                        
                                        <input type="text" class="form-control" name="acc_id" readonly="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">Username</label>
                                    <div class="col-sm-10">
                                        
                                        <input type="text" class="form-control" name="username" readonly="">
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">Role</label>
                                    <div class="col-sm-10">
                                        <select class="form-select" name="role_id">
                                            <option value="1" >Admin</option>
                                            <option value="2" >Manager</option>
                                            <option value="3" >Seller</option>
                                            <option value="4"  >Customer</option>
                                        </select>
                                    </div>
                                </div>
                            
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <input type="submit" value="Save" class="btn btn-primary"></button>
                    </div>
                    </form>
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


                            // SEND INFO FROM TABLE TO EDIT BLOG MODAL //
                            $('#editAccountModal').on('show.bs.modal', function (e) {
                                
                                var opener = e.relatedTarget; 

                                var acc_id = $(opener).attr('acc_id');
                                var username = $(opener).attr('username');
                                var email = $(opener).attr('email');
                                var role_id = $(opener).attr('role_id');
                                $('#editAccountForm').find('[name="acc_id"]').val(acc_id);
                                $('#editAccountForm').find('[name="username"]').val(username);
                                $('#editAccountForm').find('[name="email"]').val(email);
                                $('#editAccountForm').find('[name="role_id"]').val(role_id).change();
                                
                            });

                            $(document).ready(function () {
                                $('#blogTable').DataTable({
                                    pagingType: 'full_numbers',
                                    columns: [

                                        null,
                                        null,
                                        {orderable: false},
                                        null,
                                        null,
                                        null,
                                        {orderable: false}

                                    ]
                                });
                            });
                            function banUser(id, status) {
                                if (confirm("Ban user #" + id + "?")) {

                                    window.location = "ChangeAccountStatus?id=" + id + "&status=" + status;

                                }
                            }
                            function unbanUser(id, status) {
                                if (confirm("Unban user #" + id + "?")) {

                                    window.location = "ChangeAccountStatus?id=" + id + "&status=" + status;

                                }
                            }

                    let pageStatus = document.querySelector('#manageAcc');
                    pageStatus.className = "active";
        </script>
    </body>
</html>


