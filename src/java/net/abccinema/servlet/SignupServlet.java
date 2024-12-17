package net.abccinema.servlet;

import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;
import net.abccinema.connection.DbCon;
import net.abccinema.model.SignupDao;
import net.abccinema.model.User;

@WebServlet(name = "SignupServlet", urlPatterns = {"/SignupServlet"})
public class SignupServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Retrieve form data
            String fullName = request.getParameter("full_name");
            String ageParam = request.getParameter("age");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String rePassword = request.getParameter("repassword");
            String phoneNumber = request.getParameter("phone_number");
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            String gender = request.getParameter("gender");

            // Validate form data
            if (!password.equals(rePassword)) {
                response.sendRedirect("Signup.jsp?error=passwordMismatch");
                return;
            }

            int age = 0;
            try {
                if (ageParam != null && !ageParam.trim().isEmpty()) {
                    age = Integer.parseInt(ageParam);
                } else {
                    response.sendRedirect("Signup.jsp?error=invalidAge");
                    return;
                }
            } catch (NumberFormatException e) {
                response.sendRedirect("Signup.jsp?error=invalidAge");
                return;
            }

            int phoneNumberInt = 0;
            try {
                if (phoneNumber != null && !phoneNumber.trim().isEmpty()) {
                    phoneNumberInt = Integer.parseInt(phoneNumber);
                } else {
                    response.sendRedirect("Signup.jsp?error=invalidPhoneNumber");
                    return;
                }
            } catch (NumberFormatException e) {
                response.sendRedirect("Signup.jsp?error=invalidPhoneNumber");
                return;
            }

            // Create User object
            User user = new User();
            user.setFullName(fullName);
            user.setAge(age);
            user.setUsername(username);
            user.setPassword(password);
            user.setPhoneNumber(phoneNumberInt);
            user.setAddress(address);
            user.setEmail(email);
            user.setGender(gender);

            // Save user to database
            SignupDao signupDao = new SignupDao(DbCon.getConnection());
            boolean success = signupDao.saveSignup(user);

            if (success) {
                response.sendRedirect("success.jsp?message=signupSuccess");
            } else {
                response.sendRedirect("Signup.jsp?error=signupFailed");
            }
        } catch (SQLException e) {
            Logger.getLogger(SignupServlet.class.getName()).log(Level.SEVERE, null, e);
            response.sendRedirect("Signup.jsp?error=exception");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("Signup.jsp");
    }
}
