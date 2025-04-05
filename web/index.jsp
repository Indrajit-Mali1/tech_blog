<%-- 
    Document   : index
    Created on : Mar 13, 2025, 10:29:05 AM
    Author     : Indrajit
--%>

<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!--css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            body {
                zoom: 80%; /* Set zoom level to 80% */
            }
        </style>
    </head>
    <body>

        <!--Navbar-->
        <%@include file="normal_navbar.jsp" %>

        <!--banner-->
        <div class="container-fluid m-0 p-0 ">
            <div class="jumbotron primary-background text-white rounded-0 pl-3 pr-3 pb-0 pt-3 mb-0" style="z-index:10; ">
                <div class="container">
                    <h3 class="display-4">Welcome to TechBlog</h3>
                    <p>Explore the latest trends, insights, and innovations in the world of technology. Stay updated with expert articles, tutorials, and discussions on everything tech!</p>
                    <p class="pb-2">At TechBlog, we bring you in-depth analysis, cutting-edge news, and step-by-step guides on emerging technologies, software development, AI, cybersecurity, and more. Whether you're a tech enthusiast, a developer, or just curious about the digital world, you'll find valuable content to enhance your knowledge and keep you ahead in the fast-evolving tech landscape.</p>
                    <button class="btn btn-outline-light btn-lg "><span class="fa fa-external-link mr-1 "></span>Start! Its Free</button>
                    <a href="login_page.jsp" class="ml-3 btn btn-outline-light btn-lg"><span class="fa fa-sign-in mr-1"></span>Login</a>
                </div>

            </div>
            <div style="position: relative;  z-index: 0;">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 100"><path fill="#000000" fill-opacity="1" d="M0,64L60,69.3C120,75,240,85,360,90.7C480,96,600,96,720,90.7C840,85,960,75,1080,74.7C1200,75,1320,85,1380,90.7L1440,96L1440,0L1380,0C1320,0,1200,0,1080,0C960,0,840,0,720,0C600,0,480,0,360,0C240,0,120,0,60,0L0,0Z"></path></svg>
            </div>


        </div>

        <!--cards-->
        <div class="container" style="margin-top:10px; top:-200px">
            <div class="row mb-3">
                <div class="col-md-4">
                    <div class="card" style="border: 1px solid; background-color: #EEEEEE;">
                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background text-white">Go somewhere</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" style="border: 1px solid; background-color: #EEEEEE;">

                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background text-white">Go somewhere</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" style="border: 1px solid; background-color: #EEEEEE;">

                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background text-white">Go somewhere</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="card" style="border: 1px solid; background-color: #EEEEEE;">

                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background text-white">Go somewhere</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" style="border: 1px solid; background-color: #EEEEEE;">

                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background text-white">Go somewhere</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" style="border: 1px solid; background-color: #EEEEEE;">

                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background text-white">Go somewhere</a>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <!--scripts-->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="  crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>

    </body>
</html>
