package net.abccinema.servlet;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;
import net.abccinema.connection.DbCon;
import net.abccinema.model.singleMovie;
import net.abccinema.model.singleMovieDAO;

// This annotation maps the servlet to the "/SingleMovieServlet" URL pattern
@WebServlet(name = "SingleMovieServlet", value = {"/SingleMovieServlet"})
public class SingleMovieServlet extends HttpServlet {

    @Override

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        
        response.setContentType("application/json"); // Set the response content type to 'application/json' for JSON data
        response.setCharacterEncoding("UTF-8"); // Set the character encoding to UTF-8 
        
        String idParam = request.getParameter("id"); // Get the "id" parameter from the request (this is expected to be provided by the client)
        // Use a try-with-resources block to ensure resources are closed properly
      try (Connection connection = DbCon.getConnection(); PrintWriter out = response.getWriter())  { // Get the PrintWriter object to send data to the client
          int movieId = Integer.parseInt(idParam); // Parse the idParam string into an integer, which represents the movie ID
             singleMovieDAO movieDAO = new singleMovieDAO(connection); // Create an instance of the singleMovieDAO class to interact with the database
            // Fetch the list of movies
         singleMovie movie = movieDAO.getsingleMovieById(movieId);
        
          // Convert the list to JSON using Gson
            Gson gson = new Gson();
            String json = gson.toJson(movie);
        
            // Write the JSON response
            out.print(json);
            out.flush(); // Ensure all the data is written to the client
        } catch (Exception e) {
            // Send error response as JSON
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            Gson gson = new Gson();// Create a JSON response for the error message using Gson
             String errorJson = gson.toJson("Error fetching movies: " + e.getMessage());
            try (PrintWriter out = response.getWriter()) { // Send the error JSON to the client
                out.print(errorJson);
                out.flush(); //Ensure the error message is sent to the client
            }
            e.printStackTrace(); // Log the exception for debugging
        }
            
} 
}
             
             
             
             
             
             
             
             
        
        
//        try {
//            System.out.println("SingleMovieServlet: Received GET request."); // Debug log
//            singleMovieDAO row = new singleMovieDAO(DbCon.getConnection());
//            System.out.println("Fetching movies from database...");
//            List<singleMovie> singleM = row.getAllsingleMovieNames();
//            System.out.println("Movie names retrieved: " + singleM); // Debug log
//            // Debug the retrieved data
//            for (singleMovie movie : singleM) {
//                System.out.println("Debug Movie: " + movie.toString());
//            }
//            request.setAttribute("singleM", singleM);
//            System.out.println("Setting movies attribute for request...");
//            RequestDispatcher dispatcher = request.getRequestDispatcher("/singleMoviepage.jsp");
//            dispatcher.forward(request, response);
//            System.out.println("Forwarding to singleMoviepage.jsp...");
//
//        } catch (SQLException ex) {
//            Logger.getLogger(SingleMovieServlet.class.getName()).log(Level.SEVERE, null, ex);
//            System.err.println("Error in SingleMovieServlet: " + ex.getMessage()); // Debug log
//        }
   
