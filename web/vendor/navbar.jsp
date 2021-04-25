<%@ page import="java.util.StringTokenizer" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.Period" %>
<%@include file="user.jsp"%>
<nav class="navbar navbar-expand-lg navbar-dark navbar-aralasu" style="background-color: coral">
    <a class="navbar-brand" href="/home" style="color: white"><strong> <img src="https://www.flaticon.com/svg/static/icons/svg/3480/3480025.svg" style="width: 40px; height: 40px"> ARALASU.KZ</strong></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto" style="margin-right: 120px">
            <%
                if (online){
            %>
                <li class="nav-item">
                    <a class="nav-link" href="/profile" style="color: white"><strong><img src="https://www.flaticon.com/svg/static/icons/svg/942/942803.svg" style="height: 35px; width: 35px"> Feed</strong></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/" style="color: white"><strong><img src="https://image.flaticon.com/icons/png/512/880/880543.png" style="height: 35px; width: 35px"> My Friends</strong></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/" style="color: white"><strong><img src="https://www.flaticon.com/svg/static/icons/svg/3375/3375131.svg" style="height: 35px; width: 35px"> Groups</strong></a>
                </li>
                <li class="nav-item">
                    <input type="hidden" required class="form-control" style="color: white" name="email" value="<%=currentUser.getId()%>">
                    <a class="nav-link" href="/myPost?id=<%=currentUser.getId()%>" style="color: white"><strong><img src="https://www.flaticon.com/svg/static/icons/svg/471/471249.svg" style="height: 35px; width: 35px"> My Posts</strong></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/" style="color: white"><strong><img src="https://www.flaticon.com/svg/static/icons/svg/2593/2593450.svg" style="height: 35px; width: 35px"> Messages</strong></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/" style="color: white"><strong><img src="https://www.flaticon.com/svg/static/icons/svg/3603/3603063.svg" style="height: 30px; width: 30px"> Pictures</strong></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/" style="color: white"><strong><img src="https://www.flaticon.com/premium-icon/icons/svg/2704/2704006.svg" style="height: 35px; width: 35px"> Videos</strong></a>
                </li>
            <%
                }else {
            %>
                <li class="nav-item">
                    <a class="nav-link" href="/register" style="color: white"><strong><img src="https://www.flaticon.com/svg/static/icons/svg/3596/3596080.svg" style="height: 35px; width: 35px"> Register</strong></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/login" style="color: white"><strong><img src="https://www.flaticon.com/svg/static/icons/svg/494/494952.svg" style="height: 35px; width: 35px"> Login</strong></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/register" style="color: white"><strong><img src="https://www.flaticon.com/svg/static/icons/svg/953/953818.svg" style="height: 35px; width: 35px"> FAQ</strong></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/login" style="color: white"><strong><img src="https://www.flaticon.com/svg/static/icons/svg/1545/1545205.svg" style="height: 35px; width: 35px"> About Aralasu</strong></a>
                </li>
            <%
                }
            %>
        </ul>
    </div>
</nav>
