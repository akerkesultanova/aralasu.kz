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
import java.sql.Timestamp;

@WebServlet(value = "/addPost")
public class AddPostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String short_content = request.getParameter("short_content");
        String content = request.getParameter("content");
        Timestamp post_date = new Timestamp(System.currentTimeMillis());
        String email = request.getParameter("email");
        User user = DBManager.getUser(email);
        String redirect = "/edit";
        Post post = new Post(null,user,title,short_content,content,post_date+"");
        User currentUser = (User) request.getSession().getAttribute("current_user");

        if(currentUser != null) {
            if (DBManager.addPost(post)) {
                redirect = "/myPost?id="+currentUser.getId();
            }
        }else{
            redirect = "/login";
        }
        response.sendRedirect(redirect);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
