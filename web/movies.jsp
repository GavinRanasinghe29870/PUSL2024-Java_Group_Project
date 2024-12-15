<%@page import="java.util.List" %>
<%@page import="net.abccinema.model.Movie" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Movies</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/movies.css" />
        <%@include file="components/allCdn.jsp"%>
        <%@include file="components/navbar.jsp" %>
        <script>
            function buyTickets(movieName) {
                alert("Redirecting to buy tickets for: " + movieName);
                // Here you can send the movie name to the backend using a fetch request
                // Example: fetch('/BuyTicketsServlet?movie=' + encodeURIComponent(movieName));
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
                    <button class="btn btn-warning" onclick="buyTickets('<%= movie.getTitle() %>')">BUY TICKETS</button>
                </div>
                <%
                        }
                    }
                %>
            </div>

            <h2 style="color: #D4AF37; margin-top: 50px;">Coming Soon</h2>
            <hr style="border-top: 3px solid #D4AF37;">
            <div class="card-container">
                <%
                    List<Movie> comingSoon = (List<Movie>) request.getAttribute("comingSoon");
                    if (comingSoon != null) {
                        for (Movie movie : comingSoon) {
                %>
                <div class="card">
                    <img src="./Images/<%= movie.getImageUrl() %>" alt="<%= movie.getTitle() %>" />
                    <h5><%= movie.getTitle() %></h5>
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
