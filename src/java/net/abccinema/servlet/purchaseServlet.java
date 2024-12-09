 package net.abccinema.servlet;

import net.abccinema.model.purchase;
import net.abccinema.model.purchaseDao;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Handles purchase requests and saves data to the database
 */
@WebServlet(name = "purchaseServlet", urlPatterns = {"/purchaseServlet"})
public class purchaseServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        try {
            // Retrieve data
            String name = request.getParameter("name");
            String phoneNumber = request.getParameter("phoneNumber");
            String email = request.getParameter("email");
            int adultTickets = Integer.parseInt(request.getParameter("adultTickets"));
            int childTickets = Integer.parseInt(request.getParameter("childTickets"));
            double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));
            String paymentMethod = request.getParameter("paymentMethod");

            // new purchase object
            purchase purchase = new purchase();
            purchase.setName(name);
            purchase.setPhoneNumber(phoneNumber);
            purchase.setEmail(email);
            purchase.setAdultTickets(adultTickets);
            purchase.setChildTickets(childTickets);
            purchase.setTotalAmount(totalAmount);
            purchase.setPaymentMethod(paymentMethod);

            
            purchaseDao dao = new purchaseDao();
            boolean isInserted = dao.insertPurchase(purchase);

            
            if (isInserted) {
                
                out.println("<html><body>");
                out.println("<h1>Booking Successful!</h1>");
                out.println("<p>Thank you for your purchase.</p>");
                out.println("<a href='index.jsp'>Go to Home Page</a>");
                out.println("</body></html>");
            } else {
               
                out.println("<html><body>");
                out.println("<h1>Something went wrong!</h1>");
                out.println("<p>We couldn't process your booking. Please try again later.</p>");
                out.println("<a href='index.jsp'>Go to Home Page</a>");
                out.println("</body></html>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            // error handling message
            out.println("<html><body>");
            out.println("<h1>Something went wrong!</h1>");
            out.println("<p>We couldn't process your booking. Please try again later.</p>");
            out.println("<a href='index.jsp'>Go to Home Page</a>");
            out.println("</body></html>");
        } finally {
            out.close(); 
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }
}
