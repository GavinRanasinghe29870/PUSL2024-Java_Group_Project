package net.abccinema.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import net.abccinema.module.buytickets;
import net.abccinema.module.buyticketsDao;


/**
 *
 * @author gavin
 */
public class buyticketsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        /*buyticketsDao buyticketsDao = new buyticketsDao();*/
        /*List<buytickets> movies = buyticketsDao.getMovies();
        
        request.setAttribute("movies", movies);
        request.getRequestDispatcher("BuyTickets.jsp").forward(request, response);*/
        }
}
