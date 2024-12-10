package net.abccinema.servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import net.abccinema.connection.DbCon;
import net.abccinema.model.singleMovie;
import net.abccinema.model.singleMovieDAO;

@WebServlet(name = "SingleMovieServlet", urlPatterns = {"/SingleMovieServlet"})
public class SingleMovieServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
        String name = request.getParameter("name");
        System.out.println("Requested movie name: " + name);

        singleMovieDAO dao = new singleMovieDAO(DbCon.getConnection());
        singleMovie movie = dao.getsingleMovieByName(name);

        if (movie != null) {
            System.out.println("Movie details: " + movie);
            request.setAttribute("singleMovie", movie);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/singleMoviepage.jsp");
            dispatcher.forward(request, response);
        } else {
            System.out.println("Movie not found.");
            response.sendRedirect("error.jsp");
        }
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    }
    }
}
