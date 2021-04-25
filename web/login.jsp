<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign in</title>
    <%@include file="vendor/head.jsp"%>
</head>
    <body>
        <%@include file="vendor/navbar.jsp"%>
        <br>
        <br>
        <br>
            <div class="container">
                <div class="row mt-5">
                    <div class="col-sm-6 offset-3">
                        <%
                            String passError = request.getParameter("passworderror");
                            if (passError != null){
                        %>
                        <div class = "alert alert-danger alert-dismissible fade show" role="alert">
                            Incorrect password!
                            <button type="button" class = "close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">x</span>
                            </button>
                        </div>
                        <%
                            }
                        %>
                        <%
                            String emailError = request.getParameter("emailerror");
                            if (emailError != null){
                        %>
                        <div class = "alert alert-danger alert-dismissible fade show" role="alert">
                            Incorrect email!
                            <button type="button" class = "close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">x</span>
                            </button>
                        </div>
                        <%
                            }
                        %>
                        <form action="/auth" method="post">
                            <div class="form-group">
                                <label>E-Mail Address:</label>
                                <input type="text" required class="form-control" name="email">
                            </div>

                            <div class="form-group">
                                <label>Password:</label>
                                <input type="password" required class="form-control" name="password">
                            </div>

                            <div class="form-group">
                                <label>
                                    <input type="checkbox" name="remember"> Remember Me
                                </label>
                            </div>

                            <div class="form-group">
                                <button class="btn btn-success" style="background-color: coral">
                                    Log In
                                </button>
                                <a href="#" class="btn btn-link">
                                    Forgot Your Password?
                                </a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="sticky-bottom text-white" style="margin-top: 280px; background-color: lightgray">
                <div class="row justify-content-center">
                    <div class="col-5">
                        <div class="d-flex justify-content-center">
                            <p class="mt-4 mb-4" style="color: black">Copyright © aralasu.kz 2020</p>
                        </div>
                    </div>
                </div>
            </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    </body>
</html>
