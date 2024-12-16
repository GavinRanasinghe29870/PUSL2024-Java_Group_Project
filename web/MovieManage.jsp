<%-- 
    Document   : Sign in
    Created on : Nov 11, 2024, 11:01:10 AM
    Author     : dulit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign In</title>
        <%@include file="components/allCdn.jsp"%>
        <link href="CSS/sign in.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <!-- Sign In Container -->
        <div class="sign_container">
            <!-- Left Side: Logo -->
            <div class="logo_section">
                <img src="Images/navbarlogo.png" alt="Logo">
            </div>

            <!-- Right Side: Form -->
            <div class="form_section">
                <h2>Sign In</h2>
                <form action="SigninServlet" method="post">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" required>
                   
                 
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required>

                    <button type="submit">Sign In</button>
                </form>
            </div>
        </div>
    </body>
</html>
