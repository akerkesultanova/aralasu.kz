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
import java.util.ArrayList;

@WebServlet(value = "/profile")
public class ProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User currentUser = (User) request.getSession().getAttribute("current_user");

        ArrayList<Post> posts = DBManager.getAllPosts();
        request.setAttribute("posts",posts);
        if(currentUser != null){
            request.getRequestDispatcher("/profile.jsp").forward(request,response);
        }else{
            response.sendRedirect("/login");
        }
    }
}
