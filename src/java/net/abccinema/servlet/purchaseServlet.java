package net.abccinema.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/purchaseServlet")
public class purchaseServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Retrieve parameters from the form
        String name = request.getParameter("name");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String adultCountStr = request.getParameter("adultCount");
        String childCountStr = request.getParameter("childCount");
        String totalPriceStr = request.getParameter("totalPrice");
        String paymentMethod = request.getParameter("paymentMethod");
        

        // Validate input parameters
        if (adultCountStr == null || adultCountStr.isEmpty() || childCountStr == null || childCountStr.isEmpty() || totalPriceStr == null || totalPriceStr.isEmpty()) {
    out.println("<html><body>");
    out.println("<h1>Invalid input data. Please try again.</h1>");
    out.println("</body></html>");
    return;
}

int adultCount = Integer.parseInt(adultCountStr);
int childCount = Integer.parseInt(childCountStr);
float totalPrice = Float.parseFloat(totalPriceStr);

        // Database connection details
        String dbURL = "jdbc:mysql://localhost:3306/abccinema";
        String dbUser = "root";
        String dbPassword = "agasthi";

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // Establish database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // SQL query to insert purchase details
            String sql = "INSERT INTO purchases (name, phoneNumber, email, adultTickets, childTickets, totalAmount, paymentMethod) VALUES (?, ?, ?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(sql);

            // Set query parameters
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, phoneNumber);
            preparedStatement.setString(3, email);
            preparedStatement.setInt(4, adultCount);
            preparedStatement.setInt(5, childCount);
            preparedStatement.setFloat(6, totalPrice);
            preparedStatement.setString(7, paymentMethod);

            // Execute the query
            int rowsInserted = preparedStatement.executeUpdate();

            // Generate confirmation message
            if (rowsInserted > 0) {
                out.println("<html><body>");
                out.println("<h1>Booking Successful!</h1>");
                out.println("<a href='index.jsp'>Go to Home Page</a>");
                out.println("</body></html>");
            } else {
                out.println("<html><body>");
                out.println("<h1>Something went wrong!</h1>");
                out.println("<p>We couldn't process your booking. Please try again later.</p>");
                out.println("<a href='index.jsp'>Go to Home Page</a>");
                out.println("</body></html>");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println("<html><body>");
            out.println("<h1>Error!</h1>");
            out.println("<p>An error occurred: " + e.getMessage() + "</p>");
            out.println("<a href='index.jsp'>Go to Home Page</a>");
            out.println("</body></html>");
        } finally {
            // Close resources
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            out.close();
        }
    }
}
