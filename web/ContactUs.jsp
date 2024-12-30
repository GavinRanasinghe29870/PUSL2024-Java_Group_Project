<%-- 
    Document   : ContactUs
    Created on : Nov 19, 2024, 6:51:27 PM
    Author     : gavin
--%><%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <%@include file="components/navbar.jsp" %>
        <link link-style href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #111;
            color: #fff;
            font-size: 16px;
        }

        a {
            color: #000;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

        /* Navbar Styling */
        .navbar {
            background-color: #222;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #444;
        }

        .navbar .logo {
            font-size: 1.5rem;
            font-weight: bold;
            color: #f0c14b;
        }

        .navbar .nav-links a {
            margin-left: 20px;
            font-size: 1rem;
            color: #fff;
        }

        /* Container */
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }

        h1 {
            color: #f0c14b;
            margin-bottom: 10px;
        }

        /* Contact Information Section */
        .contact-details {
            background-color: #f0c14b;
            padding: 20px;
            border-radius: 5px;
            margin-top: 20px;
            color: #000; /* Black Text */
        }

        .contact-details h3 {
            margin-bottom: 10px;
            font-size: 1.1rem;
            color: #000; /* Ensure Black for Headings */
        }

        .contact-details p {
            margin: 5px 0;
            font-size: 1rem;
            color: #000;
        }

        .contact-details a {
            color: #000; /* Black Text for Links */
            text-decoration: underline;
        }

        /* Footer Styling */
        .footer {
            background-color: #222;
            color: #888;
            text-align: center;
            padding: 10px 20px;
            margin-top: 20px;
            border-top: 1px solid #444;
        }

        .footer a {
            color: #f0c14b;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    

    <!-- Content -->
    <div class="container">
        <h1>Contact Us</h1>
        <p>If you would like to reach us, here are our contact details:</p>

        <!-- Contact Information -->
        <div class="contact-details">
            <h3>MARKETING & ADVERTISING</h3>
            <p><strong>Phone:</strong> 0768339279 - Rathmalana</p>
            <p><strong>Email:</strong> <a href="mailto:rathmalana@abccinemas.com">rathmalana@abccinemas.com</a></p>

            <h3>THEATER CONTACT DETAILS</h3>
            <p><strong>KMC Cinema:</strong> 0112247830</p>
            <p><strong>Liberty by ABC Cinema:</strong> 0113597621</p>

            <h3>HELP DESK</h3>
            <p>(9:00 a.m. to 6:00 p.m. Monday - Friday)</p>
            <p><strong>Phone:</strong> 0112247820 / 0768333279</p>
            <p><strong>Email:</strong> <a href="mailto:help@abccinemas.com">help@abccinemas.com</a></p>
        </div>
    </div>

    <!-- Footer -->
      <%@include file="components/footer.jsp" %>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.4/jquery.rateyo.min.js" integrity="sha512-09bUVOnphTvb854qSgkpY/UGKLW9w7ISXGrN0FR/QdXTkjs0D+EfMFMTB+CGiIYvBoFXexYwGUD5FD8xVU89mw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
