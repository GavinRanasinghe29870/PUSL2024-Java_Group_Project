package net.abccinema.servlet;

import jakarta.servlet.RequestDispatcher;
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

    private buyticketsDao buyticketsDao;

    @Override
    public void init() throws ServletException {
        try {
            buyticketsDao = new buyticketsDao(DbCon.getConnection());
            System.out.println("buyticketsDao initialized succesfully");
        } catch (Exception e) {
            System.err.println("Error initializing Dao: " + e.getMessage());
            throw new ServletException("Dao initialization failed.", e);
        }
    }
    
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        
//    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                
        try{
            List<buytickets> movies = new buyticketsDao(DbCon.getConnection()).getAllMovies();
            
            if(movies != null && !movies.isEmpty()){
                request.setAttribute("movies", movies);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/BuyTickets.jsp");
                dispatcher.forward(request, response);
            } else{
            response.sendRedirect("error.jsp");
            }
            
        } catch(ClassNotFoundException | SQLException ex){
            Logger.getLogger(buyticketsServlet.class.getName()).log(Level.SEVERE,null, ex);
            
//            response.sendRedirect("error.jsp");
        } 
    }

//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        
//    }



}
