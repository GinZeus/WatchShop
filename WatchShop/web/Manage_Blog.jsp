<%-- 
    Document   : Manage_blog
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
                                        Manage Blog
                                       
                                    <c:if test="${totalBlogCount==0}">
                                        <h4 style="color:red">Number of blogs: ${totalBlogCount}</h4>
                                    </c:if>
                                    <c:if test="${totalBlogCount >=1}">
                                        <h4 style="color:green">Number of blogs: ${totalBlogCount}</h4>
                                    </c:if>
                                    </header>
                                    <!-- <div class="box-header"> -->
                                    <!-- <h3 class="box-title">Responsive Hover Table</h3> -->

                                    <!-- </div> -->
                                    <div class="panel-body table-responsive">
                                        <div class="box-tools m-b-15" style="display: flex; justify-content: space-between">
                                            <div class=" add-task-row">
                                                <a class="btn btn-success btn-sm pull-left" href="#addBlogModal"  data-toggle="modal" data-target="#addBlogModal">Add New Blog</a>
                                            </div>
                                        </div>
                                        <table class="display" style="width:100%" id="blogTable">
                                            <thead>
                                                <tr style="text-align: center">
                                                    <th>ID</th>
                                                    <th></th>
                                                    <th>Title</th>
                                                    <th>Intro</th>
                                                    <th>Author</th>
                                                    <th>Status</th>
                                                    <th>Update_time</th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                            <c:forEach items="${blogList}" var="blog">
                                                <tr style="height: 10vh;">

                                                    <td style="width: 2vw;">${blog.blog_id}</td>
                                                    <td style="width: 10vw;"><img src="${blog.thumbnail}" alt="${blog.title}" style="width: 10vw; height: 10vh;"></td>
                                                    <td style="width: 5vw;">${blog.title}</td>
                                                    <td style="width: 10vw;">${blog.intro}</td>
                                                    <td style="width: 5vw;">${blog.author}</td>
                                                    <c:if test="${blog.status==1}">
                                                        <td style="width: 2vw;"><span class="label label-success">Available</span></td>
                                                    </c:if>
                                                    <c:if test="${blog.status==2}">
                                                        <td style="width: 2vw;"><span class="label label-warning">Hidden</span></td>
                                                    </c:if>
                                                    <td style="width: 3vw;">${blog.update_time}</td>
                                                    <td style="width: 2vw;"><a href="#editBlogModal"  data-toggle="modal" data-target="#editBlogModal" style="font-size: 2rem"
                                                                               blog_id="${blog.blog_id}"
                                                                               blog_thumbnail="${blog.thumbnail}"
                                                                               blog_title="${blog.title}"
                                                                               blog_intro="${blog.intro}"
                                                                               blog_author="${blog.author}"
                                                                               blog_status="${blog.status}"
                                                                               title="View/edit blog info"><i class="fa fa-pencil"></i></a></td>
                                                    <td style="width: 2vw;"><a href="BlogDetailManagerController?blog_id=${blog.blog_id}" 
                                                                               style="font-size: 2rem" title="View/edit blog detail"><i class="fa fa-info"></i></a></td>
                                                    <td style="width: 2vw;"><a href="DeleteBlogController?blog_id=${blog.blog_id}" 
                                                                               onclick="return confirm('Do you want to delete this blog ?')" 
                                                                               style="color: red; font-size: 2rem" title="Delete blog"><i class="fa fa-trash-o"></i></a></td>
                                                    
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

        <!-- Add blog Modal -->
<div class="modal fade" id="addBlogModal" tabindex="-1" role="dialog" aria-labelledby="addBlogModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" >Add new blog</h5>
      </div>
      <div class="modal-body">
          <div class="panel-body">
              <p style="color:red; margin-left: 1rem">* : Please input in these field </p>
              <form class="form-horizontal tasi-form" id="addBlogForm" name="addBlogForm" action="AddBlogController" method="post" enctype="multipart/form-data">
                  <div class="form-group">
                      <label class="col-sm-2 col-sm-2 control-label required">Title</label>
                      <div class="col-sm-10">
                          <input required pattern=".{1,500}" title="Contain 1 to 500 character" type="text" class="form-control" name="title">
                      </div>
                  </div>
                  <div class="form-group">
                      <label class="col-sm-2 col-sm-2 control-label required">Thumbnail</label>
                      <div class="col-sm-10">
                          <input required placeholder="Image file" type="file" accept="image/*" class="form-control round-input" name="thumbnail">
                      </div>
                  </div>
                  <div class="form-group">
                      <label class="col-sm-2 col-sm-2 control-label required">Intro</label>
                      <div class="col-sm-10">
                          <textarea required pattern=".{1,4000}" title="Contain 1 to 4000 character" class="form-control" rows="5" cols="40" name="intro"></textarea>
                      </div>
                  </div>
                  <div class="form-group">
                      <label class="col-sm-2 col-sm-2 control-label required">Author</label>
                      <div class="col-sm-10">
                          <input required pattern=".{1,50}" title="Contain 1 to 50 character" class="form-control" type="text" name="author">
                      </div>
                  </div>
                  <div class="form-group">
                      <label class="col-sm-2 col-sm-2 control-label">Status</label>
                      <div class="col-sm-10">
                          <select class="form-select" aria-label="Default select example" name="status">
                                <option value="1" >Available</option>
                                <option value="2" >Hidden</option>
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
        
        <!-- Edit blog info Modal -->
        <div class="modal fade" id="editBlogModal" tabindex="-1" role="dialog" aria-labelledby="editBlogModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit blog info</h5>
                    </div>
                    <div class="modal-body">
                        <div class="panel-body">
                            <p style="color:red; margin-left: 1rem">* : Please input in these field </p>
                            <form class="form-horizontal tasi-form" id="editBlogForm" action="EditBlogInfoController" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">ID</label>
                                    <div class="col-sm-10">
                                        <input disabled type="text" class="form-control" name="id">
                                        <input required type="hidden" class="form-control" name="id">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label required">Title</label>
                                    <div class="col-sm-10">
                                        <input required pattern=".{1,500}" title="Contain 1 to 500 character" type="text" class="form-control" name="title">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">Thumbnail</label>
                                    <div class="col-sm-4">
                                        <input placeholder="Image file" type="file" accept="image/*" class="form-control round-input" name="thumbnail">
                                    </div>
                                    <div class="col-sm-6">
                                        <img name="thumbnailShow" style="width: 10vw; height: 10vh;">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label required">Intro</label>
                                    <div class="col-sm-10">
                                        <textarea required pattern=".{1,4000}" title="Contain 1 to 4000 character" class="form-control" rows="5" cols="40" name="intro"></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label required">Author</label>
                                    <div class="col-sm-10">
                                        <input required pattern=".{1,50}" title="Contain 1 to 50 character" class="form-control" type="text" name="author">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">Status</label>
                                    <div class="col-sm-10">
                                        <select class="form-select" aria-label="Default select example" name="status">
                                            <option value="1" >Available</option>
                                            <option value="2" >Hidden</option>
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
            
            // SEND INFO FROM TABLE TO EDIT BLOG MODAL //
            $('#editBlogModal').on('show.bs.modal', function (e) {
            // get information to update quickly to modal view as loading begins
            var opener=e.relatedTarget;//this holds the element who called the modal
   
            //get details from table
            var blog_id=$(opener).attr('blog_id');
            var blog_intro=$(opener).attr('blog_intro');
            var blog_title=$(opener).attr('blog_title');
            var blog_thumbnail=$(opener).attr('blog_thumbnail');
            var blog_author=$(opener).attr('blog_author');
            var blog_status=$(opener).attr('blog_status');
            

            //set what we got to our form
            $('#editBlogForm').find('[name="id"]').val(blog_id);
            $('#editBlogForm').find('[name="title"]').val(blog_title);
            $('#editBlogForm').find('[name="intro"]').val(blog_intro);
            $('#editBlogForm').find('[name="thumbnailShow"]').attr("src",blog_thumbnail);
            $('#editBlogForm').find('[name="author"]').val(blog_author);
            $('#editBlogForm').find('[name="status"]').val(blog_status);
            });
            
             $(document).ready(function () {
                $('#blogTable').DataTable({
                    pagingType: 'full_numbers',
                    columns: [
                        null,
                        { orderable: false },
                        null,
                        null,
                        null,
                        null,
                        null,
                        { orderable: false },
                        { orderable: false },
                        { orderable: false }
                    ]
                });
            });
            
            // change active in sidebar
            let pageStatus = document.querySelector('#manageBlog');
            pageStatus.className = "active";
        </script>
    </body>
</html>

