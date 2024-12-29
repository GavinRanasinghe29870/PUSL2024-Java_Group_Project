<%-- 
    Document   : SeatBooking
    Created on : Nov 18, 2024, 8:49:07 PM
    Author     : kavis
--%>

<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="net.abccinema.model.buytickets"%>
<%@page import="net.abccinema.model.buyticketsDao"%>
<%@page import="net.abccinema.connection.DbCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<String> confirmedSeats = (List<String>) request.getAttribute("confirmedSeats");
    if (confirmedSeats == null) {
        confirmedSeats = new ArrayList<>();
    }

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
                    <div class="yellow-box ms-auto" id="countdown" style="width: 90px;">05:00</div>
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
                    <div class="seat " id="A1">A1</div>
                    <div class="seat ">A2</div>
                    <div class="seat ">A3</div>
                    <div class="seat ">A4</div>
                    <div class="seat ">A5</div>
                    <div class="seat ">A6</div>
                    <div class="seat ">A7</div>
                    <div class="seat ">A8</div>
                    <div class="seat ">A9</div>
                    <div class="seat ">A10</div>
                    <div class="seat ">A11</div>
                    <div class="seat ">A12</div>
                    <div class="seat ">A13</div>
                    <div class="seat ">A14</div>
                </div>
                <div class="row">
                    <div class="seat">B1</div>
                    <div class="seat">B2</div>
                    <div class="seat">B3</div>
                    <div class="seat">B4</div>
                    <div class="seat">B5</div>
                    <div class="seat">B6</div>
                    <div class="seat">B7</div>
                    <div class="seat">B8</div>
                    <div class="seat">B9</div>
                    <div class="seat">B10</div>
                    <div class="seat">B11</div>
                    <div class="seat">B12</div>
                    <div class="seat">B13</div>
                    <div class="seat">B14</div>
                </div>
                <div class="row">
                    <div class="seat">C1</div>
                    <div class="seat">C2</div>
                    <div class="seat">C3</div>
                    <div class="seat">C4</div>
                    <div class="seat">C5</div>
                    <div class="seat">C6</div>
                    <div class="seat">C7</div>
                    <div class="seat">C8</div>
                    <div class="seat">C9</div>
                    <div class="seat">C10</div>
                    <div class="seat">C11</div>
                    <div class="seat">C12</div>
                    <div class="seat">C13</div>
                    <div class="seat">C14</div>
                </div>
                <div class="row">
                    <div class="seat">D1</div>
                    <div class="seat">D2</div>
                    <div class="seat">D3</div>
                    <div class="seat">D4</div>
                    <div class="seat">D5</div>
                    <div class="seat">D6</div>
                    <div class="seat">D7</div>
                    <div class="seat">D8</div>
                    <div class="seat">D9</div>
                    <div class="seat">D10</div>
                    <div class="seat">D11</div>
                    <div class="seat">D12</div>
                    <div class="seat">D13</div>
                    <div class="seat">D14</div>
                </div>
                <div class="row">
                    <div class="seat">E1</div>
                    <div class="seat">E2</div>
                    <div class="seat">E3</div>
                    <div class="seat">E4</div>
                    <div class="seat">E5</div>
                    <div class="seat">E6</div>
                    <div class="seat">E7</div>
                    <div class="seat">E8</div>
                    <div class="seat">E9</div>
                    <div class="seat">E10</div>
                    <div class="seat">E11</div>
                    <div class="seat">E12</div>
                    <div class="seat">E13</div>
                    <div class="seat">E14</div>
                </div>
                <div class="row">
                    <div class="seat">F1</div>
                    <div class="seat">F2</div>
                    <div class="seat">F3</div>
                    <div class="seat">F4</div>
                    <div class="seat">F5</div>
                    <div class="seat">F6</div>
                    <div class="seat">F7</div>
                    <div class="seat">F8</div>
                    <div class="seat">F9</div>
                    <div class="seat">F10</div>
                    <div class="seat">F11</div>
                    <div class="seat">F12</div>
                    <div class="seat">F13</div>
                    <div class="seat">F14</div>
                </div>
                <div class="row">
                    <div class="seat">G1</div>
                    <div class="seat">G2</div>
                    <div class="seat">G3</div>
                    <div class="seat">G4</div>
                    <div class="seat">G5</div>
                    <div class="seat">G6</div>
                    <div class="seat">G7</div>
                    <div class="seat">G8</div>
                    <div class="seat">G9</div>
                    <div class="seat">G10</div>
                    <div class="seat">G11</div>
                    <div class="seat">G12</div>
                    <div class="seat">G13</div>
                    <div class="seat">G14</div>
                </div>
                <div class="row">
                    <div class="seat">H1</div>
                    <div class="seat">H2</div>
                    <div class="seat">H3</div>
                    <div class="seat">H4</div>
                    <div class="seat">H5</div>
                    <div class="seat">H6</div>
                    <div class="seat">H7</div>
                    <div class="seat">H8</div>
                    <div class="seat">H9</div>
                    <div class="seat">H10</div>
                    <div class="seat">H11</div>
                    <div class="seat">H12</div>
                    <div class="seat">H13</div>
                    <div class="seat">H14</div>
                </div>
                <div class="row">
                    <div class="seat">I1</div>
                    <div class="seat">I2</div>
                    <div class="seat">I3</div>
                    <div class="seat">I4</div>
                    <div class="seat">I5</div>
                    <div class="seat">I6</div>
                    <div class="seat">I7</div>
                    <div class="seat">I8</div>
                    <div class="seat">I9</div>
                    <div class="seat">I10</div>
                    <div class="seat">I11</div>
                    <div class="seat">I12</div>
                    <div class="seat">I13</div>
                    <div class="seat">I14</div>
                </div>
                <div class="row">
                    <div class="seat">J1</div>
                    <div class="seat">J2</div>
                    <div class="seat">J3</div>
                    <div class="seat">J4</div>
                    <div class="seat">J5</div>
                    <div class="seat">J6</div>
                    <div class="seat">J7</div>
                    <div class="seat">J8</div>
                    <div class="seat">J9</div>
                    <div class="seat">J10</div>
                    <div class="seat">J11</div>
                    <div class="seat">J12</div>
                    <div class="seat">J13</div>
                    <div class="seat">J14</div>
                </div>
                <div class="row">
                    <div class="seat">K1</div>
                    <div class="seat">K2</div>
                    <div class="seat">K3</div>
                    <div class="seat">K4</div>
                    <div class="seat">K5</div>
                    <div class="seat">K6</div>
                    <div class="seat">K7</div>
                    <div class="seat">K8</div>
                    <div class="seat">K9</div>
                    <div class="seat">K10</div>
                    <div class="seat">K11</div>
                    <div class="seat">K12</div>
                    <div class="seat">K13</div>
                    <div class="seat">K14</div>
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
            var countdownTime = 299;

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

        <script>
            document.addEventListener('DOMContentLoaded', () => {
                const movieId = <%= m_id%>; // Example movie ID
                const timeSlot = "<%= timeSlots%>"; // Example time slot

                // Function to fetch confirmed seats from the server
                async function getConfirmedSeats(movieId, timeSlot) {
                    try {
                        const response = await fetch(`/getConfirmedSeats?movieId=${movieId}&timeSlot=${timeSlot}`);
                        if (!response.ok) {
                            throw new Error('Network response was not ok');
                        }
                        const data = await response.json();
                        return data.confirmedSeats;
                    } catch (error) {
                        console.error('There was a problem with the fetch operation:', error);
                    }
                }

                function markOccupiedSeats(confirmedSeats) {
                    confirmedSeats.forEach(seatId => {
                        const seatElement = document.getElementById(seatId);
                        if (seatElement) {
                            seatElement.classList.add('occupied');
                        }
                    });
                }

                // Fetch confirmed seats and mark them as occupied
                getConfirmedSeats(movieId, timeSlot).then(confirmedSeats => {
                    if (confirmedSeats) {
                        markOccupiedSeats(confirmedSeats);
                    }
                });
            });
        </script>

    </body>
</html>
