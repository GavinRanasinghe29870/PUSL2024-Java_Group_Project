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
       <%@include file = "components/navbar.jsp" %>
        <%@include file = "components/allCdn.jsp" %>
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
            border: 2px solid black;
            
        }
        .box {
            width: 50%;
            padding: 20px;
            background-color: #D4AF37;
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
            width: 20%;
            padding: 10px;
            margin: 10px 1%;
            border: none;
            border-radius: 5px;
            background-color: #000;
            color:#ffffff;
            cursor: pointer;
             justify-content: center;
        }
        .box button:hover {
            background-color: #c0a16b;
             justify-content: center;
        }
       .button-container button { width: 10%; 
                                  padding: 10px;
                                 
                                  border: none; 
                                  border-radius: 5px; 
                                  background-color: #D4AF37;
                                  color: #000;
                                  cursor: pointer; 
                                gap: 20px; 
                                margin-top: 20px; 
                                justify-content: center;
                                align-items: center;
    
                                
 
       }
      #myTextBox {
    width: 90%; /* Match the input fields' width with the parent container */
    height: 30px;
    box-sizing: border-box; /* Ensure padding doesn't overflow */
}

  
  

#back-button, #paynow-button {
    padding: 10px 20px;
    background-color: #d4a420; /* Button background color */
    border: none;
    color: #000;
    font-weight: bold;
    cursor: pointer;
    
}

#back-button:hover, #paynow-button:hover {
    background-color: #b48818; /* Hover color */
}
input[type="text"] {
  width: 20px; /* Adjust the width as needed */
  height: 20px; /* Adjust the height as needed */
  border: 1px solid #ccc; /* Border style and color */
  border-radius: 5px; /* Rounded corners */
  text-align: center; /* Center the text */
  font-size: 12px; /* Font size */
}
.payment-method {
  text-align: left;
  margin-top: 10px;
}

.payment-method p {
  margin-bottom: 10px;
  font-weight: bold;
}

.logo {
  height: 32px; /* Increase the height for larger logos */
  width: auto;  /* Maintain aspect ratio */
}

.logos {
  gap: 15px; /* Increase the spacing between logos, if necessary */
}

.add-card {
  padding: 8px 12px;
  background-color: #000; /* Adjust button color */
  color: #fff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

.add-card:hover {
  background-color: #444; /* Button hover effect */
}



      
       
        
    </style>
</head>
<body>
   
    <div class="container">
       
        <div class="content">
            <div class="box">
                <h2>Purchase Summary</h2>
                <hr style="border: 1px solid black;">
<div class="purchase-summary">
    <div class="ticket-item">
        <label for="adult-tickets">Adult Tickets: </label>
        <input type="text" id="adult-tickets" value="0" readonly>   LKR 1000.00</div>
    <div class="ticket-item">
        <label for="child-tickets">Child Tickets:</label>
        <input type="text" id="child-tickets" value="0" readonly>  LKR 00.00</div>
</div>
                <br>
                <h5><p>Total Amount: LKR 00.00</p></h5>
                <br>
               <hr style="border: 1px solid black;">

                <div class="payment-method">
   <h3>Payment Method</h3>
                <button>Add Card</button>
              
                 <img src="Images/mastercard.png" alt="MasterCard" class="logo">
      <img src="Images/visa.png" alt="Visa" class="logo">
            </div>



            </div>
              <hr style="border: 1px solid black;">

            <div class="box">
                <div class="text-container">
                <h2>Your Details</h2> <br>
                <hr style="border: 1px solid black;">

                <label for="name">Name:</label><br>
                <input type="text" style="color: black;" id="myTextBox" name="name">
                
                 <br>
                <label for="phone">Phone Number:</label><br>
                <input type="text" id="myTextBox" name="phone">
                 <br>
                <label for="email">Email:</label><br>
                <input type="email" id="myTextBox" name="email">
                 <br>
                 <hr style="border: 1px solid black;">

                <input type="checkbox" id="terms" name="terms">
               
                <label for="terms">I agree to the <a href="#">Terms & Conditions</a></label>
                <div>
                   <div class="separator"></div>
                </div>
                </div>
                
                
            </div>
        </div>
        <div class="mb-3 text-center">
        <div class="button-container">
    <button id="back-button">Back</button>
    <button id="paynow-button">Pay Now</button>
</div>
        </div>
    </div>
    </div>
    </div>
     <%@include file="components/footer.jsp"%>
</body>
</html>

