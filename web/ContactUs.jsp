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
        <div class="row">
            <div class="col">
                <div class="container-fluid">
                    <p>If you would like to reach us by email, please complete the form below, and we will get in contact with you as soon as possible.</p>
                </div>
                <div class="container-fluid" style="background-color: #D4AF37">
                    <form action="action">
                        <label for="name">Name</label>
                        <input type="text" name="name"> 
                            
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
