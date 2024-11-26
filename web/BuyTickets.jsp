<%-- 
    Document   : BuyTickets
    Created on : Nov 10, 2024, 4:42:02 AM
    Author     : gavin
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="net.abccinema.connection.DbCon" %>
<%@page import="net.abccinema.model.*" %>
<%@page import="net.abccinema.servlet.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buy Tickets</title> 
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
        <div class="cusDrop container d-flex">
            <div class="cusDrop1 dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Dropdown button
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#">Action</a></li>
                    <li><a class="dropdown-item" href="#">Another action</a></li>
                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                </ul>
            </div>

            <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Dropdown button
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#">Action</a></li>
                    <li><a class="dropdown-item" href="#">Another action</a></li>
                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                </ul>
            </div>
        </div>

        <%
            try {
                List<buytickets> movies = new buyticketsDao(DbCon.getConnection()).getMovies();

                if (movies != null && !movies.isEmpty()) {
                    for (buytickets movie : movies) {%>
        <div class="custom-box box container-fluid" id="hoverBox">
            <h1><%= movie.getName()%></h1>
            <div class="container">
                <div class="row">
                    <div class="col">
                        <p class="mt-5"> <%= movie.getDescription()%>
                        </p>
                        <div class="time-box d-flex">
                            <div class="container-fluid">
                                <center>
                                    <button class="time-text"> <%= movie.getTime()%></button>
                                </center>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <img src="Images/<%= movie.getImage()%>" width="80%" height="auto" alt="<%= movie.getImage()%>"/>
                    </div>
                </div>
            </div>
        </div>
        <%  }
                } else {
                    out.println("No movies found.");
                }
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        %>





        <!--        <script>
                    $(document).ready(function(){
                        loadDatesAndMovies();
                        $("#dateDropdown, #movieDropdown").on("click","a", function(){
                            var selectedDate = $("#dateFilterDropdown").text().trim();
                            var selectedMovieName = $("movieFilterDropdown").text().trim();
                            
                            loadMovies(selectedDate, selectedMovieName);
                        });
                        function loadDatesAndMovies(){
                            $.ajax({
                                url: "buyticketsServlet",
                                type: "GET",
                                success: function(response){
                                    var dates = response.movies;
                                    var movies = response.movies;
                                    
                                    $("#dateDropdown").empty();
                                    $.each(dates, function(index, dates){
                                        $("#dateDropdown").append("<li><a class = 'dropdown-item' href='#'>" + dates + "</a></li>");
                                    });
                                    $("#movieDropdown").empty();
                                    $.each(movies, function(index, movies){
                                        $("#movieDropdown").append("<li><a class = 'dropdown-item' href='#'>" + movies + "</a></li>");
                                });
                            },
                            error: function(error){
                                console.error("Error fetching dates and movies:", error);
                            }
                            });
                        }
                    });
                </script>-->



    </body>
</html>
