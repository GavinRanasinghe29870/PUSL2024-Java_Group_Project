<%-- 
    Document   : BuyTickets
    Created on : Nov 10, 2024, 4:42:02 AM
    Author     : gavin
--%>
<%@ taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core"%>
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

        <link rel="stylesheet" type="text/css" href="./CSS/buytickets.css" />
        <link link-style href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body style="background-color: #0D0C0C;">
        <%@include file="components/navbar.jsp" %>

        <d:if test="${not empty succMsg}">
            <div class="alert alert-success text-center" role="alert" style="width: 40%; margin: 0 auto; font-weight: bold; font-size: 1.5em;">
                ${succMsg}
            </div>
            <d:remove var="succMsg" scope="session" />
        </d:if>
        
        <d:if test="${not empty latedMsg}">
            <div class="alert alert-danger text-center" role="alert" style="width: 40%; margin: 0 auto; font-weight: bold;">
                ${latedMsg}
            </div>
            <d:remove var="latedMsg" scope="session" />
        </d:if>

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

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.4/jquery.rateyo.min.js" integrity="sha512-09bUVOnphTvb854qSgkpY/UGKLW9w7ISXGrN0FR/QdXTkjs0D+EfMFMTB+CGiIYvBoFXexYwGUD5FD8xVU89mw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="./js/buyticketsjavascript.js"></script>

        <%@include file="components/footer.jsp"%>

    </body>
</html>
