package net.abccinema.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import net.abccinema.connection.DbCon;
import net.abccinema.model.purchaseDao;

@WebServlet(name = "bookingDelete", urlPatterns = {"/bookingDelete"})
public class bookingDeleteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            String userIdParam = request.getParameter("userId");
            int bookingId = Integer.parseInt(request.getParameter("id"));
            
            purchaseDao dao = new purchaseDao(DbCon.getConnection());
            boolean f = dao.deleteBookings(bookingId);
            HttpSession session = request.getSession();
            
            if (f) {
                session.setAttribute("cBookMsg", "Booking deleted successfully.");
            } else {
                session.setAttribute("fcBookMsg", "Something went wrong on the server.");
            }
            response.sendRedirect("profile.jsp?id=" + userIdParam);
            
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}