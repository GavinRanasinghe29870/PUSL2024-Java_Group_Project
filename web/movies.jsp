<%-- 
    Document   : movies
    Created on : Nov 16, 2024, 11:29:37 PM
    Author     : Udula Dissanayake
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movies</title> 
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/buytickets.css" /> 
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/movies.css" /> 
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/index.css" /> 
        <%@include file = "components/navbar.jsp" %>
        <%@include file = "components/allCdn.jsp" %>
        
    </head>
        <body style="background-color: #0D0C0C ">
        <hr style="border-top: 3px solid #D4AF37;">
        <div style="background-color: #000000; padding-top:20px;">
        <p class="Custom-title" data-text="Movies">Movies</p>
        </div>
        <hr style="border-top: 3px solid #D4AF37;">
        

        <div class="container">
        <div style="padding-top:20px;">
        <p class="Custom-titlem" data-text="Now Showing">Now Showing</p>
        </div>
        <hr style="border-top: 3px solid #D4AF37;">
        
        <div class="card-container">
        <div class="card">
            <img src="./Images/venom.jpg" alt="Mufasa">
            <p>MUFASA: THE LION KING</p>
            <p>IN THEATERS</p>
            <p>DECEMBER 20</p>
            <a href="#">MORE INFO</a>
            <button>BUY TICKETS</button>
        </div>

        <div class="card">
            </div>
        </div>    
        
           
        
       
        <div style=" padding-top:80px;">
        <p class="Custom-titlem" data-text="Coming Soon">Coming Soon</p>
        </div>
        <hr style="border-top: 3px solid #D4AF37;">
        
        </div>
         
   
                    
        <div style=" padding-top:80px;">
        <%@include file = "components/footer.jsp" %>
        </div>
    </body>
</html>