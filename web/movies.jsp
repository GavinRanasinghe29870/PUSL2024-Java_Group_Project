<%@page import="java.util.List" %>
<%@page import="net.abccinema.model.Movie" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Movies</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <%@include file="components/navbar.jsp" %>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/movies.css" />
        <script>
            function buyTickets(movieId, movieName, timeSlots, adultTicketPrice, childTicketPrice) {
                window.location.href = "http://localhost:8080/PUSL2024_Group_Project/SeatBooking.jsp?id="
                                        + encodeURIComponent(movieId)
                                        + "&name=" + encodeURIComponent(movieName)
                                        + "&timeSlots=" + encodeURIComponent(timeSlots)
                                        + "&adultTicketPrice=" + encodeURIComponent(adultTicketPrice)
                                        + "&childTicketPrice=" + encodeURIComponent(childTicketPrice);
            }
        </script>
    </head>
    <body style="background-color: #0D0C0C">
        <hr style="border-top: 3px solid #D4AF37;">
        <div style="background-color: #000000; padding-top: 20px;">
            <p class="Custom-title" data-text="Movies">Movies</p>
        </div>
        <hr style="border-top: 3px solid #D4AF37;">
        <div class="container">
            <h2 style="color: #D4AF37;">Now Showing</h2>
            <hr style="border-top: 3px solid #D4AF37;">
            <div class="card-container">
                <%
                    List<Movie> nowShowing = (List<Movie>) request.getAttribute("nowShowing");
                    if (nowShowing != null) {
                        for (Movie movie : nowShowing) {
                %>
                <div class="card">
                    <img src="./Images/<%= movie.getImageUrl() %>" alt="<%= movie.getTitle() %>" />
                    <h5><%= movie.getTitle() %></h5>
                    <a href="http://localhost:8080/PUSL2024_Group_Project/singleMoviepage.jsp?id=<%= movie.getId() %>" 
                       class="transparent-button">More</a>
                    <button class="btn btn-warning" 
                        onclick="buyTickets('<%= movie.getId() %>', 
                                            '<%= movie.getTitle() %>', 
                                            '<%= movie.getTimeSlots() %>', 
                                            '<%= movie.getAdultTicketPrice() %>', 
                                            '<%= movie.getChildTicketPrice() %>')">
                        BUY TICKETS
                    </button>
                </div>
                <%
                        }
                    }
                %>
            </div>
        </div>
        <%@include file="components/footer.jsp" %>
    </body>
</html>
