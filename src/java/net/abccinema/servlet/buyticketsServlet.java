package net.abccinema.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import net.abccinema.connection.DbCon;
import net.abccinema.model.buytickets;
import net.abccinema.model.buyticketsDao;


/**
 *
 * @author gavin
 */
public class buyticketsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            buyticketsDao buyticketsDao = new buyticketsDao(DbCon.getConnection());
            List<buytickets> movies = buyticketsDao.getMovies();
            
            request.setAttribute("movies", movies);
            request.getRequestDispatcher("BuyTickets.jsp").forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(buyticketsServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(buyticketsServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
