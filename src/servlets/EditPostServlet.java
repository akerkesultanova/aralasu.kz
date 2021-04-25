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

@WebServlet(value = "/editPost")
public class EditPostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Long author_id = Long.parseLong(request.getParameter("author_id"));
        String title = request.getParameter("title");
        String short_content = request.getParameter("short_content");
        String content = request.getParameter("content");
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());

        User currentUser = (User) request.getSession().getAttribute("current_user");
        String redirect = "/profile";
        Post post = new Post(id, currentUser,title,short_content,content,timestamp+"");
        if(currentUser != null) {
            if (DBManager.updatePost(post)) {
                redirect = "/detailsPost?id=" + id;
            }
        }else{
            redirect = "/login";
        }
        response.sendRedirect(redirect);
    }
}
