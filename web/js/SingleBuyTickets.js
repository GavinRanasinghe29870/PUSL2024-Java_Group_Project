$(document).ready(function (){
     // Retrieve the movie ID from the URL
    const urlParams = new URLSearchParams(window.location.search);
    const sbmovieId = urlParams.get('id');

    if (sbmovieId) {
    $.ajax({
        url:'/PUSL2024_Group_Project/SingleBuyTicketsServlet',
        type:'GET',
        data: {id: sbmovieId},
        headers:{"X-Requested-With": "XMLHttpRequest"},
        dataType: 'json',
        success: function (sbmovie) {
            console.log("Movies:", sbmovie);

            // Displaying the movies on the webpage
            let sbmoviecontainer = $('#sbmoviecontainer'); 
            sbmoviecontainer.empty();
            
            let timeSlotsHTML = '';
                    let timeSlotsParams = ''; 

                    
                    sbmovie.timeSlots.forEach(slot => {
                        timeSlotsHTML += `<span class="time-slot">${slot}</span>, `;
                        timeSlotsParams += encodeURIComponent(slot) + '&'; 
                    });

                 
                    timeSlotsHTML = timeSlotsHTML.slice(0, -2);
                    
                    timeSlotsParams = timeSlotsParams.slice(0, -1);

            
                    let movieHTML = `
                     <a href="/PUSL2024_Group_Project/SeatBooking.jsp?id=${sbmovie.id}&name=${sbmovie.name}&timeSlots=${timeSlotsParams}&adultTicketPrice=${movie.ticketPriceAdult}&childTicketPrice=${movie.ticketsPriceChild}">
                        <div style="background-color: #fff; class="sbcustom-box box container-fluid">
                            <h1 class="sbcustomBox-text">${sbmovie.name}</h1>
                            <div class="container">
                                <div class="row">
                                    <div class="col pt-2">
                                        <p class="sbcustomBox-text">${sbmovie.description}</p>
                                    </div>
                                    <div class="col">
                                        <img src="Images/${sbmovie.imageName}" width="80%" alt="${sbmovie.imageName}" />
                                    </div>
                                </div>
                                <div>
                                    <p class="customBox-text">Time Slots: ${timeSlotsHTML}</p>
                                </div>
                            </div>
                        </div>
                    </a>
                    
                    `;
                    sbmoviecontainer.append(movieHTML);
        },
        error: function (xhr, status, error) {
                console.log("Error:", error);
                $('.error-message').text('Failed to fetch movie details: ' + error);
            }
        });
    } else {
        console.log("No movie ID provided in the URL.");
        $('.error-message').text('No movie ID specified.');
    }
    });

        
    




