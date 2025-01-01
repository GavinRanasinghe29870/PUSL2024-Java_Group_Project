<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/style.css" /> 

<section class="footer-section" style="background-color: #D4AF37; padding: 40px 0;">
    <div class="container">
        <div class="row mb-4">
            <div class="col-12 col-md-2 d-flex flex-column align-items-center justify-content-center mb-4 mb-md-0">
                <img src="Images/footerlogo.png" width="200px" alt="logo" class="img-fluid mb-3">
                <p class="mb-1"><i class="fa-solid fa-phone"></i> (011) 456-7890</p>
                <p><i class="fa-solid fa-envelope"></i> info@abc.lk</p>
            </div>
            <div class="col-md-1 d-flex justify-content-center align-items-center">
            </div>
            <div class="col-md-4 mt-5 d-flex justify-content-evenly">
                <div>
                    <h5 class="footer-title">Quick Links</h5>
                    <ul class="list-unstyled">
                        <li><a href="#" class="footer-item">Home</a></li>
                        <li><a href="#" class="footer-item">Movies</a></li>
                        <li><a href="#" class="footer-item">Buy Tickets</a></li>
                        <li><a href="#" class="footer-item">Contact Us</a></li>
                    </ul>
                </div>
                <div>
                    <h5 class="footer-title">Company</h5>
                    <ul class="list-unstyled">
                        <li><a href="#" class="footer-item">Careers</a></li>
                        <li><a href="#" class="footer-item">About Us</a></li>
                        <li><a href="#" class="footer-item">Terms and Conditions</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-1 d-flex justify-content-center align-items-center">
                <div class="vr"></div>
            </div>
            <div class="col-md-4 mt-5">
                <div>
                    <f:if test="${not empty succMsg}">
                        <div class="alert alert-success d-flex align-items-center" role="alert">
                            <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
                            <div>
                                ${succMsg}
                            </div>
                        </div>
                        <f:remove var="succMsg" scope="session" />
                    </f:if>

                    <f:if test="${not empty failedMsg}">
                        <div class="alert alert-danger d-flex align-items-center" role="alert">
                            <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
                            <div>
                                ${failedMsg}
                            </div>
                        </div>
                        <f:remove var="failedMsg" scope="session" />
                    </f:if>
                        
                    <form action="FeedbackServlet" method="post">
                        <h5 class="footer-title">Tell Us about your Experience</h5>
                        <div class="mb-3">
                            <textarea class="form-control" id="message" name="message" rows="4" placeholder="Your message..." required></textarea>
                        </div>
                        <div class="d-flex align-items-center mb-2">
                            <h5 class="rate mt-2">Rate Us: </h5>
                            <div class="mb-2" id="rating">
                                <input type="hidden" name="hdrating" id="hdrating">
                            </div>
                        </div>
                        <div class="mb-3 text-end">
                            <button type="submit" class="btn btn-dark btn-lg">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="border-bottom border-light"></div>
        <div class="row mt-4">
            <div class="col-md-6">
                <p class="text-center text-md-start">© <%= java.util.Calendar.getInstance().get(java.util.Calendar.YEAR)%> ABC Cinema. All Rights Reserved.</p>
            </div>
            <div class="col-md-6">
                <ul class="list-unstyled list-inline social text-center text-md-end">
                    <li class="list-inline-item"><a href="#" class="footer-item circle"><i
                                class="fab fa-facebook-f"></i></a></li>
                    <li class="list-inline-item"><a href="#" class="footer-item circle"><i
                                class="fab fa-twitter"></i></a></li>
                    <li class="list-inline-item"><a href="#" class="footer-item circle"><i
                                class="fab fa-instagram"></i></a></li>
                    <li class="list-inline-item"><a href="#" class="footer-item circle"><i
                                class="fab fa-linkedin"></i></a></li>
                </ul>
            </div>
        </div>
    </div>
</section>

<script>
    $(function () {
        $("#rating").rateYo({
            rating: 0,
            numStars: 5,
            maxValue: 5,
            halfStar: true,
            onSet: function (rating, rateYoInstance) {
                $('#hdrating').val(rating);
            }
        });
    });
</script>