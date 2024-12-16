package net.abccinema.servlet;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import net.abccinema.connection.DbCon;
import net.abccinema.model.SingleBuyTickets;
import net.abccinema.model.SingleBuyTicketsDao;

/**
 *
 * @author gavin
 */
@WebServlet(name = "SingleBuyTicketsServlet", urlPatterns = {"/SingleBuyTicketsServlet"})
public class SingleBuyTicketsServlet extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        String idParam = request.getParameter("id");
      try (Connection connection = DbCon.getConnection(); PrintWriter out = response.getWriter()) {
          int sbmovieId = Integer.parseInt(idParam);
             SingleBuyTicketsDao sbmovieDAO = new SingleBuyTicketsDao(connection);
            // Fetching the list of movies
         SingleBuyTickets sbmovie = sbmovieDAO.getsingleBuyticketsMovieById(sbmovieId);
        
          // Converting the list to JSON using Gson
            Gson gson = new Gson();
            String json = gson.toJson(sbmovie);
        
            // JSON response
            out.print(json);
            out.flush();
        } catch (Exception e) {
            // Sending error response as JSON
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            Gson gson = new Gson();
             String errorJson = gson.toJson("Error fetching movies: " + e.getMessage());
            try (PrintWriter out = response.getWriter()) {
                out.print(errorJson);
                out.flush();
            }
            e.printStackTrace(); 
        }
  
    }

}
