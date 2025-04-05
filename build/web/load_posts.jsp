<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.User"%>
<div class="row">
    <%
        User user = (User) session.getAttribute("currentUser");
        if (user == null) {
            response.sendRedirect("login_page.jsp");
        }
    %>
    <%
//        Thread.sleep(500);
        PostDao d = new PostDao();

        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Post> posts = null;
        if (cid == 0) {
            posts = d.getAllPosts();
        } else {
            posts = d.getPostByCatId(cid);
        }

        if (posts.size() == 0) {
            out.println("<div class='container text-center'><h3 class='display-3 text-center'>No Posts in this category...</h3></div>");
            return;
        }

        for (Post p : posts) {
    %>
    <div class="col-md-3 mt-2 load-post-card">
        <div class="card">
            <img class=""card-img-top" src="blog_pics/<%= p.getpPic()%>" alt="img">
            <div class="card-body">
                <b><%= p.getpTitle()%></b>
                <p><%= p.getpContent()%></p>
            </div>
            <div class="card-footer d-flex justify-content-between">
                <a href="show_blog_page.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-primary btn-sm">Read More</a>
                <div class="">

                    <% LikeDao ld = new LikeDao();%>
                    <a href="#!" onclick="doLike(<%= p.getPid()%>,<%= user.getId()%>, this)" 
                       class="btn btn-outline-primary btn-sm">
                        <i class="fa like-btn <%= ld.isLikedByUser(p.getPid(), user.getId()) ? "fa-thumbs-up" : "fa-thumbs-o-up"%>"></i>
                        <span class="like-counter"><%= ld.countLikeOnPost(p.getPid())%></span>
                    </a>
                    <a href="#!" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting-o mr-1"></i><span>20</span></a>
                </div>
            </div>
        </div>
    </div>

    <!--    <script>
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
                        if (data.trim() == 'true' && pid==<%= p.getPid()%>) {
                            $('.like-btn').addClass("fa-thumbs-up");
                        } else if (data.trim() == 'false') {
                            $('.like-btn').addClass("fa-thumbs-o-up");
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(data);
                    }
    
                });
    //            d={};
            });
        </script> -->

    <%
        }

    %>
</div>
<script>
    function doLike(pid, uid, element) {
        const d = {
            uid: uid,
            pid: pid,
            operation: 'like'
        };

        $.ajax({
            url: "LikeServlet",
            data: d,
            success: function (data, textStatus, jqXHR) {
                let $btn = $(element).find('.like-btn');
                let $counter = $(element).find('.like-counter');
                let currentCount = parseInt($counter.html());

                if (data.trim() === 'liked') {
                    $counter.html(currentCount + 1);
                    $btn.removeClass('fa-thumbs-o-up').addClass('fa-thumbs-up');
                } else if (data.trim() === 'disliked') {
                    $counter.html(currentCount - 1);
                    $btn.removeClass('fa-thumbs-up').addClass('fa-thumbs-o-up');
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log("Error: " + textStatus);
            }
        });
    }
</script>