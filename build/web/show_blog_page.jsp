
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page errorPage="error_page.jsp"  %>
<%@page import="com.tech.blog.entities.User"%>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
%>
<%
    int postId = Integer.parseInt(request.getParameter("post_id"));
    PostDao d = new PostDao();
    Post p = d.getPostByPostId(postId);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitle()%> || TechBlog by Indrajit Mali</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .post-body {
                font-size: 22px; /* Adjust as needed */
                font-weight: normal;
            }

            .card-title{
                font-size:26px
            }
            body{
                background: url(img/back.jpg);
                background-size: cover;
                background-attachment: fixed;
            }
        </style>
    </head>
    <body>
        <!-- Navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="profile.jsp"><span class="fa fa-book"></span> Tech Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contact Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal">Create Post</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Programming Language</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Projects</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Data Structure</a>
                        </div>
                    </li>


                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <!--                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                                        <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>-->
                    <ul class="navbar-nav mr-right">
                        <li class="nav-item">
                            <a class="nav-link " href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle mr-1 fa-lg"></span><%= user.getName()%></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link " href="LogoutServlet"><i class="fa fa-sign-out fa-sm"></i>Logout</a>
                        </li>
                    </ul>
                </form>
            </div>
        </nav>   

        <!--end of navbar-->

        <!--main content of body-->

        <div class="container">
            <div class="row my-4">
                <div class="col-md-8 offset-md-2">
                    <div class="card">
                        <div class="card-header ">
                            <h4 class="card-title mt-2"><%= p.getpTitle()%></h4>
                        </div>
                        <div class="card-body">
                            <div class="text-center">
                                <img class="card-img-top " style="border-radius: 5%" src="blog_pics/<%= p.getpPic()%>" alt="Post Image">
                            </div>

                            <div class="row fs-5 border-top border-bottom mt-3 pt-2 d-flex align-items-center border-box" style="">
                                <div class="col-md-8 pl-4">
                                    <%
                                        UserDao ud = new UserDao(ConnectionProvider.getConnection());
                                    %>
                                    <p><a href="#"> <%= ud.getUserByUserId(p.getUserId()).getName()%></a> has posted :</p>
                                </div>
                                <%
//                                    SimpleDateFormat sdf = new SimpleDateFormat("MMM dd, yyyy hh:mm:ss a");
                                    SimpleDateFormat sdf = new SimpleDateFormat("MMM dd, yyyy");
                                    String formattedDate = sdf.format(p.getpDate());
                                %>
                                <div class="col-md-4 h6 text-right ">
                                    <p style="font-style: italic; font-weight: bold" class="pt-1"><%= formattedDate%></p>
                                </div>
                            </div>

                            <p class="mt-4 post-body post-content"><%= p.getpContent()%></p>
                            <br>
                            <br>
                            <div class="post-code">
                                <pre><%= p.getpCode()%></pre>
                            </div>
                        </div>
                        <div class="card-footer d-flex flex-row-reverse gap-2">

                            <!--<div class="">-->
                            <% LikeDao ld = new LikeDao();%>
                            <a href="#!" onclick="doLike(<%= p.getPid()%>,<%= user.getId()%>)" class="btn btn-outline-primary btn-sm"><i class="fa like-btn <%= ld.isLikedByUser(p.getPid(), user.getId()) ? "fa-thumbs-up" : "fa-thumbs-o-up"%>"></i>
                        <span class="like-counter"><%= ld.countLikeOnPost(p.getPid())%></span></a>
                            <a href="#!" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting-o mr-1"></i><span>20</span></a>
                            <!--</div>-->
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--end of main content of body-->

        <!--Profile Modal-->


        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white text-center">
                        <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
                        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius: 50%; max-width: 150px">

                            <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName()%></h5>

                            <!--details-->

                            <div id="profile-details">
                                <table class="table custom-table">
                                    <tbody>
                                        <tr>
                                            <th scope="row">Email : </th>
                                            <td><%= user.getEmail()%></td>                                      
                                        </tr>
                                        <tr>
                                            <th scope="row">Gender : </th>
                                            <td><%= user.getGender().substring(0, 1).toUpperCase() + user.getGender().substring(1).toLowerCase()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">About : </th>
                                            <td><%= user.getAbout()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Registered On : </th>
                                            <td><%= user.getDateTime().toString()%></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!--profile edit-->

                            <div id="profile-edit" style="display: none">
                                <h5 class="mt-2">Please Edit Carefully</h5>
                                <form action="EditProfileServlet" method="POST" enctype='multipart/form-data'>
                                    <table class="table custom-table">
                                        <tr>
                                            <td>Name : </td>
                                            <td><input type="text" class="form-control" name="user_name" value="<%= user.getName()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Email : </td>
                                            <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>"></td>
                                            <td><input type="hidden" class="form-control" name="user_id" value="<%= user.getId()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Password : </td>
                                            <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>About : </td>
                                            <td>
                                                <textarea rows="3" class="form-control" name="user_about"><%= user.getAbout()%></textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Profile Pic : </td>
                                            <td>
                                                <input type="file" name="image" class="form-control" >
                                            </td>
                                        </tr>
                                    </table>
                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-primary">Save</button>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="edit-profile-btn" type="button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>


        <!--End of Profile Modal-->


        <!--add Post Model-->

        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide the post details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form  id="add-post-form" action="AddPostServlet" method="POST">
                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled="true">---Select Category</option>
                                    <%
                                        PostDao postd = new PostDao();
                                        ArrayList<Category> list = postd.getAllCategories();
                                        for (Category c : list) {


                                    %>
                                    <option value="<%= c.getCid()%>"><%= c.getName()%></option>

                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <input type="text" name="pTitle" placeholder="Enter post title" class="form-control" />
                            </div>
                            <div class="form-group">
                                <textarea placeholder="Enter your content" name="pContent" style="height:100px;" class="form-control"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea placeholder="Enter your program (if any)" name="pCode" style="height:100px;" class="form-control"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Select Your Pic : </label>
                                <input type="file" name="pic">
                            </div>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">Post</button>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                    </div>
                </div>
            </div>
        </div>

        <!--add Post Model end-->



        <script src="https://code.jquery.com/jquery-3.7.1.min.js"  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="  crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script>
                                $(document).ready(function () {
                                    let editStatus = false;
                                    $('#edit-profile-btn').click(function () {
                                        if (editStatus == false) {
                                            $('#profile-details').hide();
                                            $('#profile-edit').show();
                                            editStatus = true;
                                            $(this).text("Back");
                                        } else {
                                            $('#profile-details').show();
                                            $('#profile-edit').hide();
                                            editStatus = false;
                                            $(this).text("Edit");
                                        }
                                    });
                                });
        </script>

        <!--now add post JS-->
        <script>
            $(document).ready(function (e) {
                $("#add-post-form").on("submit", function (event) {
                    //this will run when form is submitted
                    event.preventDefault();
                    console.log("You have submitted the form");
                    let form = new FormData(this);

                    //now requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            if (data.trim() == 'done') {
                                swal("Good Job", "Saved Successfuly", "success");
                                $("#add-post-modal").hide();
                            } else {
                                swal("Error", "Something went wrong <br> try again...", "error");

                            }

                        },

                        error: function (jqXHR, textStatus, errorThrown) {
                            swal("Error", "Something went wrong <br> try again...", "error");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>
        <script>

            function doLike(pid, uid) {
                console.log(pid + ", " + uid);
                const d = {
                    uid: uid,
                    pid: pid,
                    operation: 'like'
                };

                $.ajax({
                    url: "LikeServlet",
                    data: d,
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        let c = $(".like-counter").html();
                        if (data.trim() == 'liked') {
                            c++;
                            $('.like-counter').html(c);
                            $('.like-btn').removeClass("fa-thumbs-o-up");
                            $('.like-btn').addClass("fa-thumbs-up");
                        } else if (data.trim() == "disliked") {
                            c--;
                            $('.like-counter').html(c);
                            $('.like-btn').removeClass("fa-thumbs-up");
                            $('.like-btn').addClass("fa-thumbs-o-up");
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(data);
                    }

                })
            }
        </script>
<!--        <script>
            $(document).ready(function (e) {
                console.log("ready");
                const d = {
                    uid: <%= user.getId()%>,
                    pid: <%= p.getPid()%>,
                    operation: 'checkLike'
                };

                $.ajax({
                    url: "LikeServlet",
                    data: d,
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        if (data.trim() == 'true') {
                            $('.like-btn').addClass("fa-thumbs-up");
                        } else if (data.trim() == 'false') {
                            $('.like-btn').addClass("fa-thumbs-o-up");
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(data);
                    }

                })
            });
        </script>-->
    </body>
</html>
