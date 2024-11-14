<%-- 
    Document   : checkout
    Created on : Nov 11, 2024, 6:46:30 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #333;
            color: #fff;
            background-color:#BF873E;
        }
        .container {
   
            margin: auto;
            background-color: #b8860b;
            padding: 80px;
            border-radius: 10px;
        }
        .content {
            display: flex;
            justify-content: space-between;
        }
        .box {
            width: 45%;
            padding: 20px;
            background-color: #000;
            border-radius: 0px;
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
            width: 30%;
            padding: 10px;
            margin: 10px 1%;
            border: none;
            border-radius: 5px;
            background-color: #d4af37;
            color: #000;
            cursor: pointer;
        }
        .box button:hover {
            background-color: #c0a16b;
        }
       .button-container button { width: 38%; 
                                  padding: 10px;
                                  margin: 10px 1%; 
                                  border: none; 
                                  border-radius: 5px; 
                                  background-color: #d4af37;/* Gold color */
                                  color: #000; /* Black text */
                                  cursor: pointer; 
                                 justify-content: center;
       }
        
    </style>
</head>
<body>
    <div class="container">
        <div class="content">
            <div class="box">
                <h2>Purchase Summary</h2>
                <p>Adult Ticket: LKR 1000.00</p>
                <p>Child Ticket: LKR 00.00</p>
                <p>Total Amount: LKR 00.00</p>
                <h3>Payment Method</h3>
                <button>Add Card</button>
                <br>
                <img src="mastercard." alt="MasterCard">
                <img src="visa.png" alt="Visa">
            </div>
            <div class="box">
                <h2>Your Details</h2> <br>
                <label for="name">Name:</label>
                <input type="text" id="name" name="name">
                 <br>
                <label for="phone">Phone Number:</label>
                <input type="text" id="phone" name="phone">
                 <br>
                <label for="email">Email:</label>
                <input type="email" id="email" name="email">
                 <br>
                <input type="checkbox" id="terms" name="terms">
               
                <label for="terms">I agree to the <a href="#">Terms & Conditions</a></label>
                <div>
                   
                </div>
                
                
            </div>
        </div>
        <div class="button-container"> 
            <button>Back</button> 
            <button>Pay Now</button> 
        </div>
    </div>
     
</body>
</html>

