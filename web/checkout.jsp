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
    <%@include file="components/navbar.jsp" %>
    <%@include file="components/allCdn.jsp" %>
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
#myTextBox {
    width: 90%; 
    height: 30px;
    box-sizing: border-box; 


        @media (max-width: 768px) {
            .box {
                flex: 1 1 100%; 
                margin-bottom: 20px; 
            }

            .button-container button {
                width: 80%; 
            }

            #back-button, #paynow-button {
                width: 45%;
                margin: 5px 2%;
            }

            h2 {
                font-size: 1.5rem; 
            }

            label, input {
                font-size: 1rem; 
            }
            
        
    </style>
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
        <form action="purchaseServlet" method="post">
            <div class="content">
                
                <!-- Box 1: Purchase Summary -->
                <div class="box">
                    <h2>Purchase Summary</h2>
                    <hr style="border: 1px solid black;">
                    <div class="purchase-summary">
                        <div class="ticket-item">
                            <label for="adult-tickets">Adult Tickets:</label>
                            <input type="text" id="adult-tickets" name="adultTickets" value="0" readonly> LKR 1000.00
                        </div>
                        <div class="ticket-item">
                            <label for="child-tickets">Child Tickets:</label>
                            <input type="text" id="child-tickets" name="childTickets" value="0" readonly> LKR 00.00
                        </div>
                    </div>
                    
                    <br>
                    
                    <h5><p>Total Amount: LKR 00.00</p></h5>
                    <input type="hidden" id="hidden-total-amount" name="totalAmount" value="0.00">
                    <br>
                    
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
                                <div data-value="Cash">
                                    <img src="Images/cash.png" alt="Cash" class="logo"> Cash
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
                    <input type="text" id="myTextBox" name="name" required><br>
                    <label for="phone">Phone Number:</label><br>
                    <input type="text" id="myTextBox" name="phoneNumber" required><br>
                    <label for="email">Email:</label><br>
                    <input type="email" id="myTextBox" name="email" required><br>
                    <hr style="border: 1px solid black;">
                    <input type="checkbox" id="terms" name="terms" required>
                    <label for="terms">I agree to the <a href="#">Terms & Conditions</a></label>
                </div>
            </div>

            <!-- Buttons -->
            <div class="button-container">
                <button type="button" id="back-button" onclick="history.back();">Back</button>
                <button type="submit" id="paynow-button">Pay Now</button>
            </div>
        </form>
    </div>

    <%@include file="components/footer.jsp" %>

      <script>
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
</script>

</body>
</html>