package net.abccinema.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import net.abccinema.connection.DbCon;
import net.abccinema.model.FeedbackDAO;
import net.abccinema.model.Testimonials;

/**
 *
 * @author kavis
 */
@WebServlet(name = "FeedbackServlet", urlPatterns = {"/FeedbackServlet"})
public class FeedbackServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String message = request.getParameter("message");
            String rating = request.getParameter("hdrating");
            String fullName = "Anonymous";
            
            Testimonials fb = new Testimonials(fullName, message, rating);
            
            FeedbackDAO dao = new FeedbackDAO(DbCon.getConnection());
            
            boolean isSuccess = dao.addReview(fb);
            
            HttpSession session = request.getSession();
            
            if (isSuccess) {
                session.setAttribute("succMsg", "Thank You for your Review");
                response.sendRedirect("Home");
            }else {
                session.setAttribute("failedMsg", "Something Wrong on Server");
                response.sendRedirect("Home");
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
