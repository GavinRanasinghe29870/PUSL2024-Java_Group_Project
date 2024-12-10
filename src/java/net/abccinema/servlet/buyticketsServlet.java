package net.abccinema.servlet;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.ArrayList;
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
@WebServlet(name = "buyticketsServlet", urlPatterns = {"/buyticketsServlet"})
public class buyticketsServlet extends HttpServlet {

    //    private buyticketsDao buyticketsDao;
    //
    //    @Override
    //    public void init() throws ServletException {
    //        try {
    //            buyticketsDao = new buyticketsDao(DbCon.getConnection());
    //        } catch (Exception e) {
    //            throw new ServletException("DAO initialization failed", e);
    //        }
    //    }
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        
//    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            System.out.println("Connecting to database...");
            buyticketsDao dao = new buyticketsDao(DbCon.getConnection());
            System.out.println("Fetching movies from database...");
            List<buytickets> movies = dao.getAllMovies();
            System.out.println("Movies fetched: " + movies);
            request.setAttribute("movies", movies);
            System.out.println("Setting movies attribute for request...");

            RequestDispatcher dispatcher = request.getRequestDispatcher("/BuyTickets.jsp");
            dispatcher.forward(request, response);
            System.out.println("Forwarding to BuyTickets.jsp...");
        } catch (Exception e) {
            System.out.println("An error occurred in doGet: " + e.getMessage());
            e.printStackTrace();

        }
// List<buytickets> movies = new ArrayList<>(); 
//        try {
//            movies = buyticketsDao.getAllMovies();
//            System.out.println("Movies: " + movies);
//
//            if (movies != null && !movies.isEmpty()) {
//                request.setAttribute("movies", movies);
//                RequestDispatcher dispatcher = request.getRequestDispatcher("/BuyTickets.jsp");
//                dispatcher.forward(request, response);
//            } else {
//                // Handle the case where no movies are found
//                request.setAttribute("errorMessage", "No movies found.");
//                RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
//                dispatcher.forward(request, response);
//            }
//
//        } catch (Exception ex) {
//            Logger.getLogger(buyticketsServlet.class.getName()).log(Level.SEVERE, null, ex);
//
////            response.sendRedirect("error.jsp");
//        }
    }

//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        
//    }
}
