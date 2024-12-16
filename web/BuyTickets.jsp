<%-- 
    Document   : BuyTickets
    Created on : Nov 10, 2024, 4:42:02 AM
    Author     : gavin
--%>
<%@page import="net.abccinema.model.buytickets"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
//    HttpSession customerSession = request.getSession(false);
//    if (customerSession == null || customerSession.getAttribute("customer_id") == null) {
//        String originalUrl = request.getRequestURI();
//        if (request.getQueryString() != null) {
//            originalUrl += "?" + request.getQueryString();
//        }
//        request.getSession(true).setAttribute("redirectAfterLogin", originalUrl);
//        response.sendRedirect("/PUSL2024_Group_Project/Sign in.jsp");
//        return;
//    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Buy Tickets</title>
        <%@include file="components/navbar.jsp" %>
        <%@include file="components/allCdn.jsp" %>

    </head>
    <body style="background-color: #0D0C0C;">
        <hr style="border-top: 3px solid #D4AF37;">
        <div style="background-color: #000000; padding-top: 20px;">
            <p class="Custom-title" data-text="Buy Tickets">Buy Tickets</p>
        </div>
        <hr style="border-top: 3px solid #D4AF37;">
        <%//            List<buytickets> movies = (List<buytickets>) request.getAttribute("movies");
//            if (movies == null) {
//                System.out.println("Movies attribute is null in JSP");
//            } else {
//                System.out.println("Movies attribute in JSP: " + movies);
//            }
%>



        <div id="movie-container">
            <!--            <div id="time-container"></div>-->

        </div>
        <div class="error-message" style="color: red;"></div>
        <%@include file="components/footer.jsp"%>
        <script src="./js/buyticketsjavascript.js"></script>

    </body>
</html>
