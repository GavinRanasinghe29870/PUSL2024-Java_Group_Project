// Ensure the DOM is fully loaded before executing the code
$(document).ready(function (){
     // Retrieve the movie ID from the URL
    const urlParams = new URLSearchParams(window.location.search);
    const movieId = urlParams.get('id'); // Get the 'id' parameter from the URL

// Check if the 'id' parameter is present in the URL
    if (movieId) {
        // Perform an AJAX GET request to the 'SingleMovieServlet' with the movie ID
    $.ajax({
        url:'/PUSL2024_Group_Project/SingleMovieServlet',
        type:'GET', //GET to fetch data
        data: {id: movieId}, // Send the movie ID as a parameter in the request
        headers:{"X-Requested-With": "XMLHttpRequest"}, // Indicate that this is an AJAX request
        dataType: 'json',
        success: function (movie) { // If the request is successful, the response is a 'movie' object
            console.log("Movies:", movie); // Log the received movie details for debugging

            // Select the container element in the HTML where it Display the movies on the webpage
            let smovieContainer = $('#smovie-container'); // Ensure this ID exists in your HTML
            smovieContainer.empty(); // Clear any existing content

            // Create the HTML structure to display the movie details
                    let movieHTML = `
                     <div class="main" style="background-color:#D4AF37; margin-right:57.5%; text-align: center;" >
                <h1 class=" fw-bold ps-4">${movie.name} </h1>
            </div>
       
                    <div class="content">
                <img src="Images/${movie.imageName}" height: "175px"; object-fit: "cover;"/>
                <button class="btn">BUY TICKETS</button>
        </div>
                    <div class="desc">
            <div class="col">
               <p>${movie.description}</p>
            </div>
        </div>
                    <div class="genre">
            <div class="col1">
                
                <p class="genre-header">GENRES:  <button class="button button1">${movie.genres} </button> </p> 
                
            </div>
        </div>
                    <div class="movie">
            <div class="col2">
                <h4 class="title">Stars :  <p class="text-text2">${movie.cast} </p></h4> <br>
                <h4 class="title">Directors :  <p class="text-text2">${movie.directors} </p></h4> <br>
                <h4 class="title">Writers :  <p class="text-text2">${movie.writers} </p> </h4> <br>
                <h4 class="title">Producers :   <p class="text-text2">${movie.producers} </p></h4> <br>
                <h4 class="title">Music :   <p class="text-text2">${movie.music} </p></h4>
              
            </div>
           
        </div>
                    
                    `;
                    smovieContainer.append(movieHTML); // Append the generated HTML to the container on the webpage
        },
        error: function (xhr, status, error) { // Handle errors if the AJAX request fails
                console.log("Error:", error); // Log the error for debugging
                $('.error-message').text('Failed to fetch movie details: ' + error); // Display the error message on the webpage
            }
        });
    } else {
        // If no 'id' parameter is provided in the URL, log a message and display an error
        console.log("No movie ID provided in the URL.");
        $('.error-message').text('No movie ID specified.'); // Display an error message to the user
    }
    });

        
    


