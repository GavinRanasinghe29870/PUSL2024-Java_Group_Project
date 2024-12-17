<%-- 
    Document   : SingleBuyTickets.jsp
    Created on : Dec 16, 2024, 8:38:42 PM
    Author     : gavin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Single Buy Tickets</title>
        <%@include file = "components/navbar.jsp" %>
        
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/SingleBuyTickets.css" />
        <link link-style href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body style="background-color: #000000">
        <div id="sbmoviecontainer"></div>
        
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/SingleBuyTickets.js"></script>
        <%--<%@include file="components/footer.jsp"%>--%>
    </body>
</html>
