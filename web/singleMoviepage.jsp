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
        <%@include file = "components/allCdn.jsp" %>
        <link rel="stylesheet" type="text/css" href="./CSS/smovie.css" />
        <%@include file = "components/navbar.jsp" %>
    </head>

    <body>

        <div class="main">
            <div style="background-color:#D4AF37; margin-right:57.5%; text-align: center;">
                <h1 class=" fw-bold ps-4">Despicable ME 4</h1>
            </div>
        </div>

        <div class="content">
            <img src="Images/SingleMovie.svg" class="img-fluid">
            <button class="btn">BUY TICKETS</button>
        </div>

        <div class="desc">
            <div class="col">
                Gru, Lucy, Margo, Edith, and Agnes welcome a new member to the family, Gru Jr, who is intent on tormenting his dad. Gru faces a new nemesis in Maxime Le Mal and his girlfriend Valentina, and the family is forced to go on the run.
            </div>
        </div>

        <div class="genre">
            <div class="col1">
                
                    <p class="genre-header">GENRES:  <button class="button button1">Comedy</button> <button class="button button2">Animation</button> <button class="button button3">Family</button> <button class="button button4">Sci-Fi</button> </p> 
                
            </div>
        </div>
             <div class="movie">
            <div class="col2">
                <h4 class="title">Stars : <p class="text text1">Steve Carell | Pierre Coffin | Kristen Wiig | Sofía Vergara</p> </h4> <br>
                <h4 class="title">Directors : <p class="text-text2">Zack Snyder | Christopher Nolan | Kristen Wiig</p></h4> <br>
                <h4 class="title">Writers : <p class="text-text3">Steve Carell | Pierre Coffin</p> </h4> <br>
                <h4 class="title">Producers : <p class="text-text4">Marty Bowen | Cristobal Tapia De Veer</p></h4> <br>
                <h4 class="title">Music :  <p class="text-text5">Cristobal Tapia De Veer</p></h4>
              
            </div>
        </div>
        
        <div class="movie-btn">
            <button class="btn">BUY TICKETS</button>
        </div>
        
      

        
 <!-- Footer -->
         <%@include file="components/footer.jsp"%>
    </body>
</html>     
        
            
            
           


