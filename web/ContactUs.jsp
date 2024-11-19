<%-- 
    Document   : ContactUs
    Created on : Nov 19, 2024, 6:51:27 PM
    Author     : gavin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/contactus.css"/>

        <%@include file = "components/navbar.jsp" %>
        <%@include file = "components/allCdn.jsp" %>
    </head>
    <body style="background-color: #0D0C0C ">
        <hr style="border-top: 3px solid #D4AF37;">
        <div style="background-color: #000000; padding-top:20px;">
            <p class="Con-Custom-title" data-text="Contact Us">Contact Us</p>
        </div>
        <hr style="border-top: 3px solid #D4AF37;">
    </body>
</html>
