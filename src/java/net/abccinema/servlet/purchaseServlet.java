package net.abccinema.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.abccinema.connection.DbCon;
import net.abccinema.model.purchase;
import net.abccinema.model.purchaseDao;

@WebServlet(name = "purchaseServlet", urlPatterns = {"/purchaseServlet"})

public class purchaseServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            // Retrieve form parameters
            String user_name = request.getParameter("user_name");
            String phoneNumber = request.getParameter("phoneNumber");
            String user_email = request.getParameter("user_email");
            String adultCountStr = request.getParameter("adultCount");
            String childCountStr = request.getParameter("childCount");
            String totalPriceStr = request.getParameter("amount");
            String paymentMethod = request.getParameter("paymentMethod");

            // Validate inputs
            if (user_name == null || phoneNumber == null || user_email == null 
                    || adultCountStr == null || childCountStr == null || totalPriceStr == null 
                    || user_name.isEmpty() || phoneNumber.isEmpty() || user_email.isEmpty()
                    || adultCountStr.isEmpty() || childCountStr.isEmpty() || totalPriceStr.isEmpty()) {
                response.sendRedirect("checkout.jsp?error=invalidInput");
                return;
            }

            // Convert string inputs to appropriate data types
            int adultCount = Integer.parseInt(adultCountStr);
            int childCount = Integer.parseInt(childCountStr);
            double amount = Double.parseDouble(totalPriceStr.replace(",", ""));

            // Handle any file upload (optional if needed for purchase receipts, etc.)
            // Part filePart = request.getPart("receipt"); // Uncomment if you need to handle file uploads

            // Create a purchase object
            purchase newPurchase = new purchase();
            newPurchase.setUser_name(user_name);
            newPurchase.setPhoneNumber(phoneNumber);
            newPurchase.setUser_email(user_email);
            newPurchase.setAdultTickets(adultCount);
            newPurchase.setChildTickets(childCount);
            newPurchase.setTotalAmount(amount);
            newPurchase.setPaymentMethod(paymentMethod);

            // Insert the purchase into the database
//            purchaseDao purchaseDao = new purchaseDao(DbCon.getConnection());
//            boolean isInserted = purchaseDao.insertPurchase(newPurchase);

            // Handle response based on success or failure
            purchaseDao dao = new purchaseDao(DbCon.getConnection());
            if (dao.insertPurchase(newPurchase)) {
                response.sendRedirect("checkout.jsp?success=true");
            } else {
                response.sendRedirect("checkout.jsp?error=insertFailed");
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            response.sendRedirect("checkout.jsp?error=exception");
        }
    }
}
