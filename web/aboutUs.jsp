<%-- 
    Document   : aboutUs
    Created on : Nov 16, 2024, 2:29:11 PM
    Author     : Vihanga
--%>

<%-- 
    Document   : aboutUs
    Created on : Nov 16, 2024, 2:29:11 PM
    Author     : Vihanga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About Us</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/aboutUs.css" /> 
        <%@include file = "components/navbar.jsp" %>
        <%@include file = "components/allCdn.jsp" %>
    </head>
    
        <body style="background-color: #0D0C0C ">
        <hr style="border-top: 3px solid #D4AF37;">
        <div style="background-color: #000000; padding-top:2px;">
           
            <!-- About Us -->
        <p class="Custom-title" data-text="About Us">About Us</p>
        </div>
        <hr style="border-top: 3px solid #D4AF37;">
        
        <!-- About ABC Cinema -->   
        <section class="aboutUs">
            <div class="about-image">
                <img src="Images/about.jpg">
                
            </div>
            
            <div class="about-text">
                <h3>ABOUT ABC CINEMAS</h3>
                <p>Committed to elevating the standard of Sri Lankan cinema,<br> 
                   ABC strives to provide our guests the flair of vintage movie<br> 
                   theaters along with cutting-edge luxury and modernity that<br> 
                   meet the highest global standards.
                </p>
            </div>
        </section>
        
        <hr style="border-top: 3px solid #D4AF37;">
        
        <!-- Our Vision -->
   
        <div class="row">
            <div class="col-12 col-md-6">
                <div class="subBox">
                    <h4>VISION</h4>
                    
                    <div class="text">
                        <p>To be the first holistic premium amusement firm in<br> 
                            Sri Lanka which pushes the boundaries of the sector<br> 
                            by offering clients across all backgrounds creative<br> 
                           remedies.
                    </div>
                </div>
            </div>
        </div>
       <section class="vision">
            <div class="vision-text">
                <p>To be the first holistic premium amusement firm in Sri Lanka<br> 
                    which pushes the boundaries of the sector by offering clients<br> 
                   across all backgrounds creative remedies.
                </p>
            </div>
        </section>
        
       
            
       
        
    </body>
</html>