<%@ page import="java.util.StringTokenizer" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.Period" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit</title>
    <%@include file="vendor/head.jsp"%>
</head>
<body>
    <%@include file="vendor/navbar.jsp"%>
    <div class = "container">
        <div class = "row mt-5">
            <div class = "col-sm-3 ">
                <img src="<%=currentUser.getPicture_url()%>" style="width: 250px; height: 250px;">
                <br>
                <br>
                <div class="list-group" id="list-tab" role="tablist" style="width: 250px;">
                    <%
                        String year = currentUser.getBirth_date().substring(0,4);
                        int age = 2020 - Integer.parseInt(year);
                    %>
                    <a class="list-group-item list-group-item-action" href="/profile" role="tab" aria-controls="home"><strong style="color: black;"><%=currentUser.getFull_name()%>, <%=age%> years old</strong></a>
                    <a class="list-group-item list-group-item-action" href="/edit" role="tab" aria-controls="/edit"><strong style="color: dimgray">Edit Profile</strong></a>
                    <a class="list-group-item list-group-item-action" href="#list-settings" role="tab" aria-controls="settings"><strong style="color: dimgray">Settings</strong></a>
                    <a class="list-group-item list-group-item-action" href="/logout" role="tab" aria-controls="settings"><strong style="color: dimgray;">Logout</strong></a>
                </div>
            </div>
            <div class="col sm-6">
                <h4 class="mb-4">Edit profile</h4>
                <%
                    String success = request.getParameter("success");
                    if (success != null){
                %>
                <div class = "alert alert-success alert-dismissible fade show" role="alert">
                    User changed successfully!
                    <button type="button" class = "close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">x</span>
                    </button>
                </div>
                <%
                    }
                %>
                <form action="/editProfile" method="post">
                    <div class="form-group">
                        <label>Email Address:</label>
                        <input type="text" required class="form-control" name="email" value="<%=currentUser.getEmail()%>">
                    </div>

                    <div class="form-group">
                        <label>Full Name:</label>
                        <input type="text" required class="form-control" name="full_name" value="<%=currentUser.getFull_name()%>">
                    </div>

                    <div class="form-group">
                        <label>Birthdate:</label>
                        <div class="form-group row">
                            <div class="col-10">
                                <input class="form-control" type="date" name="birth_date" value="<%=currentUser.getBirth_date()%>" style="width: 540px">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <button class="btn btn-success" style="background-color: coral; color: white">Update Profile</button>
                    </div>
                </form>
                <br>
                <br>
                <h4 class="mb-4">Edit picture</h4>
                 <%
                    String success1 = request.getParameter("success_1");
                    if (success1 != null){
                 %>
                <div class = "alert alert-success alert-dismissible fade show" role="alert">
                    User's picture changed successfully!
                    <button type="button" class = "close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">x</span>
                    </button>
                </div>
                 <%
                    }
                 %>
                <form action="/editPicture" method="post">
                    <div class="form-group">
                        <label>URL of picture:</label>
                        <input type="text" required class="form-control" name="picture" value="<%=currentUser.getPicture_url()%>">
                    </div>
                    <div class="form-group">
                        <button class="btn btn-success" style="color: white; background-color: coral">Update URL</button>
                    </div>
                </form>
                <br>
                <h4 class="mb-4">Update Password</h4>
                <%
                    String success2 = request.getParameter("success_2");
                    if (success2 != null){
                 %>
                <div class = "alert alert-success alert-dismissible fade show" role="alert">
                    User's password changed successfully!
                    <button type="button" class = "close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">x</span>
                    </button>
                </div>
                 <%
                    }
                 %>
                 <%
                    String passworderror = request.getParameter("passworderror");
                    if(passworderror != null){
                %>
                    <div class = "alert alert-danger alert-dismissible fade show" role="alert">
                        Passwords are not same!
                        <button type="button" class = "close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">x</span>
                        </button>
                    </div>
                <%
                    }
                %>
                 <%
                    String passworderrorOld = request.getParameter("passworderrorOld");
                    if(passworderrorOld != null){
                 %>
                    <div class = "alert alert-danger alert-dismissible fade show" role="alert">
                        User's old password is wrong!
                        <button type="button" class = "close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">x</span>
                        </button>
                    </div>
                 <%
                    }
                 %>
                <form action="/updatePassword" method="post">
                    <input type="hidden" required class="form-control" name="email" value="<%=currentUser.getEmail()%>">
                    <div class="form-group">
                        <label>Old Password:</label>
                        <input type="password" required class="form-control" name="old_password">
                    </div>
                    <div class="form-group">
                        <label>Password:</label>
                        <input type="password" required class="form-control" name="password">
                    </div>
                    <div class="form-group">
                        <label>Re-Password:</label>
                        <input type="password" required class="form-control" name="re_password">
                    </div>
                    <div class="form-group">
                        <button class="btn btn-success" style="background-color: coral; color: white">Update Password</button>
                    </div>
                </form>
            </div>
            <div class = "col-sm-3">
                <div class="card" style="width: 280px;">
                    <div class="card-header" style="background-color: coral">
                        <strong style="color: white;"><img src="https://www.flaticon.com/premium-icon/icons/svg/2360/2360282.svg" style="width: 35px; height: 35px">Latest birthdays:</strong>
                    </div>
                    <div class="card-body" style="background-color: white">
                        <p class="card-text" style="color: black"><img src="https://image.flaticon.com/icons/png/512/3171/3171065.png" style="width: 30px; height: 30px"> Aliamir Sultan, 24 July</p>
                        <p class="card-text" style="color: black"><img src="https://image.flaticon.com/icons/png/512/3171/3171065.png" style="width: 30px; height: 30px"> Aknazar Marat, 01 October</p>
                    </div>
                </div>
                <br>
                <br>
                <div class="card" style="width: 280px;">
                    <div class="card-header" style="background-color: coral">
                        <strong style="color: white;"><img src="https://www.flaticon.com/premium-icon/icons/svg/3226/3226852.svg" style="height: 35px; width: 35px">My games</strong>
                    </div>
                    <div class="card-body" style="background-color: white">
                        <p class="card-text" style="color: black"><img src="https://www.flaticon.com/svg/static/icons/svg/26/26524.svg" style="width: 30px;height: 30px"> FOOTBAL</p>
                        <p class="card-text" style="color: black"><img src="https://www.flaticon.com/premium-icon/icons/svg/934/934386.svg" style="width: 30px;height: 30px"> PING PONG</p>
                        <p class="card-text" style="color: black"><img src="https://www.flaticon.com/svg/static/icons/svg/75/75452.svg" style="width: 30px;height: 30px"> CHESS</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="sticky-bottom text-white" style="background-color: lightgray">
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
