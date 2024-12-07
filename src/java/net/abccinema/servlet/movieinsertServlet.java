package net.abccinema.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import net.abccinema.connection.DbCon;
import net.abccinema.model.movieinsert;
import net.abccinema.model.movieinsertDAO;

@WebServlet(name = "movieinsertServlet", urlPatterns = {"/movieinsertServlet"})
@MultipartConfig
public class movieinsertServlet extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "/Images";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String name = request.getParameter("movieName");
            String description = request.getParameter("movieDescription");
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");
            String[] timeSlots = request.getParameterValues("timeSlots");
            if (timeSlots == null || timeSlots.length == 0) {
                response.sendRedirect("MovieManage.jsp?error=noTimeSlots");
                return;
            }
            String genres = request.getParameter("movieGenres");
            String cast = request.getParameter("movieStars");
            String directors = request.getParameter("movieDirectors");
            String writers = request.getParameter("movieWriters");
            String producers = request.getParameter("movieProducers");
            String music = request.getParameter("movieMusic");
            String adultPrice = request.getParameter("movieTicketPriceAdult");
            String childPrice = request.getParameter("movieTicketPriceChild");

            //Handle the image upload
            Part filePart = request.getPart("movieImage");
            String fileName = filePart.getSubmittedFileName();

            if (fileName != null && !fileName.isEmpty()) {
                String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }
                String filePath = uploadPath + File.separator + fileName;
                filePart.write(filePath);
            }
            // Validate inputs (basic example)
            if (name == null || name.isEmpty() || adultPrice == null || childPrice == null) {
                response.sendRedirect("MovieManage.jsp?error=invalidInput");
                return;
            }

            // Create movie object
            movieinsert movie = new movieinsert();
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

            // Insert movie into the database
            movieinsertDAO movieInsertDAO = new movieinsertDAO(DbCon.getConnection());
            boolean isSuccess = movieInsertDAO.insertMovie(movie);

            if (isSuccess) {
                response.sendRedirect("MovieManage.jsp?success=true");
            } else {
                response.sendRedirect("MovieManage.jsp?error=insertFailed");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            response.sendRedirect("MovieManage.jsp?error=exception");
        }
    }
}
