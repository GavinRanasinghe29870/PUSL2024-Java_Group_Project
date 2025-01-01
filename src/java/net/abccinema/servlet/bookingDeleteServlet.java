package net.abccinema.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import net.abccinema.connection.DbCon;
import net.abccinema.model.User;
import net.abccinema.model.purchaseDao;

/**
 *
 * @author kavis
 */
@WebServlet(name = "bookingDelete", urlPatterns = {"/bookingDelete"})
public class bookingDeleteServlet extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            
            int id = Integer.parseInt(request.getParameter("id"));
            
            purchaseDao dao = new purchaseDao(DbCon.getConnection());
            boolean f = dao.deleteBookings(id);
            HttpSession session = request.getSession();
            
            if (f) {
                session.setAttribute("succMsg", "Movie Delete Successfully..");
                response.sendRedirect("profile.jsp");
            }else {
                session.setAttribute("failedMsg", "Something Wrong on Server");
                response.sendRedirect("profile.jsp");
            }
            
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

}