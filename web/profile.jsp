<%-- 
    Document   : profile
    Created on : Nov 28, 2024, 11:01:52 AM
    Author     : MSI
--%>

<%@page import="net.abccinema.model.purchase"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="net.abccinema.model.purchaseDao"%>
<%@page import="net.abccinema.connection.DbCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="net.abccinema.model.User"%>
<%@page import="net.abccinema.model.UserDao"%>

<%
    String userIdParam = request.getParameter("id");
    if (userIdParam != null && !userIdParam.isEmpty()) {
        int userId = Integer.parseInt(userIdParam);
        purchaseDao p = new purchaseDao(DbCon.getConnection());
        List<purchase> pu = p.getBookingsByUserId(userId);
        request.setAttribute("bookings", pu);
    } else {
        request.setAttribute("error", "User ID is missing or invalid.");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <link link-style href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/profile.css" />
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>

        <div class="container">

            <div class="profile-container">
                <div class="profile-card">
                    <div class="profile-header">
                        <div class="profile-pic mb-4"></div>
                        <div class="mb-4">
                            <h2><%= user.getFullName()%></h2>
                        </div>
                    </div>
                    <div class="margin-border">
                        <hr style="border-top: 3px solid #D4AF37;">
                    </div>

                    <div class="profile-details">
                        <h5>
                            Email&nbsp;&nbsp;:&nbsp;&nbsp;<span style="color: #9E9E9E;"><%= user.getEmail()%></span>
                        </h5>
                        <h5>
                            Phone Number&nbsp;&nbsp;:&nbsp;&nbsp;<span style="color: #9E9E9E;"><%= user.getPhoneNumber()%></span>
                        </h5>
                        <h5>
                            Address&nbsp;&nbsp;:&nbsp;&nbsp;<span style="color: #9E9E9E;"><%= user.getAddress()%></span>
                        </h5>
                        <h5>
                            Age&nbsp;&nbsp;:&nbsp;&nbsp;<span style="color: #9E9E9E;"><%= user.getAge()%></span>
                        </h5>
                        <button class="btn btn-log mt-4 px-4 py-2" data-bs-toggle="modal" data-bs-target="#basicmodal">Edit Profile</button>
                    </div>
                    <div class="margin-border">
                        <hr style="border-top: 3px solid #D4AF37;">
                    </div>

                    <div class="booking-section mb-4">
                        <h3>My Bookings</h3>

                        <c:forEach var="booking" items="${bookings}">
                            <div class="booking-item mb-1">
                                <p>Booking ID ${booking.id} | Adult ${booking.adultTickets} | Child ${booking.childTickets} - LKR ${booking.totalAmount}</p>
                                <a href="bookingDelete?id=${booking.id}&userId=${param.id}" class="btn cancel-btn">Cancel</a>
                            </div>
                        </c:forEach>
                    </div>

                    <div class="margin-border">
                        <hr style="border-top: 3px solid #D4AF37;">
                    </div>
                </div>
            </div>

            <!-- Cancel Confirmation Modal -->
            <div class="modal fade" id="cancelModal" tabindex="-1" aria-labelledby="cancelModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="cancelModalLabel">Confirm Cancellation</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            Are you sure you want to cancel this booking?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <a id="confirmCancelBtn" href="#" class="btn btn-danger">Cancel Booking</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal -->
            <div class="modal fade" tabindex="-1" role="dialog" id="basicmodal">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-body">
                            <h4 class="text-center" style="margin-bottom: 50px;">Edit Profile</h4>
                            <form>
                                <div class="form-group">
                                    <label for="movieName">Name:</label>
                                    <input type="text" class="form-control" id="name" value="<%= user.getFullName()%>">
                                </div>
                                <div class="form-group">
                                    <label for="movieImage">Upload Profile Picture:</label>
                                    <input type="file" class="form-control" id="proImage" accept=".jpg, .jpeg, .png">
                                </div>
                                <div class="form-group">
                                    <label for="movieGenres">Email:</label>
                                    <input type="text" class="form-control" id="email" value="<%= user.getEmail()%>">
                                </div>
                                <div class="form-group">
                                    <label for="movieGenres">Phone Number:</label>
                                    <input type="text" class="form-control" id="phoneNo" value="<%= user.getPhoneNumber()%>">
                                </div>
                                <div class="form-group">
                                    <label for="movieDescription">Address:</label>
                                    <textarea class="form-control" id="address" rows="2"><%= user.getAddress()%></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="movieGenres">Age:</label>
                                    <input type="text" class="form-control" id="age" value="<%= user.getAge()%>">
                                </div>
                                <div class="form-group text-center">
                                    <button type="submit" class="btn btn-primary">Update Details</button>
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <%@include file="components/footer.jsp"%>
    </body>
</html>
