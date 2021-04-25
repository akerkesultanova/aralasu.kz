<%@ page import="java.util.ArrayList" %>
<%@ page import="db.Post" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>My Post</title>
        <%@include file="vendor/head.jsp"%>
    </head>
    <body>
        <%@include file="vendor/navbar.jsp"%>
        <div class = "container">
            <div class = "row mt-5">
                <div class = "col-sm-3 ">
                    <img src="<%=currentUser.getPicture_url()%>" style="width: 250px; height: 250px;"><br><br>
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
                    <button type="button" class="btn btn-primary btn-sm float-left" data-toggle="modal" data-target="#exampleModal" style="background-color: coral">
                        Add new post
                    </button>
                    <br>
                    <br>
                    <%
                        ArrayList<Post> posts = (ArrayList<Post>) request.getAttribute("posts");
                        if (posts != null){
                            for (Post p:posts){
                    %>
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title"><%=p.getTitle()%></h5>
                            <p class="card-text"><%=p.getShort_content()%></p>
                            <a href="/detailsPost?id=<%=p.getId()%>" class="btn btn-primary" style="background-color: coral; color: white">Read More</a>
                        </div>
                        <div class="card-footer text-muted">
                            <%
                                StringTokenizer br = new StringTokenizer(p.getPost_date(), "-");
                                String year_1 = br.nextToken();
                                String month_1 = br.nextToken();
                                String day_1 = br.nextToken();
                            %>
                            Posted on September <%=day_1%>, <%=year_1%> by <strong style="color: #000b67"><%=p.getAuthor_id().getFull_name()%></strong>
                        </div>
                    </div>
                    <br>
                    <%
                            }
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
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add new posts</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">x</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="/addPost" method="post">
                            <input type="hidden" required class="form-control" name="email" value="<%=currentUser.getEmail()%>">
                            <div class="form-group">
                                <label  class="col-form-label">Title:</label>
                                <input type="text" class="form-control" name="title" placeholder="title">
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Short Content:</label>
                                <textarea class="form-control" name ="short_content" placeholder="short content"></textarea>
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Content:</label>
                                <textarea class="form-control" name ="content" placeholder="content"></textarea>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary"style="background-color: seagreen">Add</button>
                                <button type="button" class="btn btn-danger" data-dismiss="modal" style="background-color: gray">Cancel</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="sticky-bottom text-white" style="background-color: lightgray; margin-top: 180px">
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
