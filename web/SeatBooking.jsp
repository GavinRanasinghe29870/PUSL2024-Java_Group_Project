<%-- 
    Document   : SeatBooking
    Created on : Nov 18, 2024, 8:49:07 PM
    Author     : kavis
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="net.abccinema.model.buytickets"%>
<%@page import="net.abccinema.model.buyticketsDao"%>
<%@page import="net.abccinema.model.SeatBookingDAO"%>
<%@page import="net.abccinema.connection.DbCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.google.gson.Gson" %>

<%
    buyticketsDao dao = new buyticketsDao(DbCon.getConnection());
    List<buytickets> movies = dao.getAllMovies();

    // Retrieve parameters from the request
    int m_id = Integer.parseInt(request.getParameter("id"));
    String m_name = request.getParameter("name");
    String adultTpStr = request.getParameter("adultTicketPrice");
    float adultTp = 0.0f;
    if (adultTpStr != null && !adultTpStr.trim().isEmpty()) {
        adultTp = Float.parseFloat(adultTpStr);
    }
    String childTpStr = request.getParameter("childTicketPrice");
    float childTp = 0.0f;
    if (childTpStr != null && !childTpStr.trim().isEmpty()) {
        childTp = Float.parseFloat(childTpStr);
    }
    String timeSlots = request.getParameter("timeSlots");

    SeatBookingDAO DAO = new SeatBookingDAO(DbCon.getConnection());
    List<String> confirmedSeats = DAO.getConfirmedSeats(m_id, timeSlots);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ABC Cinema - Buy Movie Tickets Online for the Latest Movies</title><link link-style href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.4/jquery.rateyo.min.js" integrity="sha512-09bUVOnphTvb854qSgkpY/UGKLW9w7ISXGrN0FR/QdXTkjs0D+EfMFMTB+CGiIYvBoFXexYwGUD5FD8xVU89mw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <link link-style rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
        <link link-style rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.4/jquery.rateyo.min.css" integrity="sha512-JEUoTOcC35/ovhE1389S9NxeGcVLIqOAEzlpcJujvyUaxvIXJN9VxPX0x1TwSo22jCxz2fHQPS1de8NgUyg+nA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/seatbooking.css" />
        <style>
            .yellow-box {
                background-color: #D4AF37;
                color: #0D0C0C;
                padding: 5px 22px;
                text-align: center;
                font-size: 15px;
                font-weight:500;
                display: inline-block;
                border-radius: 3px;
            }

            @media screen and (max-width: 768px){
                .yellow-box {
                    font-size: 12px;
                }
            }
        </style>
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>

        <div class="container">
            <div class="row">
                <div class="col-9">
                    <div class="d-flex justify-content-between align-items-center my-4">
                        <h1 style="color: #D4AF37; padding-top: 20px"><%= m_name%></h1>
                    </div>
                </div>
                <div class="col-3 d-flex justify-content-between align-items-center my-4">
                    <div class="yellow-box ms-auto" id="countdown" style="width: 90px;">03:00</div>
                </div>
            </div>
            <hr style="border-bottom: 3px solid #D4AF37;">
            <div class="row">
                <div class="show-date col-md-6 col-sm-12 d-flex">
                    <i class="fa-solid fa-calendar-days"></i>
                    <h5 class="text-md-center" style="color: #D4AF37;">
                        <%
                            Date today = new Date();
                            SimpleDateFormat formatter = new SimpleDateFormat("EEEE, dd, MMM");
                            String formattedDate = formatter.format(today);
                            out.print(formattedDate);
                        %>
                    </h5>
                </div>
                <div class="show-time col-md-6 col-sm-12 d-flex justify-content-center justify-content-sm-center">
                    <h5 class="text-center" style="color: #D4AF37; padding-right: 15px">Show Time</h5>
                    <div class="yellow-box"><%= timeSlots%></div>
                </div>
            </div>


            <c:if test="${not empty bookedMsg}">
                <div class="alert alert-primary text-center" role="alert" style="width: 70%; margin: 0 auto;">
                    ${bookedMsg}
                </div>
                <c:remove var="bookedMsg" scope="session" />
            </c:if>


            <!-- Seat Select -->
            <div class="container seat-container">
                <div class="row">
                    <div class="seat" id="A1">A1</div>
                    <div class="seat" id="A2">A2</div>
                    <div class="seat" id="A3">A3</div>
                    <div class="seat" id="A4">A4</div>
                    <div class="seat" id="A5">A5</div>
                    <div class="seat" id="A6">A6</div>
                    <div class="seat" id="A7">A7</div>
                    <div class="seat" id="A8">A8</div>
                    <div class="seat" id="A9">A9</div>
                    <div class="seat" id="A10">A10</div>
                    <div class="seat" id="A11">A11</div>
                    <div class="seat" id="A12">A12</div>
                    <div class="seat" id="A13">A13</div>
                    <div class="seat" id="A14">A14</div>
                </div>
                <div class="row">
                    <div class="seat" id="B1">B1</div>
                    <div class="seat" id="B2">B2</div>
                    <div class="seat" id="B3">B3</div>
                    <div class="seat" id="B4">B4</div>
                    <div class="seat" id="B5">B5</div>
                    <div class="seat" id="B6">B6</div>
                    <div class="seat" id="B7">B7</div>
                    <div class="seat" id="B8">B8</div>
                    <div class="seat" id="B9">B9</div>
                    <div class="seat" id="B10">B10</div>
                    <div class="seat" id="B11">B11</div>
                    <div class="seat" id="B12">B12</div>
                    <div class="seat" id="B13">B13</div>
                    <div class="seat" id="B14">B14</div>
                </div>
                <div class="row">
                    <div class="seat" id="C1">C1</div>
                    <div class="seat" id="C2">C2</div>
                    <div class="seat" id="C3">C3</div>
                    <div class="seat" id="C4">C4</div>
                    <div class="seat" id="C5">C5</div>
                    <div class="seat" id="C6">C6</div>
                    <div class="seat" id="C7">C7</div>
                    <div class="seat" id="C8">C8</div>
                    <div class="seat" id="C9">C9</div>
                    <div class="seat" id="C10">C10</div>
                    <div class="seat" id="C11">C11</div>
                    <div class="seat" id="C12">C12</div>
                    <div class="seat" id="C13">C13</div>
                    <div class="seat" id="C14">C14</div>
                </div>
                <div class="row">
                    <div class="seat" id="D1">D1</div>
                    <div class="seat" id="D2">D2</div>
                    <div class="seat" id="D3">D3</div>
                    <div class="seat" id="D4">D4</div>
                    <div class="seat" id="D5">D5</div>
                    <div class="seat" id="D6">D6</div>
                    <div class="seat" id="D7">D7</div>
                    <div class="seat" id="D8">D8</div>
                    <div class="seat" id="D9">D9</div>
                    <div class="seat" id="D10">D10</div>
                    <div class="seat" id="D11">D11</div>
                    <div class="seat" id="D12">D12</div>
                    <div class="seat" id="D13">D13</div>
                    <div class="seat" id="D14">D14</div>
                </div>
                <div class="row">
                    <div class="seat" id="E1">E1</div>
                    <div class="seat" id="E2">E2</div>
                    <div class="seat" id="E3">E3</div>
                    <div class="seat" id="E4">E4</div>
                    <div class="seat" id="E5">E5</div>
                    <div class="seat" id="E6">E6</div>
                    <div class="seat" id="E7">E7</div>
                    <div class="seat" id="E8">E8</div>
                    <div class="seat" id="E9">E9</div>
                    <div class="seat" id="E10">E10</div>
                    <div class="seat" id="E11">E11</div>
                    <div class="seat" id="E12">E12</div>
                    <div class="seat" id="E13">E13</div>
                    <div class="seat" id="E14">E14</div>
                </div>
                <div class="row">
                    <div class="seat" id="F1">F1</div>
                    <div class="seat" id="F2">F2</div>
                    <div class="seat" id="F3">F3</div>
                    <div class="seat" id="F4">F4</div>
                    <div class="seat" id="F5">F5</div>
                    <div class="seat" id="F6">F6</div>
                    <div class="seat" id="F7">F7</div>
                    <div class="seat" id="F8">F8</div>
                    <div class="seat" id="F9">F9</div>
                    <div class="seat" id="F10">F10</div>
                    <div class="seat" id="F11">F11</div>
                    <div class="seat" id="F12">F12</div>
                    <div class="seat" id="F13">F13</div>
                    <div class="seat" id="F14">F14</div>
                </div>
                <div class="row">
                    <div class="seat" id="G1">G1</div>
                    <div class="seat" id="G2">G2</div>
                    <div class="seat" id="G3">G3</div>
                    <div class="seat" id="G4">G4</div>
                    <div class="seat" id="G5">G5</div>
                    <div class="seat" id="G6">G6</div>
                    <div class="seat" id="G7">G7</div>
                    <div class="seat" id="G8">G8</div>
                    <div class="seat" id="G9">G9</div>
                    <div class="seat" id="G10">G10</div>
                    <div class="seat" id="G11">G11</div>
                    <div class="seat" id="G12">G12</div>
                    <div class="seat" id="G13">G13</div>
                    <div class="seat" id="G14">G14</div>
                </div>
                <div class="row">
                    <div class="seat" id="H1">H1</div>
                    <div class="seat" id="H2">H2</div>
                    <div class="seat" id="H3">H3</div>
                    <div class="seat" id="H4">H4</div>
                    <div class="seat" id="H5">H5</div>
                    <div class="seat" id="H6">H6</div>
                    <div class="seat" id="H7">H7</div>
                    <div class="seat" id="H8">H8</div>
                    <div class="seat" id="H9">H9</div>
                    <div class="seat" id="H10">H10</div>
                    <div class="seat" id="H11">H11</div>
                    <div class="seat" id="H12">H12</div>
                    <div class="seat" id="H13">H13</div>
                    <div class="seat" id="H14">H14</div>
                </div>
                <div class="row">
                    <div class="seat" id="I1">I1</div>
                    <div class="seat" id="I2">I2</div>
                    <div class="seat" id="I3">I3</div>
                    <div class="seat" id="I4">I4</div>
                    <div class="seat" id="I5">I5</div>
                    <div class="seat" id="I6">I6</div>
                    <div class="seat" id="I7">I7</div>
                    <div class="seat" id="I8">I8</div>
                    <div class="seat" id="I9">I9</div>
                    <div class="seat" id="I10">I10</div>
                    <div class="seat" id="I11">I11</div>
                    <div class="seat" id="I12">I12</div>
                    <div class="seat" id="I13">I13</div>
                    <div class="seat" id="I14">I14</div>
                </div>
                <div class="row">
                    <div class="seat" id="J1">J1</div>
                    <div class="seat" id="J2">J2</div>
                    <div class="seat" id="J3">J3</div>
                    <div class="seat" id="J4">J4</div>
                    <div class="seat" id="J5">J5</div>
                    <div class="seat" id="J6">J6</div>
                    <div class="seat" id="J7">J7</div>
                    <div class="seat" id="J8">J8</div>
                    <div class="seat" id="J9">J9</div>
                    <div class="seat" id="J10">J10</div>
                    <div class="seat" id="J11">J11</div>
                    <div class="seat" id="J12">J12</div>
                    <div class="seat" id="J13">J13</div>
                    <div class="seat" id="J14">J14</div>
                </div>
                <div class="row">
                    <div class="seat" id="K1">K1</div>
                    <div class="seat" id="K2">K2</div>
                    <div class="seat" id="K3">K3</div>
                    <div class="seat" id="K4">K4</div>
                    <div class="seat" id="K5">K5</div>
                    <div class="seat" id="K6">K6</div>
                    <div class="seat" id="K7">K7</div>
                    <div class="seat" id="K8">K8</div>
                    <div class="seat" id="K9">K9</div>
                    <div class="seat" id="K10">K10</div>
                    <div class="seat" id="K11">K11</div>
                    <div class="seat" id="K12">K12</div>
                    <div class="seat" id="K13">K13</div>
                    <div class="seat" id="K14">K14</div>
                </div>
            </div>
            <!-- Seat Select -->

            <div class="screen mt-4">SCREEN</div>

            <hr style="border-top: 3px solid #D4AF37;">
            <div style="padding-top: 20px; padding-bottom: 20px;">
                <div class="row">
                    <div class="col-12 d-flex justify-content-center">
                        <div class="legend-container d-flex justify-content-start align-items-center gap-3">
                            <div class="legend-item">
                                <div class="legend-box legend-available"></div>
                                <span class="legend-text">Available</span>
                            </div>
                            <div class="legend-item">
                                <div class="legend-box legend-reserved"></div>
                                <span class="legend-text">Reserved</span>
                            </div>
                            <div class="legend-item">
                                <div class="legend-box legend-selected"></div>
                                <span class="legend-text">Selected</span>
                            </div>
                            <div class="legend-item">
                                <div class="legend-box legend-unavailable"></div>
                                <span class="legend-text">Unavailable</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr style="border-bottom: 3px solid #D4AF37;">

            <form action="SeatBookingServlet" method="POST">
                <div class="ticket-section">
                    <h5><span id="count">0</span> Ticket(s) Selected. Total <span id="total">LKR 0</span></h5>
                    <div class="ticket-type">
                        <div>
                            <strong>Adult</strong><br>
                            LKR <%= adultTp%>
                        </div>
                        <div class="d-flex align-items-center">
                            <button type="button" class="btn btn-log" id="adult-decrease">-</button>
                            <span class="mx-3" id="adult-count">0</span>
                            <button type="button" class="btn btn-log" id="adult-increase">+</button>
                        </div>
                    </div>
                    <div class="ticket-type">
                        <div>
                            <strong>Child</strong><br>
                            LKR <%= childTp%>
                        </div>
                        <div class="d-flex align-items-center">
                            <button type="button" class="btn btn-log" id="child-decrease">-</button>
                            <span class="mx-3" id="child-count">0</span>
                            <button type="button" class="btn btn-log" id="child-increase">+</button>
                        </div>
                    </div>
                    <input type="hidden" name="m_id" value="<%= m_id%>">
                    <input type="hidden" name="m_name" value="<%= m_name%>">
                    <input type="hidden" name="adultTicketPrice" value="<%= adultTp%>">
                    <input type="hidden" name="childTicketPrice" value="<%= childTp%>">
                    <input type="hidden" name="timeSlots" value="<%= timeSlots%>">
                    <input type="hidden" name="adultCount" id="hidden-adult-count" value="0">
                    <input type="hidden" name="childCount" id="hidden-child-count" value="0">
                    <input type="hidden" name="totalPrice" id="hidden-total-price" value="0">
                    <input type="hidden" name="selectedSeats" id="hidden-selected-seats" value="" required>
                    <button type="submit" class="btn btn-log mt-4 px-4 py-2">Check Out</button>
                </div>
            </form>
        </div>

        <%@include file="components/footer.jsp"%>

        <script>
            document.addEventListener('DOMContentLoaded', () => {
                const confirmedSeats = <%= new Gson().toJson(confirmedSeats)%>;

                function markOccupiedSeats(confirmedSeats) {
                    confirmedSeats.forEach(seatId => {
                        const seatElement = document.getElementById(seatId.trim());
                        if (seatElement) {
                            seatElement.classList.add('occupied');
                        }
                    });
                }

                // Mark confirmed seats as occupied
                markOccupiedSeats(confirmedSeats);
            });
        </script>

        <script>
            const container = document.querySelector(".seat-container");
            const seats = document.querySelectorAll(".row .seat:not(.occupied)");
            const count = document.getElementById("count");
            const total = document.getElementById("total");
            const adultCountElement = document.getElementById("adult-count");
            const childCountElement = document.getElementById("child-count");
            const adultIncreaseButton = document.getElementById("adult-increase");
            const adultDecreaseButton = document.getElementById("adult-decrease");
            const childIncreaseButton = document.getElementById("child-increase");
            const childDecreaseButton = document.getElementById("child-decrease");
            const hiddenAdultCount = document.getElementById("hidden-adult-count");
            const hiddenChildCount = document.getElementById("hidden-child-count");
            const hiddenTotalPrice = document.getElementById("hidden-total-price");
            const hiddenSelectedSeats = document.getElementById("hidden-selected-seats");
            const adultTicketPrice = <%= adultTp%>;
            const childTicketPrice = <%= childTp%>;
            let adultCount = 0;
            let childCount = 0;
            // Update total and count
            function updateSelectedCount() {
                const selectedSeats = document.querySelectorAll(".row .seat.selected");
                const selectedSeatsCount = selectedSeats.length;
                const selectedSeatsArray = [...selectedSeats].map(seat => seat.textContent);
                count.innerText = selectedSeatsCount;
                const totalPrice = adultCount * adultTicketPrice + childCount * childTicketPrice;
                total.innerText = "LKR " + totalPrice;
                hiddenAdultCount.value = adultCount;
                hiddenChildCount.value = childCount;
                hiddenTotalPrice.value = totalPrice;
                hiddenSelectedSeats.value = selectedSeatsArray.join(", ");
            }
            // Seat click event
            container.addEventListener("click", (e) => {
                if (
                        e.target.classList.contains("seat") &&
                        !e.target.classList.contains("occupied")
                        ) {
                    e.target.classList.toggle("selected");
                    const selectedSeats = document.querySelectorAll(".row .seat.selected").length;
                    if (selectedSeats > adultCount + childCount) {
                        adultCount++;
                    } else if (selectedSeats < adultCount + childCount) {
                        if (childCount > 0) {
                            childCount--;
                        } else {
                            adultCount--;
                        }
                    }
                    adultCountElement.innerText = adultCount;
                    childCountElement.innerText = childCount;
                    updateSelectedCount();
                }
            });
            // Increase and decrease ticket count
            adultIncreaseButton.addEventListener("click", () => {
                const selectedSeats = document.querySelectorAll(".row .seat.selected").length;
                if (adultCount + childCount < selectedSeats) {
                    adultCount++;
                    adultCountElement.innerText = adultCount;
                    updateSelectedCount();
                }
            });
            adultDecreaseButton.addEventListener("click", () => {
                if (adultCount > 0) {
                    adultCount--;
                    adultCountElement.innerText = adultCount;
                    updateSelectedCount();
                }
            });
            childIncreaseButton.addEventListener("click", () => {
                const selectedSeats = document.querySelectorAll(".row .seat.selected").length;
                if (adultCount + childCount < selectedSeats) {
                    childCount++;
                    childCountElement.innerText = childCount;
                    updateSelectedCount();
                }
            });
            childDecreaseButton.addEventListener("click", () => {
                if (childCount > 0) {
                    childCount--;
                    childCountElement.innerText = childCount;
                    updateSelectedCount();
                }
            });
            // Initial count and total set
            updateSelectedCount();
        </script>

        <script>
            // Set the countdown time in seconds (1 minute)
            var countdownTime = 179;

            // Update the countdown every 1 second
            var x = setInterval(function () {

                // Time calculations for minutes and seconds
                var minutes = Math.floor(countdownTime / 60);
                var seconds = countdownTime % 60;

                // Add leading zeros to minutes and seconds if needed
                minutes = minutes < 10 ? "0" + minutes : minutes;
                seconds = seconds < 10 ? "0" + seconds : seconds;

                // Display the result in the element with id="countdown"
                document.getElementById("countdown").innerHTML = minutes + ":" + seconds;

                // If the countdown is finished, redirect to BuyTickets.jsp
                if (countdownTime <= 0) {
                    clearInterval(x);
                    window.location.href = "BuyTickets.jsp";
                }

                // Decrease the countdown time by 1 second
                countdownTime--;
            }, 1000);
        </script>

    </body>
</html>
