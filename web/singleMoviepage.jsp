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

        <%@include file = "components/navbar.jsp" %>
        <%@include file = "components/allCdn.jsp" %>
    </head>

    <body>
 
        <!-- head section -->
<div class="container">
    <div style="background-color:#D4AF37; margin-right:57.5%; text-align: center;">
                <h1 class=" fw-bold ps-4">Despicable ME 4</h1>
            </div>
</div>

        <!-- Image with button -->
    <div class="content">
        <img src="Images/SingleMovie.svg" class="img-fluid">
        <button class="btn">BUY TICKETS</button>
    </div>
        
       
        <div class="movie">
            
            <!-- Movie description -->
            
            <div class="desc">
                <div class="col">Gru, Lucy, Margo, Edith, and Agnes welcome a new member to the family, Gru Jr,who is intent on tormenting his dad. 
                 Gru faces a new nemesis in Maxime Le Mal and his girlfriend Valentina, and the family is forced to go on the run.</div>
            </div>
            
            <!-- Genres Section -->
            
            <div class="row2">
                <div class="col">GENRES : </div>
      
                <div style="background-color:#D4AF37; margin-right:77%; text-align: center;">
                    <h6>Comedy</h6>
<!--                <button>Animation</button>
                <button>Family</button>
                <button>Sci-Fi</button>-->
                </div>
            </div>
            
            
        </div>
            
            
           
</body>
</html>

