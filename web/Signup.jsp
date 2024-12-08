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
        <title>JSP Page</title>
    <%@include file="components/allCdn.jsp"%>

    </head>
    <body>
        <!-- Header Section with Logo and Title -->
        <div class="sign_header">
            < <img src="Images/navbarlogo.png" width="110px" alt="Logo" style="display: block; margin: auto;" />
            <h1 style="color:#D4AF37; text-align :center;">Sign Up</h1>
        </div>

        <!-- Signup Form -->

        <div class="sign_container d-flex">
            <!-- Left Side -->
            <div class="sign_part">
                <form action="SignupServlet" method="post">
                    <label for="id">Full Name</label> 
                    <input type="text" class="form-control" id="name" name="full name">
                    <label for="id">Age</label> 
                    <input type="text" class="form-control" id="age" name="age">
                    <label for="id">User Name</label> 
                    <input type="text" class="form-control" id="username" name="username"> 
                    <label for="id">Password</label> 
                    <input type="password" class="form-control" id="password" name="password">
                    <label for="id">Re-enter Password </label> 
                    <input type="password" class="form-control" id="repassword" name="repassword">
                </form>

            </div>

            <!-- Right Side -->
            <div class="sign_part">
                <form action="SignupServlet" method="post">
                    <label for="id">Phone Number</label> 
                    <input type="tel" class="form-control" id="phonenumber" name="phone number">
                    <label for="id">Address</label> 
                    <input type="text" class="form-control" rows="3" id="address" name="address">
                    <label for="id">Email</label> 
                    <input type="email" class="form-control" id="email" name="email">                    
                    <label for="id">Gender</label>                 
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="gender" id="male" value="male">
                        <label class="form-check-label" for="male">Male</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="gender"  id="female" value="female">
                        <label class="form-check-label" for="female">Female</label>
                    </div>
                    </form>
                
            </div>
        </div>
    <center> 
        <br>
         <button type="submit" style="background-color: #D4AF37; color: white; padding: 10px 20px; border: none; border-radius: 5px; font-size: 16px; cursor: pointer;">Sign up
           </center>
</body>

</html>
