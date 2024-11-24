<%-- 
    Document   : singleMoviepage
    Created on : Nov 20, 2024, 4:05:03 PM
    Author     : Vihanga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Single Movie Page</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/singlemovie.css" /> 
        <%@include file = "components/navbar.jsp" %>
        <%@include file = "components/allCdn.jsp" %>
    </head>
    <style>
       .home{
    width: 100%;
    height: 90vh;
    background-image: linear-gradient(rgba(0,0,0,0.3),rgba(0,0,0,0.3)),url(Images/SingleMovie.svg);
    background-repeat: no-repeat;
    background-size: cover;
    background-position: 88%;
}

        
        
        
        
        
        
        
        
        
        
    </style>
    
    <body>
        <!-- Home Section -->
        <section id="home">
            <div class="content">
            <div style="background-color:#D4AF37; margin-right:65%;">
                <h1 class="display-4 fw-bold ps-4">Despicable ME 4</h1>
            </div>
                <button id="btn">Buy Tickets</button>
            </div>
        
           

                </div>
            </div>



        </section>
        
    </body>
</html>

