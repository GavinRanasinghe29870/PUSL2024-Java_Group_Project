package net.abccinema.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.sql.SQLException;
import net.abccinema.connection.DbCon;
import net.abccinema.model.movieinsert;
import net.abccinema.model.movieupdateDAO;

@WebServlet(name = "movieupdateServlet", urlPatterns = {"/movieupdateServlet"})
@MultipartConfig
public class movieupdateServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String movieId = request.getParameter("movieId");
            String name = request.getParameter("movieName");
            String description = request.getParameter("movieDescription");
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");
            String[] timeSlots = request.getParameterValues("timeSlots");
            String genres = request.getParameter("movieGenres");
            String cast = request.getParameter("movieStars");
            String directors = request.getParameter("movieDirectors");
            String writers = request.getParameter("movieWriters");
            String producers = request.getParameter("movieProducers");
            String music = request.getParameter("movieMusic");
            String adultPrice = request.getParameter("movieTicketPriceAdult");
            String childPrice = request.getParameter("movieTicketPriceChild");

            Part filePart = request.getPart("movieImage");
            String fileName = filePart != null ? filePart.getSubmittedFileName() : null;

            movieinsert movie = new movieinsert();
            movie.setId(movieId);
            movie.setName(name);
            movie.setImageName(fileName);
            movie.setDescription(description);
            movie.setStartDate(startDate);
            movie.setEndDate(endDate);
            movie.setTimeSlots(timeSlots);
            movie.setGenres(genres);
            movie.setCast(cast);
            movie.setDirectors(directors);
            movie.setWriters(writers);
            movie.setProducers(producers);
            movie.setMusic(music);
            movie.setTicketPriceAdult(adultPrice);
            movie.setTicketPriceChild(childPrice);

            movieupdateDAO movieUpdateDAO = new movieupdateDAO(DbCon.getConnection());
            boolean isSuccess = movieUpdateDAO.updateMovie(movie);

            if (isSuccess) {
                response.sendRedirect("MovieManage.jsp?success=true");
            } else {
                response.sendRedirect("MovieManage.jsp?error=updateFailed");
            }
        } catch (ServletException | IOException | SQLException ex) {
            response.sendRedirect("MovieManage.jsp?error=exception");
        }
    }
}
