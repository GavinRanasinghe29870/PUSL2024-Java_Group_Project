<%-- 
    Document   : MovieManage
    Created on : Nov 17, 2024, 8:51:36 PM
    Author     : KATANA
--%>

<%@page import="net.abccinema.model.moviereadDAO"%>
<%@page import="java.util.List"%>
<%@page import="net.abccinema.model.movieinsert"%>
<%@page import="net.abccinema.model.movieinsertDAO"%>
<%@page import="net.abccinema.connection.DbCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    moviereadDAO m = new moviereadDAO(DbCon.getConnection());
    List<movieinsert> movie = m.getAllMovies();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Manage</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/MovieManage.css" /> 
        <style>
            .truncate {
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
                max-width: 50px;
            }
            td {
                font-size: 13px;
            }
        </style>
    </head>
    <body>
        <%@include file="components/adminNavbar.jsp"%>
        <hr style="border-top: 3px solid #D4AF37;">
        <div style="background-color: #000000; padding-top:20px;">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h1 class="my-heading" style="padding-left: 25px; font-weight: bold;">Movie Manage</h1>
            </div>
        </div>
        <hr style="border-top: 3px solid #D4AF37;">
        <c:if test="${not empty succMsg}">
            <div class="alert alert-success text-center" role="alert" style="width: 20%; margin: 0 auto;">
                <div>
                    ${succMsg}
                </div>
            </div>
            <c:remove var="succMsg" scope="session" />
        </c:if>

        <c:if test="${not empty failedMsg}">
            <div class="alert alert-danger text-center" role="alert" style="width: 20%; margin: 0 auto;">
                <div>
                    ${failedMsg}
                </div>
            </div>
            <c:remove var="failedMsg" scope="session" />
        </c:if>
        <div class="container-fluid mt-4">

            <div class="bookings-container">

                <button type="button" class="btn btn-primary mb-4" data-bs-toggle="modal" data-bs-target="#addmoviemodal">
                    Add Movie
                </button>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Image</th>
                            <th>Description</th>
                            <th>Start Date</th>
                            <th>End Date</th>
                            <th>Genres</th>
                            <th>Cast</th>
                            <th>Directors</th>
                            <th>Writers</th>
                            <th>Producers</th>
                            <th>Music</th>
                            <th>Price(Adult)</th>
                            <th>Price(Child)</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%                            if (!movie.isEmpty()) {
                                for (int i = 0; i < movie.size(); i++) {
                                    movieinsert mr = movie.get(i);
                        %>
                        <tr>
                            <td><%= mr.getId()%></td>
                            <td class="truncate"><%= mr.getName()%></td>
                            <td class="truncate"><%= mr.getImageName()%></td>
                            <td class="truncate"><%= mr.getDescription()%></td>
                            <td class="truncate"><%= mr.getStartDate()%></td>
                            <td class="truncate"><%= mr.getEndDate()%></td>
                            <td class="truncate"><%= mr.getGenres()%></td>
                            <td class="truncate"><%= mr.getCast()%></td>
                            <td class="truncate"><%= mr.getDirectors()%></td>
                            <td class="truncate"><%= mr.getWriters()%></td>
                            <td class="truncate"><%= mr.getProducers()%></td>
                            <td class="truncate"><%= mr.getMusic()%></td>
                            <td class="truncate"><%= mr.getTicketPriceAdult()%></td>
                            <td class="truncate"><%= mr.getTicketPriceChild()%></td>
                            <td>
                                <a href="movieUpdate.jsp?id=<%=mr.getId()%>" class="btn btn-success btn-sm" style="font-size: 11px;">Edit</a>
                                <a href="delete?id=<%=mr.getId()%>" class="btn btn-danger btn-sm" style="font-size: 11px;">Delete</a>
                            </td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table>

                <!--Add Movie Modal -->
                <div class="modal fade" tabindex="-1" role="dialog" id="addmoviemodal">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-body">
                                <h4 style="margin-bottom: 50px;">Add New Movie</h4>
                                <form action="movieinsertServlet" method="POST" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label for="movieName">Movie Name:</label>
                                        <input type="text" class="form-control" name="movieName">
                                    </div>
                                    <div class="form-group">
                                        <label for="movieImage">Upload Movie Picture:</label>
                                        <input type="file" class="form-control" name="movieImage" accept=".jpg, .jpeg, .png">
                                    </div>
                                    <div class="form-group">
                                        <label for="movieDescription">Movie Description:</label>
                                        <textarea class="form-control" name="movieDescription" rows="2"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="movieTimeSlots">Time Slots:</label>
                                        <div class="time-slot-group" id="movieTimeSlots">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" name="timeSlots" value="10:30 AM" id="slot1">
                                                <label class="form-check-label" for="slot1">10:30 AM</label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" name="timeSlots" value="02:10 PM" id="slot2">
                                                <label class="form-check-label" for="slot2">02:10 PM</label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" name="timeSlots" value="06:30 PM" id="slot3">
                                                <label class="form-check-label" for="slot3">06:30 PM</label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" name="timeSlots" value="10:15 PM" id="slot4">
                                                <label class="form-check-label" for="slot4">10:15 PM</label>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="date1">Start Date:</label>
                                        <input type="date" class="form-control" name="startDate" value="">
                                    </div>
                                    <div class="form-group">
                                        <label for="date2">End Date:</label>
                                        <input type="date" class="form-control" name="endDate" value="">
                                    </div>
                                    <div class="form-group">
                                        <label for="movieGenres">Genres:</label>
                                        <input type="text" class="form-control" name="movieGenres">
                                    </div>
                                    <div class="form-group">
                                        <label for="movieStars">Cast:</label>
                                        <input type="text" class="form-control" name="movieStars">
                                    </div>
                                    <div class="form-group">
                                        <label for="movieDirectors">Directors:</label>
                                        <input type="text" class="form-control" name="movieDirectors">
                                    </div>
                                    <div class="form-group">
                                        <label for="movieWriters">Writers:</label>
                                        <input type="text" class="form-control" name="movieWriters">
                                    </div>
                                    <div class="form-group">
                                        <label for="movieProducers">Producers:</label>
                                        <input type="text" class="form-control" name="movieProducers">
                                    </div>
                                    <div class="form-group">
                                        <label for="movieMusic">Music:</label>
                                        <input type="text" class="form-control" name="movieMusic">
                                    </div>
                                    <div class="form-group">
                                        <label for="movieTicketPriceAdult">Ticket Price (Adult):</label>
                                        <input type="number" class="form-control" name="movieTicketPriceAdult">
                                    </div>
                                    <div class="form-group">
                                        <label for="movieTicketPriceChild">Ticket Price (Child):</label>
                                        <input type="number" class="form-control" name="movieTicketPriceChild">
                                    </div>
                                    <div class="form-group text-center">
                                        <button type="submit" class="btn btn-primary">Add Movie</button>
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal" >Close</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Add Movie Modal -->

            </div> <!-- Closing bookings-container div -->
        </div> <!-- Closing container div -->

        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

    </body>
</html>
