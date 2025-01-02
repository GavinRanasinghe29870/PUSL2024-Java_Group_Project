<%-- 
    Document   : checkout
    Created on : Nov 11, 2024, 6:46:30 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- Dynamic Data Processing --%>
<%
    // Retrieve parameters from the previous page
    String selectedSeats = request.getParameter("selectedSeats") != null ? request.getParameter("selectedSeats") : "Not Selected";
    String adultCount = request.getParameter("adultCount") != null ? request.getParameter("adultCount") : "0";
    String childCount = request.getParameter("childCount") != null ? request.getParameter("childCount") : "0";
    String totalPrice = request.getParameter("totalPrice") != null ? request.getParameter("totalPrice") : "0";

    // Convert string parameters to appropriate data types
    int adultCountInt = Integer.parseInt(adultCount);
    int childCountInt = Integer.parseInt(childCount);
    float totalPriceFloat = Float.parseFloat(totalPrice);

    // Retrieve parameters from the request
    String m_idStr = request.getParameter("id");
    int m_id = 0; // Default value in case 'id' is missing or invalid
    if (m_idStr != null && !m_idStr.trim().isEmpty()) {
        try {
            m_id = Integer.parseInt(m_idStr);
        } catch (NumberFormatException e) {
            // Handle invalid ID format (optional logging or showing error message)
            System.out.println("Invalid ID parameter: " + m_idStr);
        }
    }
//    String m_name = request.getParameter("name");
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

    // Calculate total prices
    float adultTotalPrice = adultCountInt * adultTp;
    float childTotalPrice = childCountInt * childTp;

    // Format total price for display
    java.text.NumberFormat formatter = java.text.NumberFormat.getInstance();
    formatter.setGroupingUsed(true);
    formatter.setMinimumFractionDigits(2);
    formatter.setMaximumFractionDigits(2);
    String formattedAdultTotalPrice = formatter.format(adultTotalPrice);
    String formattedChildTotalPrice = formatter.format(childTotalPrice);
    String formattedTotalPrice = formatter.format(totalPriceFloat);
    
    User currentUser = (User) session.getAttribute("currentUser");
    int userId = currentUser != null ? currentUser.getUserId() : 0;
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Checkout Page</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.4/jquery.rateyo.min.js" integrity="sha512-09bUVOnphTvb854qSgkpY/UGKLW9w7ISXGrN0FR/QdXTkjs0D+EfMFMTB+CGiIYvBoFXexYwGUD5FD8xVU89mw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
        <%@include file = "components/navbar.jsp" %>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #BF873E;
                color: black;
            }

            .container {
                padding: 80px;
                border-radius: 50px;
                border: black;
            }

            .content {
                display: flex;
                justify-content: space-between;
                flex-wrap: wrap;
                gap: 20px;
            }

            .box {
                flex: 1 1 48%;
                padding: 20px;
                background-color: #D4AF37;
                border-radius: 8px;
                margin: 0;
                box-sizing: border-box;
            }


            .box h2, .box label, .box input {
                text-align: left;
            }

            .box input, .box select, .box textarea {
                width: 90%;
                padding: 10px;
                margin: 10px 0;
                border: none;
                border-radius: 2px;
            }

            .box input[type="checkbox"] {
                width: auto;
            }

            .box button {
                width: 20%;
                padding: 10px;
                margin: 10px 1%;
                border: none;
                border-radius: 5px;
                background-color: #000;
                color: #ffffff;
                cursor: pointer;
            }

            .box button:hover {
                background-color: #c0a16b;
            }

            .button-container {
                text-align: center;
                margin-top: 20px;
            }

            .button-container button {
                width: 40%;
                padding: 10px;
                border: none;
                border-radius: 5px;
                background-color: #D4AF37;
                color: #000;
                cursor: pointer;
            }

            #back-button, #paynow-button {
                padding: 10px 20px;
                background-color: #d4a420;
                border: none;
                color: #000;
                font-weight: bold;
                cursor: pointer;
            }

            #back-button:hover, #paynow-button:hover {
                background-color: #b48818;
            }

            .payment-method {
                text-align: left;
                margin-top: 10px;
            }
            .custom-dropdown {
                position: relative;
                display: inline-block;
                width: 100%;
            }

            .selected {
                display: flex;
                align-items: center;
                justify-content: space-between;
                background-color: #fff;
                padding: 10px;
                cursor: pointer;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .dropdown-options {
                display: none;
                position: absolute;
                background-color: #fff;
                border: 1px solid #ccc;
                border-radius: 5px;
                z-index: 1000;
                width: 100%;
                max-height: 150px;
                overflow-y: auto;
                box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            }

            .dropdown-options div {
                display: flex;
                align-items: center;
                padding: 10px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .dropdown-options div:hover {
                background-color: #f0f0f0;
            }

            .dropdown-options img {
                width: 20px;
                height: 20px;
                margin-right: 10px;
            }
            .selected img {
                width: 20px;
                height: 20px;
                margin-right: 10px;
            }
            .show-time-container {
                display: flex;
                align-items: center;
                justify-content: space-between;
                background-color: #111;
                color: #FFD700;
                padding: 10px;
            }

            .date-container, .time-container {
                display: flex;
                align-items: center;
            }

            .calendar-icon {

                font-size: 20px;
                margin-right: 10px;
            }

            .date, .show-time-label, .show-time {
                font-size: 16px;
            }

            .show-time {

                padding: 5px 10px;
                border-radius: 5px;
            }

            input[type="text"] {
                width: 20px;
                height: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                text-align: center;
                font-size: 12px;
            }
            #user_name{
                width: 90%;
                height: 30px;
                box-sizing: border-box;
            }
            #user_email{
                width: 90%;
                height: 30px;
                box-sizing: border-box;
            }
            #myTextBox{
                width: 90%;
                height: 30px;
                box-sizing: border-box;

            }
            p{
                color: black;
            }

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
        <div class="container">



            <div class="col-3" style="padding-bottom: 50px;">
                <div class="yellow-box ms-auto" id="countdown" style="width: 90px;">03:00</div>
            </div>
            <div class="show-time-container">
                <div class="date-container">
                    <i class="fa-solid fa-calendar-days"></i>
                    <span class="date">Tuesday, 07, Nov</span>
                </div>
                <div class="time-container">
                    <span class="show-time-label">Show Time</span>
                    <span class="show-time"><%= timeSlots%></span>
                </div>
            </div>
            <form action="purchaseServlet" method="post" id="checkoutForm">
                <div class="content">

                    <!-- Box 1: Purchase Summary -->
                    <div class="box">
                        <h2>Purchase Summary</h2>
                        <hr style="border: 1px solid black;">
                        <div class="purchase-summary">
                            <div class="ticket-item">
                                <h5>Seat Numbers: <%= selectedSeats%></h5>
                                <input type="hidden" id="seat_numbers" name="seat_numbers" value="<%= selectedSeats%>">
                                <label for="adult-tickets">Adult Tickets :(x <%= adultCountInt%>)</label>
                                LKR <%= formattedAdultTotalPrice%>
                            </div>
                            <% if (childCountInt > 0) {%>
                            <div class="ticket-item">
                                <label for="child-tickets">Child Tickets :(x <%= childCountInt%>)</label>
                                LKR <%= formattedChildTotalPrice%>
                            </div>
                            <% }%>
                        </div>

                        <br>
                        <div class="ticket-item">
                            <h5>Total Amount: LKR <%= formattedTotalPrice%></h5>
                            <input type="hidden" id="amount" name="amount" value="<%= formattedTotalPrice%>">
                        </div>

                        <hr style="border: 1px solid black;">
                        <div class="payment-method">
                            <h3>Payment Method</h3>
                            <div class="custom-dropdown">
                                <div class="selected">Select Payment Method</div>
                                <div class="dropdown-options">
                                    <div data-value="Visa">
                                        <img src="Images/visa.png" alt="Visa" class="logo"> Visa Card
                                    </div>
                                    <div data-value="Master Card">
                                        <img src="Images/mastercard.png" alt="MasterCard" class="logo"> Master Card
                                    </div>

                                    <div data-value="PayPal">
                                        <img src="Images/Paypal.png" alt="PayPal" class="logo"> PayPal
                                    </div>
                                </div>
                                <input type="hidden" id="paymentMethod" name="paymentMethod" required>
                            </div>
                        </div>
                    </div>

                    <!-- Box 2: User Details -->
                    <div class="box">
                        <h2>Your Details</h2>
                        <hr style="border: 1px solid black;">
                        <label for="name">Name:</label><br>
                        <input type="text" id="user_name" name="user_name" required value><br>
                        <label for="phone">Phone Number:</label><br>
                        <input type="text" id="myTextBox" name="phoneNumber" required><br>
                        <label for="email">Email:</label><br>
                        <input type="email" id="user_email" name="user_email" required><br>
                        <hr style="border: 1px solid black;">
                        <input type="checkbox" id="terms" name="terms" required>
                        <label for="terms">I agree to the <a href="#">Terms & Conditions</a></label>
                    </div>
                </div>

                <!-- Pass Hidden Fields -->
                <input type="hidden" name="userId" value="<%= userId %>">
                <input type="hidden" name="selectedSeats" value="<%= selectedSeats%>">
                <input type="hidden" name="adultCount" value="<%= adultCount%>">
                <input type="hidden" name="childCount" value="<%= childCount%>">
                <input type="hidden" name="amount" value="<%= totalPrice%>">
                <input type="hidden" name="id" value="<%= m_id%>">
                <input type="hidden" name="timeSlots" value="<%= timeSlots%>">

                <!-- Buttons -->
                <div class="button-container">

                    <div type="submit" id ="paypal-button-container" value="Pay Now"></div>
                </div>
            </form>
        </div>

        <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="loginModalLabel">Login Required</h5>
                        </button>
                    </div>
                    <div class="modal-body">
                        You have to login first.
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="components/footer.jsp" %>

        <script type="text/javascript"
        src="https://cdn.jsdelivr.net/npm/@emailjs/browser@4/dist/email.min.js"></script>
        <script type="text/javascript">
            emailjs.init('kVB0utlxfeysWQyzE');
        </script>

        <script src="https://www.paypal.com/sdk/js?client-id=AZMxxYqMstivHkisTNvOcXCL9soXa50N78B5kj03gUSARVsQPOC8iOp5hDZ3wcd6AQCZW59-ZPd3fsZW&currency=USD&components=buttons"></script>


        <script>
            document.addEventListener("DOMContentLoaded", function () {
                paypal.Buttons({
                    onClick: function () {
                        // Fetch user inputs and validate them
                        const userName = $('#user_name').val().trim();
                        const phoneNumber = $('#myTextBox').val().trim();
                        const userEmail = $('#user_email').val().trim();
                        let valid = true;

                        // Validation
                        if (userName.length === 0) {
                            $('.name').text("This field is required");
                            valid = false;
                        } else {
                            $('.name').text("");
                        }

                        if (phoneNumber.length === 0) {
                            $('.myTextBox').text("This field is required");
                            valid = false;
                        } else {
                            $('.myTextBox').text("");
                        }

                        if (userEmail.length === 0) {
                            $('.user_email').text("This field is required");
                            valid = false;
                        } else {
                            $('.user_email').text("");
                        }

                        // Check if user is logged in
                        const isLoggedIn = <%= (session.getAttribute("currentUser") != null)%>;
                        if (!isLoggedIn) {
                            // Set error message in session
            <% session.setAttribute("logMsg", "You have to login first");%>
                            valid = false;
                            // Trigger Bootstrap modal
                            $('#loginModal').modal('show');
                        }

                        return valid;
                    },

                    createOrder: function (data, actions) {
                        return actions.order.create({
                            purchase_units: [
                                {
                                    amount: {
                                        value: "<%= totalPrice%>"

                                    }
                                }
                            ]
                        });
                    },

                    onApprove: function (data, actions) {
                        return actions.order.capture().then(function (orderData) {
                            const transaction = orderData.purchase_units[0].payments.captures[0];
                            alert(`Transaction ${transaction.status}: ${transaction.id}`);

                            $('#checkoutForm').submit();
                            //                            const serviceID = 'service_0rfopse';
                            //                            const templateID = 'template_g7367ka';
                            //                            const form = document.getElementById('checkoutForm');
                            //                            const formData = new FormData(form);
                            //
                            //                            // Send email using EmailJS
                            //                            emailjs.sendForm(serviceID, templateID, form)
                            //                                    .then(() => {
                            //                                        alert('Email Sent!');
                            //
                            //
                            //                                        form.submit();
                            //                                    })
                            //                                    .catch((err) => {
                            //                                        alert('Error sending email: ' + JSON.stringify(err));
                            //                                      });


                        });
                    },

                    onError: function (err) {
                        console.error('PayPal Button Error:', err);
                    }
                }).render('#paypal-button-container');
            });


            // Dropdown for Payment Method
            document.addEventListener("DOMContentLoaded", function () {
                const dropdown = document.querySelector('.custom-dropdown');
                const selected = dropdown.querySelector('.selected');
                const options = dropdown.querySelector('.dropdown-options');
                const hiddenInput = document.getElementById('paymentMethod');

                selected.addEventListener('click', () => {
                    options.style.display = options.style.display === 'block' ? 'none' : 'block';
                });

                options.addEventListener('click', (e) => {
                    if (e.target.closest('div')) {
                        const selectedOption = e.target.closest('div');
                        selected.innerHTML = selectedOption.innerHTML;
                        hiddenInput.value = selectedOption.getAttribute('data-value');
                        options.style.display = 'none';
                    }
                });

                document.addEventListener('click', (e) => {
                    if (!dropdown.contains(e.target)) {
                        options.style.display = 'none';
                    }
                });
            });
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