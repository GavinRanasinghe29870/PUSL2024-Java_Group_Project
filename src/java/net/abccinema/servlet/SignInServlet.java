package net.abccinema.servlet;

import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;
import net.abccinema.connection.DbCon;
import net.abccinema.model.SignupDao;
import net.abccinema.model.User;

@WebServlet(name = "SigninServlet", urlPatterns = {"/SigninServlet"})
public class SignInServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Retrieve username and password from the request
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            // Initialize session
            HttpSession session = request.getSession();

            // Handle admin login
            if ("admin".equals(username) && "admin123".equals(password)) {
                session.setAttribute("currentUser", "admin");
                response.sendRedirect("MovieManage.jsp");
                return;
            }

            // Authenticate user
            SignupDao signupDao = new SignupDao(DbCon.getConnection());
            User user = signupDao.logUser(username, password);

            if (user != null) {
                // Successful login
                session.setAttribute("currentUser", user);
                response.sendRedirect("Home");
            } else {
                // Authentication failed
                response.sendRedirect("signin.jsp?error=invalidCredentials");
            }
        } catch (SQLException e) {
            Logger.getLogger(SignInServlet.class.getName()).log(Level.SEVERE, null, e);
            response.sendRedirect("signin.jsp?error=exception");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("signin.jsp");
    }
}
