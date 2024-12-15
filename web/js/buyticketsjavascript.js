$(document).ready(function () {
    $.ajax({
        url: '/PUSL2024_Group_Project/buyticketsServlet',
        type: 'GET',
        headers: {"X-Requested-With": "XMLHttpRequest"},
        dataType: 'json',
        success: function (data) {
            console.log("Movies:", data);

            // Ensure the container exists and clear its content
            let movieContainer = $('#movie-container'); // Ensure this ID exists in your HTML
            movieContainer.empty();

            if (data.length > 0) {
                data.forEach(movie => {
                    // Initialize an empty string for time slots
                    let timeSlotsHTML = '';

                    // Loop through the timeSlots array and create HTML for each slot
                    movie.timeSlots.forEach(slot => {
                        timeSlotsHTML += `<span class="time-slot">${slot}</span>, `;
                    });

                    // Remove the trailing comma and space
                    timeSlotsHTML = timeSlotsHTML.slice(0, -2);

                    // Create the movie card HTML
                    let movieHTML = `
                    <a href="/PUSL2024_Group_Project/SeatBooking.jsp?id=${movie.id}&name=${movie.name}">
                        <div class="custom-box box container-fluid" id="hoverBox">
                            <h1 class="customBox-text">${movie.name}</h1>
                            <div class="container">
                                <div class="row">
                                    <div class="col">
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
