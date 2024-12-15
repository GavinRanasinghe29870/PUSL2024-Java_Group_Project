<%-- 
    Document   : singleMoviepage
    Created on : Nov 20, 2024, 4:05:03 PM
    Author     : Vihanga
--%>



<%@page import="net.abccinema.model.singleMovie"%>
<%@page import="java.util.List"%>

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
        
            <div class="content"> 
<!--           <button class="btn">BUY TICKETS</button>-->
        </div>


        
        </div>
        <div id="smovie-container">
            
        </div>
<!--        <div class="genre">
            <div class="col1">
                
                <p class="genre-header">GENRES:  <button class="button button1"></button> </p> 
                
            </div>
        </div>
             <div class="movie">
            <div class="col2">
                <h4 class="title">Stars :  <p class="text-text2"></p></h4> <br>
                <h4 class="title">Directors :  <p class="text-text2"></p></h4> <br>
                <h4 class="title">Writers :  <p class="text-text2"></p> </h4> <br>
                <h4 class="title">Producers :   <p class="text-text2"></p></h4> <br>
                <h4 class="title">Music :   <p class="text-text2"></p></h4>
              
            </div>
           
        </div>-->
        
        <div class="movie-btn">
            <button class="btn">BUY TICKETS</button>
        </div>
                
      <script src="./js/singlemovie.js"></script>
             
                 
 <!-- Footer -->
         <%@include file="components/footer.jsp"%>
    </body>
</html>     

