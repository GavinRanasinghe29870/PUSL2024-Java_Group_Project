package net.abccinema.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import net.abccinema.connection.DbCon;
import net.abccinema.model.User;
import net.abccinema.model.purchase;
import net.abccinema.model.purchaseDao;
import net.abccinema.model.*;

@WebServlet(name = "purchaseServlet", urlPatterns = {"/purchaseServlet"})
public class purchaseServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            HttpSession session = request.getSession();
            User currentUser = (User) session.getAttribute("currentUser");

            if (currentUser == null) {
                session.setAttribute("failedMsg", "You Have to Login First");
                response.sendRedirect("login.jsp");
                return;
            }

            // Retrieve form parameters
            int userId = currentUser.getUserId();
            System.out.println("purchaseServlet: Retrieved userId from session: " + userId); // Debugging statement

            String user_name = request.getParameter("user_name");
            String phoneNumber = request.getParameter("phoneNumber");
            String user_email = request.getParameter("user_email");
            String adultCountStr = request.getParameter("adultCount");
            String childCountStr = request.getParameter("childCount");
            String totalPriceStr = request.getParameter("amount");
            String paymentMethod = request.getParameter("paymentMethod");
            String m_idStr = request.getParameter("id");
            String m_timeslot = request.getParameter("timeSlots");
            String seat_numbers = request.getParameter("selectedSeats");

            // Validate inputs
            if (user_name == null || phoneNumber == null || user_email == null
                    || adultCountStr == null || childCountStr == null || totalPriceStr == null
                    || m_idStr == null || m_timeslot == null || seat_numbers == null 
                    || user_name.isEmpty() || phoneNumber.isEmpty() || user_email.isEmpty()
                    || adultCountStr.isEmpty() || childCountStr.isEmpty() || totalPriceStr.isEmpty()
                    || m_idStr.isEmpty() || m_timeslot.isEmpty() || seat_numbers.isEmpty()) {
                System.out.println("purchaseServlet: Input validation failed!");
                response.sendRedirect("checkout.jsp?error=invalidInput");
                return;
            }

            // Convert string inputs to appropriate data types
            int adultCount = Integer.parseInt(adultCountStr);
            int childCount = Integer.parseInt(childCountStr);
            double amount = Double.parseDouble(totalPriceStr.replace(",", ""));
            int m_id = Integer.parseInt(m_idStr);

            // Create a purchase object
            purchase newPurchase = new purchase();
            newPurchase.setUserId(userId); // Set the user ID
            System.out.println("purchaseServlet: Set userId in purchase object: " + userId); // Debugging statement

            newPurchase.setUser_name(user_name);
            newPurchase.setPhoneNumber(phoneNumber);
            newPurchase.setUser_email(user_email);
            newPurchase.setAdultTickets(adultCount);
            newPurchase.setChildTickets(childCount);
            newPurchase.setTotalAmount(amount);
            newPurchase.setPaymentMethod(paymentMethod);
            newPurchase.setM_id(m_id);
            newPurchase.setM_timeslot(m_timeslot);
            newPurchase.setSeat_numbers(seat_numbers);

            // Insert purchase record using DAO
            purchaseDao dao = new purchaseDao(DbCon.getConnection());
            if (dao.insertPurchase(newPurchase)) {
                System.out.println("purchaseServlet: Insert successful.");
                response.sendRedirect("checkout.jsp?success=true");
            } else {
                System.out.println("purchaseServlet: Insert failed!");
                response.sendRedirect("checkout.jsp?error=insertFailed");
            }

        } catch (NumberFormatException e) {
            e.printStackTrace();
            System.out.println("purchaseServlet: Invalid number format - " + e.getMessage());
            response.sendRedirect("checkout.jsp?error=numberFormat");
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("purchaseServlet: Exception occurred - " + ex.getMessage());
            response.sendRedirect("checkout.jsp?error=exception");
        } finally {
            out.close();
        }
    }
}