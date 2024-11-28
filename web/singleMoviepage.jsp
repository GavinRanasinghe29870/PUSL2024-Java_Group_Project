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

        <div class="container">
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

        <div class="row">
            <div class="col-12 ">
                <div class="d-flex justify-content-start align-items-center">
                    <p class="genre-header">GENRES:</p>
                    
                    <div class="genre-tag bg-secondary text-light p-2 me-2">Comedy</div>
                    <div class="genre-tag bg-secondary text-light p-2 me-2">Animation</div>
                    <div class="genre-tag bg-secondary text-light p-2 me-2">Family</div>
                    <div class="genre-tag bg-secondary text-light p-2">Sci-Fi</div>
                </div>
            </div>
             <div class="row">
            <div class="col-12 p-4 padding-left">
                <h4 class="text-left">Stars</h4>
                <p class="text-left">Steve Carell | Pierre Coffin | Kristen Wiig | Sofía Vergara</p>
                <h4 class="text-left">Directors</h4>
                <p class="text-left">Zack Snyder | Christopher Nolan | Kristen Wiig</p>
                <h4 class="text-left">Writers</h4>
                <p class="text-left">Steve Carell | Pierre Coffin</p>
                <h4 class="text-left">Producers</h4>
                <p class="text-left">Marty Bowen | Cristobal Tapia De Veer</p>
                <h4 class="text-left">Music</h4>
                <p class="text-left">Cristobal Tapia De Veer</p>
            </div>
        </div>
        <div class="row">
            <div class="col-12 bg-dark text-center p-4">
                <button type="button" class="btn btn-primary">BUY TICKETS</button>
            </div>
        </div>
        </div>

        <%@include file="components/footer.jsp" %>

    </body>
</html>     
        
            
            
           


