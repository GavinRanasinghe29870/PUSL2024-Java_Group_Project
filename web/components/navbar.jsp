<%@page import="net.abccinema.model.User"%>
<%@ taglib prefix="n" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<%
    String currentURL = request.getRequestURI();
    String contextPath = request.getContextPath();

    System.out.println("Current URL: " + currentURL);
    System.out.println("Context Path: " + contextPath);

    User user = (User) session.getAttribute("currentUser");
    String firstName = user != null ? user.getFullName().split(" ")[0] : "";
%>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/style.css" /> 

<nav class="navbar sticky-top navbar-expand-lg">
    <div class="container-fluid">
        <a class="navbar-brand" href="Home">
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
                    <a class="nav-link <%= currentURL.equals(contextPath + "/") || currentURL.contains("index.jsp") ? "active" : ""%>" aria-current="page" href="Home">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <%= currentURL.contains("movies.jsp") ? "active" : ""%>" href="MovieServlet">Movies</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <%= currentURL.contains("BuyTickets.jsp") || currentURL.contains("SeatBooking.jsp") || currentURL.contains("checkout.jsp") ? "active" : ""%>" href="BuyTickets.jsp">Buy Tickets</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <%= currentURL.contains("ContactUs.jsp") ? "active" : ""%>" href="ContactUs.jsp">Contact Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <%= currentURL.contains("aboutUs.jsp") ? "active" : ""%>" href="aboutUs.jsp">About Us</a>
                </li>
            </ul>

            <n:if test="${not empty currentUser}">
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color: #D4AF37;">
                            Hey, <%= firstName%>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-dark dropdown-menu-end" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="profile.jsp?id=<%= user.getUserId() %>">View Profile</a></li>
                            <li><a class="dropdown-item" href="Sign in.jsp">Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </n:if>

            <n:if test="${empty currentUser}">
                <a href="Sign in.jsp" class="btn btn-login">Sign in | Sign up</a>
            </n:if>

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