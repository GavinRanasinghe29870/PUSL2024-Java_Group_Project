<%-- 
    Document   : Signup
    Created on : Dec 8, 2024, 10:31:10 PM
    Author     : dulit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
        <link link-style href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body, h1, h2, h3, h4, p, div, input, label, button {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: Arial, sans-serif;
            }

            body {
                background-color: #D4AF37;
                color: #333;
                line-height: 1.6;
            }

            /* Header Section */
            .sign_header {
                background-color: #0D0C0C;
                padding: 20px 0;
                border-bottom: 2px solid #D4AF37;
                margin-bottom: 20px;
            }

            .sign_header h1 {
                font-size: 2.5rem;
                font-weight: bold;
                margin-top: 10px;
            }

            /* Form Container */
            .sign_container {
                background-color: #D4AF37; /* Set container color */
                max-width: 600px;
                margin: 20px auto;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            }

            .sign_part {
                display: flex;
                flex-wrap: wrap;
                gap: 20px;
            }

            /* Left and Right Form Sections */
            .form-section-left,
            .form-section-right {
                flex: 1;
                display: flex;
                flex-direction: column;
                gap: 15px;
            }

            label {
                font-weight: bold;
                margin-bottom: 5px;
            }

            input[type="text"],
            input[type="password"],
            input[type="tel"],
            input[type="email"] {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 1rem;
            }

            input:focus {
                border-color: #333;
                outline: none;
            }

            .form-check {
                display: flex;
                align-items: center;
                gap: 10px;
            }

            /* Submit Button */
            .signup-button {
                background-color: #000000; /* Gold color */
                color: #fff; /* White text */
                border: none;
                padding: 8px 0px 2px 30px; /* Adjust padding for smaller height */
                font-size: 1rem; /* Font size */
                font-weight: 500;
                border-radius: 5px; /* Slightly rounded corners */
                cursor: pointer;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2); /* Subtle shadow for depth */
                transition: background-color 0.3s, box-shadow 0.3s; /* Smooth transitions */
            }

            .signup-button:hover {
                background-color: #555;
            }

            /* Centering Submit Button */
            .form-submit {
                display: flex;
                justify-content: center;
            }

            /* Split Form Sections */
            .form-section-left {
                margin-right: 10px;
            }

            .form-section-right {
                margin-left: 10px;
            }

        </style>
    </head>
    <body style="background-color: #000000">
        <!-- Header Section with Logo and Title -->
        <div class="sign_header">
            <img src="Images/navbarlogo.png" width="110px" alt="Logo" style="display: block; margin: auto;" />
            <h1 style="color:#D4AF37; text-align: center;">Sign Up</h1>
        </div>

        <!-- Signup Form Container -->
        <div class="sign_container">
            <form action="SignupServlet" method="POST" class="sign_part">
                <!-- Left Side -->
                <div class="form-section-left">
                    <label for="name">Full Name</label>
                    <input type="text" class="form-control" id="name" name="full_name" required>

                    <label for="age">Age</label>
                    <input type="text" class="form-control" id="age" name="age" required>

                    <label for="username">User Name</label>
                    <input type="text" class="form-control" id="username" name="username" required>

                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required>

                    <label for="repassword">Re-enter Password</label>
                    <input type="password" class="form-control" id="repassword" name="repassword" required>
                </div>

                <!-- Right Side -->
                <div class="form-section-right">
                    <label for="phonenumber">Phone Number</label>
                    <input type="tel" class="form-control" id="phonenumber" name="phone_number" required>

                    <label for="address">Address</label>
                    <input type="text" class="form-control" id="address" name="address" required>

                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email" required>

                    <label>Gender</label>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="gender" id="male" value="male" required>
                        <label class="form-check-label" for="male">Male</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="gender" id="female" value="female" required>
                        <label class="form-check-label" for="female">Female</label>
                    </div>
                </div>

                <!-- Submit Button -->
                <div class="form-submit">
                    <button type="submit" class="signup-button" style="padding: 5px 10px; font-size: 0.9rem;">Sign Up</button>
                </div>
            </form>
        </div>
    </body>
</html>
