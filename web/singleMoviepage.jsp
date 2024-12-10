<%-- 
    Document   : singleMoviepage
    Created on : Nov 20, 2024, 4:05:03 PM
    Author     : Vihanga
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Single Movie Page</title>
       <%@include file = "components/navbar.jsp" %>
        <%@include file = "components/allCdn.jsp" %>
</head>
    <body>

        

        
        <div class="main">
            <div style="background-color:#D4AF37; margin-right:57.5%; text-align: center;">
                   
                <h1 class=" fw-bold ps-4">${singleMovie.name}</h1>
                
            </div>
        </div>

        <div class="content">
            <img src="${singleMovie.imageURL}"  class="img-fluid">

            <button class="btn">BUY TICKETS</button>
        </div>

        <div class="desc">
            <div class="col">
               
                ${singleMovie.movieDesc}

            </div>
        </div>

        <div class="genre">
            <div class="col1">
                
                <p class="genre-header">GENRES: ${singleMovie.genres} <button class="button button1">Comedy</button> <button class="button button2">Animation</button> <button class="button button3">Family</button> <button class="button button4">Sci-Fi</button> </p> 
                
            </div>
        </div>
             <div class="movie">
            <div class="col2">
                <h4 class="title">Stars : ${singleMovie.stars} </h4> <br>
                <h4 class="title">Directors : ${singleMovie.directors}<p class="text-text2">Zack Snyder | Christopher Nolan | Kristen Wiig</p></h4> <br>
                <h4 class="title">Writers :  ${singleMovie.writers}<p class="text-text3">Steve Carell | Pierre Coffin</p> </h4> <br>
                <h4 class="title">Producers :  ${singleMovie.producers}<p class="text-text4">Marty Bowen | Cristobal Tapia De Veer</p></h4> <br>
                <h4 class="title">Music :   ${singleMovie.music}<p class="text-text5">Cristobal Tapia De Veer</p></h4>
              
            </div>
           
        </div>
        
        <div class="movie-btn">
            <button class="btn">BUY TICKETS</button>
        </div>
        
            

        
 <!-- Footer -->
         <%@include file="components/footer.jsp"%>
         
         
     
    </body>
</html>     
        
            
            
           


