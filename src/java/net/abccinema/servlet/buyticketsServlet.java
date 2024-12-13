package net.abccinema.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import net.abccinema.connection.DbCon;
import net.abccinema.model.buytickets;
import net.abccinema.model.buyticketsDao;

/**
 *
 * @author gavin
 */
@WebServlet(name = "buyticketsServlet", value = "/buyticketsServlet")
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
            // Establish connection
            Connection con = DbCon.getConnection();
            System.out.println("Database connection established.");

            // Instantiate DAO and fetch movies
            buyticketsDao dao = new buyticketsDao(con);
            List<buytickets> movies = dao.getAllMovies();

            // Log the retrieved movies
            System.out.println("Fetched movies: " + movies);

            // Set the movies list as a request attribute
            request.setAttribute("movies", movies);

            // Forward the request to the JSP page
            RequestDispatcher dispatcher = request.getRequestDispatcher("BuyTickets.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            // Handle and log exceptions
            System.out.println("Error: " + e.getMessage());
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error fetching movies.");
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
