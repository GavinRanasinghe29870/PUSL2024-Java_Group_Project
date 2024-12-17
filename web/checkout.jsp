<%-- 
    Document   : checkout
    Created on : Nov 11, 2024, 6:46:30 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Checkout Page</title>
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

        </style>
        <script src="https://www.paypal.com/sdk/js?client-id=AZfRPFT4-YtqJdzbSx12ZL2kvjGo4nkIiUnZkXvoUlSe6AJuRcEp3yeGHk9gg4Apk4xolVCO1QlKePrfa"></script>
    </head>
    <body>
        <div class="container">
            <div class="show-time-container">
                <div class="date-container">

                    <i class="fa-solid fa-calendar-days"></i>

                    <span class="date">Tuesday, 07, Nov</span>
                </div>
                <div class="time-container">
                    <span class="show-time-label">Show Time</span>
                    <span class="show-time">10:30 AM</span>
                </div>
            </div>
            <form action="purchaseServlet" method="post" id ="checkoutForm">
                <div class="content">
                    <%-- Dynamic Data Processing --%>
                    <%                        // Retrieve parameters from the previous page
                        String selectedSeats = request.getParameter("selectedSeats") != null ? request.getParameter("selectedSeats") : "Not Selected";
                        String adultCount = request.getParameter("adultCount") != null ? request.getParameter("adultCount") : "0";
                        String childCount = request.getParameter("childCount") != null ? request.getParameter("childCount") : "0";
                        String totalPrice = request.getParameter("totalPrice") != null ? request.getParameter("totalPrice") : "0";

                        // Convert string parameters to appropriate data types
                        int adultCountInt = Integer.parseInt(adultCount);
                        int childCountInt = Integer.parseInt(childCount);
                        float totalPriceFloat = Float.parseFloat(totalPrice);

                        // Define ticket prices
                        float adultTicketPrice = 1000.00f;
                        float childTicketPrice = 800.00f;

                        // Calculate total prices
                        float adultTotalPrice = adultCountInt * adultTicketPrice;
                        float childTotalPrice = childCountInt * childTicketPrice;

                        // Format total price for display
                        java.text.NumberFormat formatter = java.text.NumberFormat.getInstance();
                        formatter.setGroupingUsed(true);
                        formatter.setMinimumFractionDigits(2);
                        formatter.setMaximumFractionDigits(2);
                        String formattedAdultTotalPrice = formatter.format(adultTotalPrice);
                        String formattedChildTotalPrice = formatter.format(childTotalPrice);
                        String formattedTotalPrice = formatter.format(totalPriceFloat);
                    %>

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
                        <input type="text" id="user_name" name="user_name" required><br>
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
                <input type="hidden" name="selectedSeats" value="<%= selectedSeats%>">
                <input type="hidden" name="adultCount" value="<%= adultCount%>">
                <input type="hidden" name="childCount" value="<%= childCount%>">
                <input type="hidden" name="amount" value="<%= totalPrice%>">

                <!-- Buttons -->
                <div class="button-container">
                    <button type="button" id="back-button" onclick="history.back();">Back</button>
                    <!--              <button type="submit" id="button">Pay Now</button>-->
                    <input type="submit" id="paynow-button" value="Pay Now">
                </div>
            </form>
        </div>

        <%@include file="components/footer.jsp" %>
        <script src="${pageContext.request.contextPath}/js/gmailService.js"></script>
        <script type="text/javascript"
  src="https://cdn.jsdelivr.net/npm/@emailjs/browser@4/dist/email.min.js"></script>
        <script type="text/javascript">
                        emailjs.init('kVB0utlxfeysWQyzE');
        </script>
        
        <script>
            
            // Select the dropdown container
            const dropdown = document.querySelector('.custom-dropdown');
            const selected = dropdown.querySelector('.selected');
            const options = dropdown.querySelector('.dropdown-options');
            const hiddenInput = document.getElementById('paymentMethod');

// Event listener for toggling the dropdown options visibility
            selected.addEventListener('click', () => {
                options.style.display = options.style.display === 'block' ? 'none' : 'block';
            });

// Event listener for handling option selection 
            options.addEventListener('click', (e) => {
                if (e.target.closest('div')) {
                    const selectedOption = e.target.closest('div');
                    selected.innerHTML = selectedOption.innerHTML;
                    hiddenInput.value = selectedOption.getAttribute('data-value');
                    options.style.display = 'none';
                }
            });

// Event listener for closing the dropdown
            document.addEventListener('click', (e) => {
                if (!dropdown.contains(e.target)) {
                    options.style.display = 'none';
                }


                const dropdown = document.querySelector('.custom-dropdown');
                const selected = dropdown.querySelector('.selected');
                const options = dropdown.querySelector('.dropdown-options');
                const hiddenInput = document.getElementById('paymentMethod');
                const payNowButton = document.getElementById('paynow-button');

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

                // Handle PayPal redirection
                payNowButton.addEventListener('click', function (event) {
                    const paymentMethod = hiddenInput.value;

                    if (paymentMethod === 'PayPal') {
                        // Prevent form submission
                        event.preventDefault();

                        // Trigger PayPal payment initiation
                        fetch('initiatePaypalPayment', {
                            method: 'POST',
                            body: new URLSearchParams(new FormData(document.querySelector('form'))),
                        })
                                .then(response => response.json())
                                .then(data => {
                                    if (data.redirectUrl) {
                                        // Redirect to PayPal
                                        window.location.href = data.redirectUrl;
                                    } else {
                                        alert("Error: Unable to initiate PayPal payment.");
                                    }
                                })
                                .catch(error => {
                                    console.error('Error:', error);
                                    alert("Error occurred while processing PayPal payment.");
                                });
                    } else {
                        // Proceed with the form submission for other payment methods
                        document.querySelector('form').submit();
                    }
                });

            });
        </script>


    </body>
</html>