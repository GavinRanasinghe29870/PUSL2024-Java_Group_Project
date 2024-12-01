<%-- 
    Document   : adminBooking
    Created on : Nov 28, 2024, 11:43:03 AM
    Author     : MSI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Admin/CSS/adminBooking.css" /> 
    </head>
    <body>
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
                            <th>Seat Quantity</th>
                            <th>Movie Name</th>
                            <th>Total Amount LKR</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>ABC00001</td>
                            <td>name</td>
                            <td>N/A</td>
                            <td>movie name</td>
                            <td>price</td>
                        </tr>
                        <tr>
                            <td>ABC00002</td>
                            <td>Name</td>
                            <td>N/A</td>
                            <td>movie name</td>
                            <td>price</td>
                        </tr>
                        <tr>
                            <td>ABC00003</td>
                            <td>Name</td>
                            <td>N/A</td>
                            <td>movie name</td>
                            <td>price</td>
                        </tr>
                        <tr>
                            <td>ABC00004</td>
                            <td>Name</td>
                            <td>N/A</td>
                            <td>movie name</td>
                            <td>price</td>
                        </tr>
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
