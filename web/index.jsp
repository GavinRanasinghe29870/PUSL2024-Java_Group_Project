<%-- 
    Document   : index
    Created on : Nov 10, 2024, 9:18:36 PM
    Author     : kavis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList" %>
<%@page import="net.abccinema.connection.DbCon" %>
<%@page import="net.abccinema.model.*" %>
<%@page import="net.abccinema.servlet.*" %>

<%
    TestimonialsDao td = new TestimonialsDao(DbCon.getConnection());
    List<Testimonials> testimonials = td.getAllTestimonial();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ABC Cinema - Buy Movie Tickets Online for the Latest Movies</title>
        <%@include file="components/allCdn.jsp"%>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/index.css" /> 
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        
        <!-- Carousel -->
        <div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <div class="overlay"></div>
                    <img src="Images/despicable-me-4_1440.jpg" height="720px" class="d-block w-100" alt="...">
                    <div class="container carousel-caption d-flex flex-column flex-md-row justify-content-between align-items-center align-items-md-end">
                        <div class="text-left mb-3 mb-md-0">
                            <h3>Despicable Me 4</h3>
                            <p>Action <span> &#183; </span> 2h 30m - <span style=" color: #D4AF37; font-weight: bold; border: solid 1px; border-radius: 8px; padding: 2px 6px;">PG</span></p>
                        </div>
                        <div class="text-right">
                            <button class="btn btn-lg btn-log">Book Now</button>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="overlay"></div>
                    <img src="Images/kanguva_1440.jpg" height="720px" class="d-block w-100" alt="...">
                    <div class="container carousel-caption d-flex flex-column flex-md-row justify-content-between align-items-center align-items-md-end">
                        <div class="text-left mb-3 mb-md-0">
                            <h3>Kanguva (Tamil)</h3>
                            <p>Action <span> &#183; </span> 2h 30m - <span style=" color: #D4AF37; font-weight: bold; border: solid 1px; border-radius: 8px; padding: 2px 6px;">15+</span></p>
                        </div>
                        <div class="text-right">
                            <button class="btn btn-lg btn-log">Book Now</button>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="overlay"></div>
                    <img src="Images/ven_1440x720_v1-min.jpg" class="d-block w-100" alt="...">
                    <div class="container carousel-caption d-flex flex-column flex-md-row justify-content-between align-items-center align-items-md-end">
                        <div class="text-left mb-3 mb-md-0">
                            <h3>Venom: The Last Dance</h3>
                            <p>Action <span> &#183; </span> 1h 50m - <span style=" color: #D4AF37; font-weight: bold; border: solid 1px; border-radius: 8px; padding: 2px 6px;">PG15</span></p>
                        </div>
                        <div class="text-right">
                            <button class="btn btn-lg btn-log">Book Now</button>
                        </div>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
        <!-- Carousel -->

        <!-- Now Showing -->

        <div class="custom-margin" style="background-color: #D4AF37;">
            <div class="container">
                <h5 class="text-center fw-bold display-4" style="color: #0D0C0C;">Now <span style="color: white;">Showing</span></h5>

                <div class="owl-carousel card-carousel owl-theme">
                    <div class="item">
                        <div class="card card-color">
                            <img src="./Images/venom.jpg" alt="" class="card-img-top">
                            <div class="card-body text-center">
                                <div class="card-title">VENOM: THE LAST DANCE</div>
                                <div class="card-body text-center">
                                    <a href="#" class="card-link link-style">MORE INFO</a>
                                </div>
                                <a href="#" class="btn btn-lg btn-card">Buy Ticket</a>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="card card-color">
                            <img src="./Images/venom.jpg" alt="" class="card-img-top">
                            <div class="card-body text-center">
                                <div class="card-title">RED ONE</div>
                                <div class="card-body text-center">
                                    <a href="#" class="card-link link-style">MORE INFO</a>
                                </div>
                                <a href="#" class="btn btn-lg btn-card">Buy Ticket</a>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="card card-color">
                            <img src="./Images/venom.jpg" alt="" class="card-img-top">
                            <div class="card-body text-center">
                                <div class="card-title">BHOOL BHULAIYAA 3</div>
                                <div class="card-body text-center">
                                    <a href="#" class="card-link link-style">MORE INFO</a>
                                </div>
                                <a href="#" class="btn btn-lg btn-card">Buy Ticket</a>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="card card-color">
                            <img src="./Images/venom.jpg" alt="" class="card-img-top">
                            <div class="card-body text-center">
                                <div class="card-title">SINGHAM AGAIN (HINDI)</div>
                                <div class="card-body text-center">
                                    <a href="#" class="card-link link-style">MORE INFO</a>
                                </div>
                                <a href="#" class="btn btn-lg btn-card">Buy Ticket</a>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="card card-color">
                            <img src="./Images/venom.jpg" alt="" class="card-img-top">
                            <div class="card-body text-center">
                                <div class="card-title">AMARAN (TAMIL)</div>
                                <div class="card-body text-center">
                                    <a href="#" class="card-link link-style">MORE INFO</a>
                                </div>
                                <a href="#" class="btn btn-lg btn-card">Buy Ticket</a>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="card card-color">
                            <img src="./Images/venom.jpg" alt="" class="card-img-top">
                            <div class="card-body text-center">
                                <div class="card-title">IT ENDS WITH US</div>
                                <div class="card-body text-center">
                                    <a href="#" class="card-link link-style">MORE INFO</a>
                                </div>
                                <a href="#" class="btn btn-lg btn-card">Buy Ticket</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Now Showing -->

        <!-- Testimonials -->

        <div class="container mb-5">
            <div class="row">
                <div class="col-lg-4 col-md-5">
                    <h5 class="text-left fw-bold display-4 testimonial-heading" style="color: white;">❝ What Our Customers Say ❞</span></h5>
                </div>

                <div class="col-lg-8 col-md-7">
                    <div class="owl-carousel testimonial-carousel owl-theme">
                        <%
                            if (!testimonials.isEmpty()) {
                                for (int i = 0; i < testimonials.size(); i++) {
                                    Testimonials t = testimonials.get(i);
                        %>
                        <div class="item">
                            <div class="card custom-card">
                                <div class="card-body card-body-test text-left">
                                    <h4 class="fw-bold">
                                        <%= t.getFullName()%>
                                    </h4>
                                    <p>"<%= t.getMessage()%>"</p>
                                    <div class="rating-box d-flex">
                                        <h5 class="rate mt-2">Rate: </h5>
                                        <div class="mb-2" id="rating-<%= i%>"></div>
                                        <script>
                                            $(function () {
                                                $('#rating-<%= i%>').rateYo({
                                                    rating: <%= t.getRating()%>,
                                                    readOnly: true
                                                });
                                            });
                                        </script>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                                }
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>

        <!-- Testimonials -->

        <%@include file="components/footer.jsp"%>

        <script>
            // Card Carousel
            $('.card-carousel').owlCarousel({
                loop: true,
                margin: 10,
                nav: true,
                autoplay: true,
                autoplayTimeout: 5000,
                responsive: {
                    0: {
                        items: 1
                    },
                    600: {
                        items: 2
                    },
                    1000: {
                        items: 4
                    }
                }
            });

            // Testimonial Carousel
            $('.testimonial-carousel').owlCarousel({
                loop: false,
                margin: 10,
                nav: true,
                autoplay: false,
                autoplayTimeout: 6500,
                responsive: {
                    0: {
                        items: 1
                    },
                    600: {
                        items: 1
                    },
                    1000: {
                        items: 2
                    }
                }
            });
        </script>

    </body>
</html>
