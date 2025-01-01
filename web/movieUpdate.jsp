<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="net.abccinema.model.movieinsert"%>
<%@page import="net.abccinema.model.moviereadDAO"%>
<%@page import="net.abccinema.connection.DbCon"%>
<%-- 
    Document   : movieUpdate
    Created on : Jan 1, 2025, 2:54:11 PM
    Author     : KATANA
--%>
<%
    String movieId = request.getParameter("id");
    moviereadDAO mdao = new moviereadDAO(DbCon.getConnection());
    movieinsert movie = mdao.getMovieById(movieId);
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Edit Movie</title>
        <link link-style href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/MovieManage.css" />
        <style>
            .sm-container {
                width: 40%;
                margin-top: 50px;
                padding: 30px;
                background-color: #444;
                border-radius: 20px;
            }
            </style>
    </head>
    <body>
        
        <div class="container sm-container">
            <h4 style="margin-bottom: 50px;">Edit Movie</h4>
            <form id="editMovieForm" action="movieupdateServlet" method="POST" enctype="multipart/form-data">
                <input type="hidden" name="movieId" id="editMovieId" value="<%=movie.getId()%>">
                <div class="form-group">
                    <label for="editMovieName">Movie Name:</label>
                   <input type="text" class="form-control" name="movieName" id="editMovieName" value="<%=movie.getName()%>">
                </div>
                <div class="form-group">
                    <label for="editMovieImage">Upload Movie Picture:</label>
                   <input type="file" class="form-control" name="movieImage" accept=".jpg, .png">
                    <p>Current Image: <%= movie.getImageName() %></p>
                </div>
                <div class="form-group">
                    <label for="editMovieDescription">Movie Description:</label>
                   <textarea class="form-control" name="movieDescription" id="editMovieDescription" rows="2"><%=movie.getDescription()%></textarea>
                </div>
                <div class="form-group">
                    <label for="editMovieTimeSlots">Time Slots:</label>
                    <div class="time-slot-group" id="editMovieTimeSlots">
                        <div class="form-check">
                             <input class="form-check-input" type="checkbox" name="timeSlots" value="10:30 AM" id="editSlot1">
                            <input class="form-check-input" type="checkbox" name="timeSlots" value="10:30 AM" id="editSlot1">
                            <label class="form-check-label" for="editSlot1">10:30 AM</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="timeSlots" value="02:10 PM" id="editSlot2">
                            <label class="form-check-label" for="editSlot2">02:10 PM</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="timeSlots" value="06:30 PM" id="editSlot3">
                            <label class="form-check-label" for="editSlot3">06:30 PM</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="timeSlots" value="10:15 PM" id="editSlot4">
                            <label class="form-check-label" for="editSlot4">10:15 PM</label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="editStartDate">Start Date:</label>
                    <input type="date" class="form-control" name="startDate" value="<%= movie.getStartDate() %>">
                </div>
                <div class="form-group">
                    <label for="editEndDate">End Date:</label>
                    <input type="date" class="form-control" name="endDate" value="<%= movie.getEndDate() %>">
                </div>
                <div class="form-group">
                    <label for="editMovieGenres">Genres:</label>
                     <input type="text" class="form-control" name="movieGenres" value="<%= movie.getGenres() %>">
                </div>
                <div class="form-group">
                    <label for="editMovieStars">Cast:</label>
                    <input type="text" class="form-control" name="movieStars" value="<%= movie.getCast() %>">
                </div>
                <div class="form-group">
                    <label for="editMovieDirectors">Directors:</label>
                    <input type="text" class="form-control" name="movieDirectors" value="<%= movie.getDirectors()%>">
                </div>
                <div class="form-group">
                    <label for="editMovieWriters">Writers:</label>
                    <input type="text" class="form-control" name="movieWriters" value="<%= movie.getWriters() %>">
                </div>
                <div class="form-group">
                    <label for="editMovieProducers">Producers:</label>
                    <input type="text" class="form-control" name="movieProducers" value="<%= movie.getProducers()%>">
                </div>
                <div class="form-group">
                    <label for="editMovieMusic">Music:</label>
                    <input type="text" class="form-control" name="movieMusic" value="<%= movie.getMusic() %>">
                </div>
                <div class="form-group">
                    <label for="editMovieTicketPriceAdult">Ticket Price (Adult):</label>
                     <input type="number" class="form-control" name="movieTicketPriceAdult" value="<%= movie.getTicketPriceAdult() %>">
                    
                </div>
                <div class="form-group">
                    <label for="editMovieTicketPriceChild">Ticket Price (Child):</label>
                    <input type="number" class="form-control" name="movieTicketPriceChild" value="<%= movie.getTicketPriceChild() %>">
                </div>
                <div class="form-group text-center">
                    <button type="submit" class="btn btn-primary">Update Movie</button>
                    
                </div>
            </form>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>