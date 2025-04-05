
<%@page import="com.tech.blog.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<%
    User user = (User) session.getAttribute("currentUser");
    String str="profile.jsp";
    if (user == null) {
//        response.sendRedirect("login_page.jsp");
        str = "index.jsp";
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry ! Something went wrong...</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">-->
        <style>
            .error_img{
                height: 50vh;
            }
        </style>
    </head>
    <body>
        <div class="container text-center"  style="height:100vh;">
            <img src="img/computer.png" alt="error" class="img-fluid error_img mb-5">
            <h3 class="display-5">Sorry! Something went wrong ...</h3>
            <p><%= exception.getMessage()%></p>
            <a class="btn primary-background  text-white mt-3" href="<%= str %>">Home</a>
        </div>
    </body>
</html>
