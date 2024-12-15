package net.abccinema.model;



import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.abccinema.connection.DbCon;

@WebServlet("/MovieServlet")
public class MovieServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Movie> nowShowing = new ArrayList<>();
        List<Movie> comingSoon = new ArrayList<>();
        LocalDate today = LocalDate.now();

        try (Connection con = DbCon.getConnection();
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM movies")) {
            while (rs.next()) {
                LocalDate startDate = rs.getDate("m_start_date").toLocalDate();
                LocalDate endDate = rs.getDate("m_end_date").toLocalDate();
                Movie movie = new Movie(
                        rs.getInt("m_id"),
                        rs.getString("m_name"),
                        rs.getString("m_image"), // Image file name only
                        startDate.isAfter(today) ? "coming_soon" : "now_showing" // Categorize by date
                );
                
                if (!startDate.isAfter(today) && !endDate.isBefore(today)) {
                    nowShowing.add(movie);
                } else if (startDate.isAfter(today)) {
                    comingSoon.add(movie);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("nowShowing", nowShowing);
        request.setAttribute("comingSoon", comingSoon);
        request.getRequestDispatcher("movies.jsp").forward(request, response);
    }
}
