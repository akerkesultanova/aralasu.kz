<%@page import="db.User" %>
<%
    User currentUser = (User) request.getSession().getAttribute("current_user");
    boolean online = false;
    int act = 0;
    if(currentUser != null){
        online = true;
    }
%>