<%-- 
    Document   : register_page
    Created on : Mar 13, 2025, 11:17:59 PM
    Author     : Indrajit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!--css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <style>
            body {
                zoom: 80%; /* Set zoom level to 80% */
            }
            .myform{
                font-size: 14px
            }
            ;
            .myform input {
                font-size: inherit; /* This makes the input inherit from the div */
            }
            ;

        </style>

    </head>
    <body>
        <%@include file="normal_navbar.jsp"  %>
        <main class="primary-background p-5 pt-3">
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header text-center ">
                            <h3>Register Here</h3>
                        </div>
                        <div class="card-body" style="font-size: 14px">
                            <form id="reg-form" class="myform" action="RegisterServlet" method="POST" onsubmit="validateForm(event)">

                                <div class="form-group">
                                    <label for="exampleInputEmail1">User Name</label>
                                    <input type="text" name="user_name" class="form-control" id="user_name" placeholder="Enter name" style="font-size: 14px">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" name="user_email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" style="font-size: 14px">
                                </div>


                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" name="user_password" class="form-control" id="exampleInputPassword1" placeholder="Password" style="font-size: 14px">
                                </div>

                                <div class="form-group mb-0" >
                                    <label for="gender" class="mr-3">Gender :</label>

                                    <input type="radio"  class="mr-1" name="gender" value="male">Male
                                    <input type="radio"  class="mr-1 ml-2" name="gender" value="female">Female
                                </div>

                                <div class="form-group mt-0">
                                    <textarea style="font-size: 14px" class="form-control mt-0" name="about" class="form" id="" rows="2" placeholder="Enter something about yourself"></textarea>
                                </div>

                                <div class="form-check">
                                    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Agree terms and conditions</label>
                                </div>
                                <br>
                                <div class="container text-center" id="loader" style="display:none;">
                                    <span class="fa fa-refresh fa-spin fa-4x"></span>
                                    <<h4>Please Wait ...</h4>
                                </div>
                                <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
                            </form>
                            <div class="dropdown-divider"></div>
                            Already have an account? <a class="" href="login_page.jsp">Login</a>
                        </div>

                    </div>
                </div> 
            </div>
        </main>

        <!--scripts-->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js"  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="  crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script>
                                function validateForm(event) {
                                    var checkBox = document.getElementById("exampleCheck1");
                                    if (!checkBox.checked) {
                                        alert("You must agree to the terms and conditions.");
                                        event.preventDefault(); // Prevent form submission
                                    }
                                }
        </script>
        <script>
            $(document).ready(function () {
                console.log("loaded ... ");

                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();



                    let form = new FormData(this);
                    //send register servlet;

                    $('#submit-btn').hide();
                    $('#loader').show();

                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)
                            $('#submit-btn').show();
                            $('#loader').hide();

                            if (data.trim() === "Done") {
                                swal("Registered Successfully.. ")
                                        .then(() => {
                                            window.location = "login_page.jsp";
                                        });
                            } else {
                                swal("Something went wrong.. try again");
                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $('#submit-btn').show();
                            $('#loader').hide();
                            swal("Something went wrong.. try again " + errorThrown);

                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>
    </body>
</html>
