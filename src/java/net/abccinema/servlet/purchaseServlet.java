package net.abccinema.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class purchaseServlet
 */
@WebServlet(name = "purchaseServlet", urlPatterns = {"/purchaseServlet"})
public class purchaseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

   
    public purchaseServlet() {
        super();
    }

   
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
        doGet(request, response);
    }
}
