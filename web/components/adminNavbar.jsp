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
        <a class="navbar-brand" href="MovieManage.jsp">
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
                    <a class="nav-link <%= currentURL.contains("MovieManage.jsp") ? "active" : ""%>" aria-current="page" href="MovieManage.jsp">Movie Manaage</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <%= currentURL.contains("adminBooking.jsp") ? "active" : ""%>" href="adminBooking.jsp">Bookings</a>
                </li>
            </ul>
            <ul class="navbar-nav">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color: #D4AF37;">
                        Welcome to Admin Panel
                    </a>
                    <ul class="dropdown-menu dropdown-menu-dark dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="Home">Logout</a></li>
                    </ul>
                </li>
            </ul>
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