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
        <link rel="stylesheet" type="text/css" href="./CSS/smovie.css"/>
        <link link-style href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
    <body style="background-color: #0D0C0C;">
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.4/jquery.rateyo.min.js" integrity="sha512-09bUVOnphTvb854qSgkpY/UGKLW9w7ISXGrN0FR/QdXTkjs0D+EfMFMTB+CGiIYvBoFXexYwGUD5FD8xVU89mw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>    
      <script src="./js/singlemovie.js"></script>
             
                 
 <!-- Footer -->
         <%@include file="components/footer.jsp"%>
    </body>
</html>     

