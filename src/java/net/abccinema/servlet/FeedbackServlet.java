package net.abccinema.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import net.abccinema.connection.DbCon;
import net.abccinema.model.FeedbackDAO;
import net.abccinema.model.Testimonials;
import net.abccinema.model.User;

@WebServlet(name = "FeedbackServlet", urlPatterns = {"/FeedbackServlet"})
public class FeedbackServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            User currentUser = (User) session.getAttribute("currentUser");
            
            if (currentUser == null) {
                session.setAttribute("failedMsg", "You Have to Login First");
            }
            
            String message = request.getParameter("message");
            String rating = request.getParameter("hdrating");
            String fullName = currentUser.getFullName();

            Testimonials fb = new Testimonials(fullName, message, rating);

            FeedbackDAO dao = new FeedbackDAO(DbCon.getConnection());

            boolean isSuccess = dao.addReview(fb);

            if (isSuccess) {
                session.setAttribute("succMsg", "Thank You for your Review");
            } else {
                session.setAttribute("failedMsg", "Something Wrong on Server");
            }
            response.sendRedirect("Home");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Home");
        }
    }
}