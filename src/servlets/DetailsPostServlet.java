package servlets;

import db.DBManager;
import db.Post;
import db.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/detailsPost")
public class DetailsPostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User currentUser = (User) request.getSession().getAttribute("current_user");
        Long id = Long.parseLong(request.getParameter("id"));
        if(currentUser != null){
            Post post = DBManager.getPost(id);
            request.setAttribute("post",post);
        }
        request.getRequestDispatcher("/detailsPost.jsp").forward(request,response);
    }
}
