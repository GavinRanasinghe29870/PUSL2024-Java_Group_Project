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
    <%@include file="components/allCdn.jsp"%>
    <link href="CSS/signup.css" rel="stylesheet" type="text/css"/>
</head>
<body>
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
