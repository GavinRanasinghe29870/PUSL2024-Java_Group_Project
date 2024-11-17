<%-- 
    Document   : BuyTickets
    Created on : Nov 10, 2024, 4:42:02 AM
    Author     : gavin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="net.abccinema.connection.DbCon" %>
<%@page import="net.abccinema.model.*" %>
<%@page import="net.abccinema.servlet.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buy Tickets</title> 
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/buytickets.css" /> 
        <%@include file = "components/navbar.jsp" %>
        <%@include file = "components/allCdn.jsp" %>
    </head>
    <body style="background-color: #0D0C0C ">
        <hr style="border-top: 3px solid #D4AF37;">
        <div style="background-color: #000000; padding-top:20px;">
            <p class="Custom-title" data-text="Buy Tickets">Buy Tickets</p>
        </div>
        <hr style="border-top: 3px solid #D4AF37;">

        <%--Dropdown Section--%>
        <div class="d-flex">
            <div style="color: #D4AF37;" class="dropdown px-3"> 
                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" id="dropdownButton1"> 
                    Dropdown 1 
                </button> 
                <ul class="dropdown-menu"> 
                    <li><a class="dropdown-item" href="#">Action 1</a></li> 
                    <li><a class="dropdown-item" href="#">Another action 1</a></li> 
                    <li><a class="dropdown-item" href="#">Something else here 1</a></li> 
                </ul> 
            </div> 

            <div class="dropdown px-3"> 
                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" id="dropdownButton2"> 
                    Dropdown 2 
                </button> 
                <ul class="dropdown-menu"> 
                    <li><a class="dropdown-item" href="#">Action 2</a></li> 
                    <li><a class="dropdown-item" href="#">Another action 2</a></li> 
                    <li><a class="dropdown-item" href="#">Something else here 2</a></li> 
                </ul> 
            </div>

            <div class="dropdown px-3"> 
                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" id="dropdownButton3"> 
                    Dropdown 3 
                </button> 
                <ul class="dropdown-menu"> 
                    <li><a class="dropdown-item" href="#">Action 3</a></li> 
                    <li><a class="dropdown-item" href="#">Another action 3</a></li> 
                    <li><a class="dropdown-item" href="#">Something else here 3</a></li> 
                </ul> 
            </div> 
        </div>        

        <div class="custom-box box container-fluid" id="hoverBox">
            <h1>Despicable ME 4</h1>
            <div class="container">
                <div class="row">
                    <div class="col">
                        <p class="mt-5"> Gru, Lucy, Margo, Edith, and Agnes welcome a new 
                            member to the family, Gru Jr., who is intent on 
                            tormenting his dad. Gru faces a new nemesis in 
                            Maxime Le Mal and his girlfriend Valentina, and the 
                            family is forced to go on the run.
                        </p>
                        <div class="time-box d-flex">
                            <div class="container-fluid">
                                <center>
                                    <button class="time-text"> 10.30 a.m</button>
                                </center>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <img src="Images/Despicable ME 4.jpg" width="width" height="height" alt="alt"/>
                    </div>
                </div>
            </div>
        </div>


        <script>
            const dropdownButtons = document.querySelectorAll('.dropdown-toggle');

            dropdownButtons.forEach(button => {
                const originalText = button.textContent;

                const dropdownMenu = button.nextElementSibling;
                const dropdownItems = dropdownMenu.querySelectorAll('.dropdown-item');

                dropdownItems.forEach(item => {
                    item.addEventListener('click', () => {
                        button.textContent = item.textContent;
                    });
                });

                button.addEventListener('click', () => {

                    button.textContent = originalText;
                });
            });
        </script>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
