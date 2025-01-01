package net.abccinema.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author kavis
 */
@WebServlet(name = "logout", urlPatterns = {"/logout"})
public class logout extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         // Invalidate the session
        HttpSession session = request.getSession(false); // Avoid creating a new session
        if (session != null) {
            session.invalidate();
        }

        // Redirect to the Sign in page
        response.sendRedirect("Home");

        
    }
}
