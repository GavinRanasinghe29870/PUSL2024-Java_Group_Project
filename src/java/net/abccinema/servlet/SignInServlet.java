/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package net.abccinema.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import net.abccinema.model.Signup;
import net.abccinema.model.SignupDao;

@WebServlet(name = "SigninServlet", urlPatterns = {"/SigninServlet"})
public class SignInServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve email and password from the request
        String email = request.getParameter("username");
        String password = request.getParameter("password");

        SignupDao signupDao = new SignupDao();

        // Authenticate user
        Signup user = signupDao.logUser(email, password);

        if (user != null) {
            // If authentication is successful, create a session
            HttpSession session = request.getSession();
            session.setAttribute("currentUser", user);
       
            // Redirect to the user's dashboard
            response.sendRedirect("MovieManage_1.jsp");
        } else {
            // If authentication fails, redirect to the sign-in page with an error message
            request.setAttribute("errorMessage", "Invalid email or password. Please try again.");
            request.getRequestDispatcher("signin.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect GET requests to the sign-in page
        response.sendRedirect("signin.jsp");
    }
}
