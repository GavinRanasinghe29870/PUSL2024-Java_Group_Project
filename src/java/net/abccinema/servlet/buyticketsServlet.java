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
import net.abccinema.model.buytickets;
import net.abccinema.model.buyticketsDao;

@WebServlet(name = "buyticketsServlet", value = "/buyticketsServlet")
public class buyticketsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try (Connection con = DbCon.getConnection(); PrintWriter out = response.getWriter()) {
            buyticketsDao dao = new buyticketsDao(con);

            // Fetch the list of movies
            List<buytickets> movies = dao.getAllMovies();

            // Convert the list to JSON using Gson
            Gson gson = new Gson();
            String json = gson.toJson(movies);

            // Write the JSON response
            out.print(json);
            out.flush();
        } catch (Exception e) {
            // Send error response as JSON
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            Gson gson = new Gson();
            String errorJson = gson.toJson("Error fetching movies: " + e.getMessage());
            try (PrintWriter out = response.getWriter()) {
                out.print(errorJson);
                out.flush();
            }
            e.printStackTrace(); // Log the exception for debugging
        }
    }
}
