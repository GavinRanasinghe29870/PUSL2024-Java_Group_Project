<%-- 
    Document   : profile
    Created on : Nov 28, 2024, 11:01:52 AM
    Author     : MSI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <%@include file="components/allCdn.jsp"%>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/profile.css" />
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>

        <div class="container">

            <div class="profile-container">
                <div class="profile-card">
                    <div class="profile-header">
                        <div class="profile-pic mb-4"></div>
                        <div class="mb-4">
                            <h2>SACHINTHA GIMHAN</h2>
                        </div>
                    </div>
                    <div class="margin-border">
                        <hr style="border-top: 3px solid #D4AF37;">
                    </div>

                    <div class="profile-details">
                        <h5>
                            Email: <span style="color: #9E9E9E;">vihangaisthebest@gmail.com</span>
                        </h5>
                        <h5>
                            Phone Number: <span style="color: #9E9E9E;">077 XXXXXXX</span>
                        </h5>
                        <h5>
                            Address: <span style="color: #9E9E9E;">No:38, Hunnasgala Road, Kurunagala.</span>
                        </h5>
                        <h5>
                            Age: <span style="color: #9E9E9E;">23</span>
                        </h5>
                        <button class="btn btn-log mt-4 px-4 py-2" data-bs-toggle="modal" data-bs-target="#basicmodal">Edit Profile</button>
                    </div>
                    <div class="margin-border">
                        <hr style="border-top: 3px solid #D4AF37;">
                    </div>


                    <div class="booking-section mb-4">
                        <h3>My Bookings</h3>
                        <div class="booking-item mb-1">
                            <p>Despicable ME 4 - Adult 01 -DFGG001(BookingID) - Rs.1000.00</p>
                            <button class="btn cancel-btn">Cancel</button>
                        </div>
                        <div class="booking-item mb-1">
                            <p>Despicable ME 4 - Adult 01 -DFGG001(BookingID) - Rs.1000.00</p>
                            <button class="btn cancel-btn">Cancel</button>
                        </div>
                    </div>
                    <div class="margin-border">
                        <hr style="border-top: 3px solid #D4AF37;">
                    </div>
                    <button class="btn btn-log mt-4 px-4 py-2">Log out</button>
                </div>
            </div>

            <!-- Modal -->
            <div class="modal fade" tabindex="-1" role="dialog" id="basicmodal">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-body">
                            <h4 class="text-center" style="margin-bottom: 50px;">Edit Profile</h4>
                            <form>
                                <div class="form-group">
                                    <label for="movieName">Name:</label>
                                    <input type="text" class="form-control" id="name">
                                </div>
                                <div class="form-group">
                                    <label for="movieImage">Upload Profile Picture:</label>
                                    <input type="file" class="form-control" id="proImage" accept=".jpg, .jpeg, .png">
                                </div>
                                <div class="form-group">
                                    <label for="movieGenres">Email:</label>
                                    <input type="text" class="form-control" id="email">
                                </div>
                                <div class="form-group">
                                    <label for="movieGenres">Phone Number:</label>
                                    <input type="text" class="form-control" id="phoneNo">
                                </div>
                                <div class="form-group">
                                    <label for="movieDescription">Address:</label>
                                    <textarea class="form-control" id="address" rows="2"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="movieGenres">Age:</label>
                                    <input type="text" class="form-control" id="age">
                                </div>
                                <div class="form-group text-center">
                                    <button type="submit" class="btn btn-primary">Update Details</button>
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="components/footer.jsp"%>
    </body>
</html>
