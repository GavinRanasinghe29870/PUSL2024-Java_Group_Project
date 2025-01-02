<%-- 
    Document   : adminBooking
    Created on : Nov 28, 2024, 11:43:03 AM
    Author     : MSI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList" %>
<%@page import="net.abccinema.connection.DbCon" %>
<%@page import="net.abccinema.model.*" %>

<%
    adminBookingDAO booking = new adminBookingDAO(DbCon.getConnection());
    List<adminBooking> ab = booking.getAllBooking();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/adminBooking.css" /> 
    </head>
    <body>
        <%@include file="components/adminNavbar.jsp"%>
        <!-- Bookings Table -->
        <hr style="border-top: 3px solid #D4AF37;">
        <div style="background-color: #000000; padding-top:20px;">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h1 class="my-heading" style="padding-left: 25px; font-weight: bold;">Bookings (Payments)</h1>
            </div>
        </div>
        <hr style="border-top: 3px solid #D4AF37;">
        <div class="container">
            <div class="bookings-container">
                <table>
                    <thead>
                        <tr>
                            <th>Booking ID</th>
                            <th>Name</th>
                            <th>Phone Number</th>
                            <th>Email</th>
                            <th>Adult Tickets</th>
                            <th>Child Tickets</th>
                            <th>Total Amount (LKR)</th>
                            <th>Payment Method</th>
                            <th>Movie ID</th>
                            <th>Movie Time Slot</th>
                            <th>Seat Numbers</th>
                            <th>Booking Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (!ab.isEmpty()) {
                                for (int i = 0; i < ab.size(); i++) {
                                    adminBooking b = ab.get(i);
                        %>
                            <tr>
                                <td><%= b.getBookingId()%></td>
                                <td><%= b.getName()%></td>
                                <td><%= b.getPhoneNumber()%></td>
                                <td><%= b.getEmail()%></td>
                                <td><%= b.getAdultTickets()%></td>
                                <td><%= b.getChildTickets()%></td>
                                <td><%= b.getTotalAmount()%></td>
                                <td><%= b.getPaymentMethod()%></td>
                                <td><%= b.getMovieId()%></td>
                                <td><%= b.getMovieTimeSlot()%></td>
                                <td><%= b.getSeatNumbers()%></td>
                                <td><%= b.getBookDate()%></td>
                            </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    </body>
</html>
