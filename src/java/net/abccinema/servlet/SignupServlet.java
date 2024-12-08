/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package net.abccinema.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.abccinema.model.Signup;
import net.abccinema.model.SignupDao;

@WebServlet(name = "SignupServlet", urlPatterns = {"/SignupServlet"})
public class SignupServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve form data
        String fullName = request.getParameter("full name");
        String ageParam = request.getParameter("age");
        int age = 0;

        try {
            age = Integer.parseInt(ageParam);
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid age format.");
            request.getRequestDispatcher("Sign up.jsp").forward(request, response);
            return;
        }

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rePassword = request.getParameter("repassword");
        String phoneNumber = request.getParameter("phone number");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");

        // Validate form data
        if (!password.equals(rePassword)) {
            request.setAttribute("errorMessage", "Passwords do not match!");
            request.getRequestDispatcher("Sign up.jsp").forward(request, response);
            return;
        }

        // Create Signup object
        Signup signup = new Signup(fullName, age, username, password, rePassword, phoneNumber, address, email, gender);

        // Save to database using DAO
        SignupDao signupDao = new SignupDao();
        boolean success = signupDao.saveSignup(signup);

        if (success) {
            request.setAttribute("successMessage", "Signup successful!");
            request.getRequestDispatcher("success.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Signup failed! Please try again.");
            request.getRequestDispatcher("Sign up.jsp").forward(request, response);
        }
    }
}