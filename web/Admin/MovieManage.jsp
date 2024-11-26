<%-- 
    Document   : MovieManage
    Created on : Nov 17, 2024, 8:51:36 PM
    Author     : KATANA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Manage</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Admin/CSS/MovieManage.css" /> 
    </head>
    <body>
        <hr style="border-top: 3px solid #D4AF37;">
        <div style="background-color: #000000; padding-top:20px;">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h1 class="my-heading" style="padding-left: 25px; font-weight: bold;">Movie Manage</h1>
            </div>
        </div>
        <hr style="border-top: 3px solid #D4AF37;">
        <div class="container mt-4">

            <div class="table-container">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Image</th>
                            <th>Description</th>
                            <th>Time Slots</th>
                            <th>Genres</th>
                            <th>Date</th>
                            <th>Ticket Price</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>#001</td>
                            <td>Example Movie</td>
                            <td><img src="path_to_image.jpg" alt="Image" style="width: 50px; height: 50px;"></td>
                            <td>Movie description goes here...</td>
                            <td>2024-11-14</td>
                            <td>Cast details...</td>
                            <td>2024 Nov 01</td>
                            <td><a href="#" class="text-white">Trailer Link</a></td>
                            <td>
                                <button class="btn btn-success btn-sm">Edit</button>
                                <button class="btn btn-danger btn-sm">Delete</button>
                            </td>
                        </tr>
                        <tr>
                            <td>#001</td>
                            <td>Example Movie</td>
                            <td><img src="path_to_image.jpg" alt="Image" style="width: 50px; height: 50px;"></td>
                            <td>Movie description goes here...</td>
                            <td>2024-11-14</td>
                            <td>Cast details...</td>
                            <td>2024 Nov 01</td>
                            <td><a href="#" class="text-white">Trailer Link</a></td>
                            <td>
                                <button class="btn btn-success btn-sm">Edit</button>
                                <button class="btn btn-danger btn-sm">Delete</button>
                            </td>
                        </tr>

                        <!-- Repeat similar rows as needed -->
                    </tbody>
                </table>
            </div>

            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#basicmodal">ADD</button>

            <!-- Modal -->
            <div class="modal fade" tabindex="-1" role="dialog" id="basicmodal">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-body">
                            <h4 style="margin-bottom: 50px;">Movie ID: 0001</h4>
                            <form>
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
                                            <input class="form-check-input" type="checkbox" value="timeSlots" id="slot1">
                                            <label class="form-check-label" for="slot1">10:30 AM</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="timeSlots" id="slot2">
                                            <label class="form-check-label" for="slot2">02:10 PM</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="timeSlots" id="slot3">
                                            <label class="form-check-label" for="slot3">06:30 PM</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="timeSlots" id="slot4">
                                            <label class="form-check-label" for="slot4">10:15 PM</label>
                                        </div>
                                    </div>
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

        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    </body>
</html>
