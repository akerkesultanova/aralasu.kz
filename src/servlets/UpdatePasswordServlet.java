package servlets;

import db.DBManager;
import db.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/updatePassword")
public class UpdatePasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String old_password = request.getParameter("old_password");
        String password = request.getParameter("password");
        String re_password = request.getParameter("re_password");
        String redirect = "/edit?passworderrorOld";

        User user = DBManager.getUser(email);
        if(user.getPassword().equals(old_password)) {
            redirect = "/edit?passworderror";

            if (password.equals(re_password)) {

                user.setPassword(password);

                if (DBManager.updatePassword(user)) {

                    request.getSession().setAttribute("current_user", user);
                    redirect = "/edit?success_2";
                }
            }
        }
        response.sendRedirect(redirect);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
