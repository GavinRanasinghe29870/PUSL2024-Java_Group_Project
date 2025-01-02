<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign In</title>

        <link href="./CSS/signin.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #000;
            }

            /* Container for the layout */
            .sign_container {
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100vh; /* Full-screen height */
            }

            /* Left side for the logo */
            .logo_section {
                flex: 1;
                text-align: center;
                padding: 20px;
            }

            .logo_section img {
                max-width: 50%; /* Adjust logo size */
                height: auto;
            }

            /* Right side for the form */
            .form_section {
                flex: 1;
                max-width: 400px;
                padding: 20px;
                box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                background: #D4AF37;
                color: #fff;
            }

            .form_section h2 {
                color: #000;
                text-align: center;
                margin-bottom: 20px;

            }

            .form_section label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
                color: #000;

            }

            .form_section input {
                width: 100%;
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 5px;

            }

            .form_section button {
                width: 100%;
                padding: 10px;
                background-color:#D4AF37;
                color: white;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
            }

            .form_section button:hover {
                background-color: #b89230;
            }

        </style>
    </head>
    <body style="background-color: #000000">
        <div class="container">
            <div class="sign_container">
                <div class="logo_section">
                    <img src="Images/navbarlogo.png" alt="Logo">
                </div>
                <div class="form_section">
                    <h2>Sign In</h2>
                    <form action="SigninServlet" method="post">
                        <label for="username">Username</label>
                        <input type="text" id="username" name="username" required>
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" required>
                        <button style="background-color: #000000; color:#fff " type="submit">Sign In</button>
                    </form>
                    <div class="form-group text-center mt-3">
                        <p>
                            Don't have an account?<a href="Signup.jsp"> <span
                                    style="font-size: 0.9em">SIGN UP NOW</span></a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
