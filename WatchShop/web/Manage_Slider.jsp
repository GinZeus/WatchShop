<%-- 
    Document   : Manage_slider
    Created on : Oct 12, 2023, 8:25:11 AM
    Author     : hungnv
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Manage Slider | Watch Shop</title>
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
                                        Manage Slider

                                    <c:if test="${totalSliderCount==0}">
                                        <h4 style="color:red">Number of sliders: ${totalSliderCount}</h4>
                                    </c:if>
                                    <c:if test="${totalSliderCount >=1}">
                                        <h4 style="color:green">Number of sliders: ${totalSliderCount}</h4>
                                    </c:if>
                                </header>
                                <!-- <div class="box-header"> -->
                                <!-- <h3 class="box-title">Responsive Hover Table</h3> -->

                                <!-- </div> -->
                                <div class="panel-body table-responsive">
                                    <div class="box-tools m-b-15" style="display: flex; justify-content: space-between">
                                        <div class=" add-task-row">
                                            <a class="btn btn-success btn-sm pull-left" href="#addSliderModal"  data-toggle="modal" data-target="#addSliderModal">Add New Slider</a>
                                        </div>
                                    </div>
                                    <table class="display" style="width:100%" id="sliderTable">
                                        
                                        <thead>
                                            <tr style="text-align: center">
                                                <th>ID</th>
                                                <th>Thumbnail</th>
                                                <th>Content</th>
                                                <th>Status</th>
                                                <th>Update_time</th>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <c:forEach items="${allSliderList}" var="slider">
                                                <tr style="height: 10vh;">

                                                    <td style="width: 2vw;">${slider.s_id}</td>
                                                    <td style="width: 10vw;"><img src="${slider.thumbnail}"></td>
                                                    <td style="width: 2vw;">${slider.content}</td>
                                                    <c:if test="${slider.status==1}">
                                                        <td style="width: 2vw;"><span class="label label-success">Available</span></td>
                                                    </c:if>
                                                    <c:if test="${slider.status==2}">
                                                        <td style="width: 2vw;"><span class="label label-warning">Disable</span></td>
                                                    </c:if>
                                                    <td style="width: 3vw;">${slider.update_time}</td>
                                                    <td style="width: 2vw;"><a href="#editSliderModal"  data-toggle="modal" data-target="#editSliderModal" style="font-size: 2rem"
                                                                               s_id="${slider.s_id}"
                                                                               slider_thumbnail="${slider.thumbnail}"
                                                                               slider_content="${slider.content}"
                                                                               slider_status="${slider.status}"
                                                                               title="View/edit slider info"><i class="fa fa-pencil"></i></a></td>
                                                    <td style="width: 2vw;"><a href="DeleteSliderController?s_id=${slider.s_id}" 
                                                                               onclick="return confirm('Do you want to delete this slider ?')" 
                                                                               style="color: red; font-size: 2rem" title="Delete slider"><i class="fa fa-trash-o"></i></a></td>

                                                </tr>
                                            </c:forEach>

                                        </tbody>



                                    </table>

                                    <div class="pages text-center">
                                        <nav aria-label="Page navigation" class="d-flex justify-content-center">
                                            <ul class="pagination">
                                                <c:forEach begin="1" end="${endPage}" var="i">
                                                    <li class="page-item ${i==index?"active":"  "}"><a href="SliderListTableController?index=${i}" class="page-link">${i}</a></li>
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

        <!-- Add slider Modal -->
        <div class="modal fade" id="addSliderModal" tabindex="-1" role="dialog" aria-labelledby="addSliderModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" >Add new slider</h5>
                    </div>
                    <div class="modal-body">
                        <div class="panel-body">
                            <p style="color:red; margin-left: 1rem">* : Please input in these field </p>
                            <form class="form-horizontal tasi-form" id="addSliderForm" action="AddSliderController" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label required">Thumbnail</label>
                                    <div class="col-sm-10">
                                        <input placeholder="Image file" type="file" accept="image/*" class="form-control round-input" required="" name="slider_thumbnail">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">Content</label>
                                    <div class="col-sm-10">
                                        <textarea required class="form-control" rows="5" cols="40" name="slider_content"></textarea>
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

        <!-- Edit slider info Modal -->
        <div class="modal fade" id="editSliderModal" tabindex="-1" role="dialog" aria-labelledby="editSliderModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit slider info</h5>
                    </div>
                    <div class="modal-body">
                        <div class="panel-body">
                            <form class="form-horizontal tasi-form" id="editSliderForm" action="EditSliderController" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">ID</label>
                                    <div class="col-sm-10">
                                        <input disabled type="text" class="form-control" name="s_id">
                                        <input type="hidden" class="form-control" name="s_id">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">Thumbnail</label>
                                    <div class="col-sm-4">
                                        <input placeholder="Image file" type="file" accept="image/*" class="form-control round-input" name="slider_thumbnail">
                                    </div>
                                    <div class="col-sm-6">
                                        <img name="slider_thumbnailShow" style="width: 10vw; height: 10vh;">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">Content</label>
                                    <div class="col-sm-10">
                                        <textarea class="form-control" rows="5" cols="40" name="slider_content"></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">Status</label>
                                    <div class="col-sm-10">
                                        <select class="form-select" aria-label="Default select example" name="slider_status">
                                            <option value="1" >Available</option>
                                            <option value="2" >Disable</option>
                                        </select>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" onclick="editSlider()" class="btn btn-primary">Save changes</button>
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
                            function editSlider() {
                                document.getElementById('editSliderForm').submit();
                            }

                            // SEND INFO FROM TABLE TO EDIT BLOG MODAL //
                            $('#editSliderModal').on('show.bs.modal', function (e) {
                                // get information to update quickly to modal view as loading begins
                                var opener = e.relatedTarget;//this holds the element who called the modal

                                //get details from table
                                var s_id = $(opener).attr('s_id');
                                var slider_thumbnail = $(opener).attr('slider_thumbnail');
                                var slider_content = $(opener).attr('slider_content');
                                var slider_status = $(opener).attr('slider_status');


                                //set what we got to our form
                                $('#editSliderForm').find('[name="s_id"]').val(s_id);
                                $('#editSliderForm').find('[name="slider_thumbnailShow"]').attr("src", slider_thumbnail);
                                $('#editSliderForm').find('[name="slider_content"]').val(slider_content);
                                $('#editSliderForm').find('[name="slider_status"]').val(slider_status);
                            });

                            $(document).ready(function () {
                                $('#sliderTable').DataTable({
                                    pagingType: 'full_numbers',
                                    columns: [
                                        null,
                                        null,
                                        null,
                                        null,
                                        null,
                                        {orderable: false},
                                        {orderable: false}
                                    ]
                                });
                            });

                            // change active in sidebar
                            let pageStatus = document.querySelector('#manageSlider');
                            pageStatus.className = "active";
        </script>
    </body>
</html>