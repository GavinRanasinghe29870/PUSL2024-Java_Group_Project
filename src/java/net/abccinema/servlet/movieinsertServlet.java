package net.abccinema.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import net.abccinema.connection.DbCon;
import net.abccinema.model.movieinsert;
import net.abccinema.model.movieinsertDAO;

public class movieinsertServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String name = request.getParameter("movieName");
            String description = request.getParameter("movieDescription");
            String[] timeSlots = request.getParameterValues("timeSlots");
            String Genres = request.getParameter("movieGenres");
            String cast = request.getParameter("movieStars");
            String directors = request.getParameter("movieDirectors");
            String writers = request.getParameter("movieWriters");
            String producers = request.getParameter("movieProducers");
            String music = request.getParameter("movieMusic");
            String adultprice = request.getParameter("movieTicketPriceAdult");
            String childprice = request.getParameter("movieTicketPriceChild");
            
            movieinsert movie= new movieinsert();
            movie.setName(name);
            movie.setDescription(description);
            movie.setTimeSlots(timeSlots);
            movie.setGenres(Genres);
            movie.setCast(cast);
            movie.setDirectors(directors);
            movie.setWriters(writers);
            movie.setProducers(producers);
            movie.setMusic(music);
            movie.setTicketPriceAdult(adultprice);
            movie.setIcketPriceChild(childprice);
            
            
            
            movieinsertDAO MovieinsertDAO = new movieinsertDAO(DbCon.getConnection());
            boolean isTrue = MovieinsertDAO.insertMovie(movie);
            
            if(isTrue){
                response.sendRedirect("MovieManage.jsp");
            }else{
                response.sendRedirect("MovieManage.jsp");
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(movieinsertServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(movieinsertServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
}
