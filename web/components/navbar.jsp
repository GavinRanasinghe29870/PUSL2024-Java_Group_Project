<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String currentURL = request.getRequestURI();
    String contextPath = request.getContextPath();
    
    System.out.println("Current URL: " + currentURL);
    System.out.println("Context Path: " + contextPath);
%>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/style.css" /> 

<nav class="navbar sticky-top navbar-expand-lg">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">
            <img src="Images/navbarlogo.png" alt="" width="100px" class="d-inline-block align-text-top">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link <%= currentURL.equals(contextPath + "/") || currentURL.contains("index.jsp") ? "active" : "" %>" aria-current="page" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <%= currentURL.contains("movies.jsp") ? "active" : "" %>" href="MovieServlet">Movies</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <%= currentURL.contains("BuyTickets.jsp") || currentURL.contains("SeatBooking.jsp") || currentURL.contains("checkout.jsp") ? "active" : "" %>" href="BuyTickets.jsp">Buy Tickets</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <%= currentURL.contains("ContactUs.jsp") ? "active" : "" %>" href="ContactUs.jsp">Contact Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <%= currentURL.contains("aboutUs.jsp") ? "active" : "" %>" href="aboutUs.jsp">About Us</a>
                </li>
            </ul>
            <a href="login.html" class="btn btn-login">Sign in | Sign up</a>
            <style>
                .btn-login {
                    background-color: #D4AF37;
                    color: #000000;
                }

                .btn-login:hover {
                    background-color: #FFF282;
                    color: #000000;
                }
            </style>
        </div>
    </div>
</nav>