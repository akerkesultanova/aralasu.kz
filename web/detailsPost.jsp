<%@ page import="db.Post" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Details Post</title>
    <%@include file="vendor/head.jsp"%>
</head>
    <body>
        <%@include file="vendor/navbar.jsp"%>
        <div class = "container">
            <div class = "row mt-5">
                <div class = "col-sm-3 ">
                    <img src="<%=currentUser.getPicture_url()%>" style="width: 250px; height: 250px">
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
                <div class="col-sm-6">
                    <%
                        Post post = (Post) request.getAttribute("post");
                        if (post != null){
                    %>
                    <div class="card">
                        <h5 class="card-header" style="background-color: white">Post</h5>
                        <div class="card-body">
                            <h3><%=post.getTitle()%></h3>
                            <p class="post_date"><%=post.getPost_date()%></p>
                            <p class="card-text"><%=post.getContent()%></p>
                            <br>
                            <%
                                if (post.getAuthor_id().getId() == currentUser.getId())
                                {
                            %>
                            <button type="submit" class="btn btn-success" data-toggle ="modal" data-target="#edit">Edit</button>
                            <a href="/deletePost?id=<%=post.getId()%>" class="btn btn-danger btn-sm float-right ml-2" style="background-color: #f41e19">Delete</a>
                            <%
                                }
                            %>
                        </div>
                    </div>
                    <%
                        }
                    %>
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
        <div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="updateLeagueModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="updateLeagueModalLabel">Edit Post</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">x</span>
                        </button>
                    </div>
                    <form action="/editPost" method="get">
                        <div class="modal-body">
                            <input type="hidden" value="<%=post.getId()%>" name="id">
                            <input type="hidden" value="<%=post.getAuthor_id().getId()%>" name="author_id">
                            <div class="form-group">
                                <label>Title:</label>
                                <input type="text" class="form-control" value="<%=post.getTitle()%>" name="title">
                            </div>
                            <div class="form-group">
                                <label>Short Content:</label>
                                <textarea type="text" name="short_content"><%=post.getShort_content()%></textarea>
                            </div>
                            <div class="form-group">
                                <label>Content:</label>
                                <textarea type="text" name="content"><%=post.getContent()%></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-dark">Edit</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal" >Close</button>
                        </div>
                    </form>
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
