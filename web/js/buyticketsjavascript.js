$(document).ready(function () {
    $.ajax({
        url: '/PUSL2024_Group_Project/buyticketsServlet',
        type: 'GET',
        headers: {"X-Requested-With": "XMLHttpRequest"},
        dataType: 'json',
        success: function (data) {
            console.log("Movies:", data);

          
            let movieContainer = $('#movie-container');
            movieContainer.empty();

            if (data.length > 0) {
                data.forEach(movie => {
                    
                    let timeSlotsHTML = '';
                    let timeSlotsParams = ''; 

                    
                    movie.timeSlots.forEach(slot => {
                        timeSlotsHTML += `<span class="time-slot">${slot}</span>, `;
                        timeSlotsParams += encodeURIComponent(slot) + '&'; 
                    });

                 
                    timeSlotsHTML = timeSlotsHTML.slice(0, -2);
                    
                    timeSlotsParams = timeSlotsParams.slice(0, -1);

                    // Create the movie card HTML
                    let movieHTML = `
                    <a href="/PUSL2024_Group_Project/SeatBooking.jsp?id=${movie.id}&name=${movie.name}&timeSlots=${timeSlotsParams}&adultTicketPrice=${movie.ticketPriceAdult}&childTicketPrice=${movie.ticketsPriceChild}">
                        <div class="custom-box box container-fluid" id="hoverBox">
                            <h1 class="customBox-text">${movie.name}</h1>
                            <div class="container">
                                <div class="row">
                                    <div class="col pt-2">
                                        <p class="customBox-text">${movie.description}</p>
                                    </div>
                                    <div class="col">
                                        <img src="Images/${movie.imageName}" width="80%" alt="${movie.imageName}" />
                                    </div>
                                </div>
                                <div>
                                    <p class="customBox-text">Time Slots: ${timeSlotsHTML}</p>
                                </div>
                            </div>
                        </div>
                    </a>
                    `;
                    movieContainer.append(movieHTML);
                });
            } else {
                movieContainer.append('<p>No movies available.</p>');
            }
        },
        error: function (xhr, status, error) {
            console.log("Error:", error);
            $('.error-message').text('Failed to fetch data: ' + error);
        }
    });
});
