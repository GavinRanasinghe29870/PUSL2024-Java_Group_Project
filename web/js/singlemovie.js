$(document).ready(function (){
     // Retrieve the movie ID from the URL
    const urlParams = new URLSearchParams(window.location.search);
    const movieId = urlParams.get('id');

    if (movieId) {
    $.ajax({
        url:'/PUSL2024_Group_Project/SingleMovieServlet',
        type:'GET',
        data: {id: movieId},
        headers:{"X-Requested-With": "XMLHttpRequest"},
        dataType: 'json',
        success: function (movie) {
            console.log("Movies:", movie);

            // Display the movies on the webpage
            let smovieContainer = $('#smovie-container'); // Ensure this ID exists in your HTML
            smovieContainer.empty(); // Clear any existing content

            
                    let movieHTML = `
                     <div class="main" style="background-color:#D4AF37; margin-right:57.5%; text-align: center;" >
                <h1 class=" fw-bold ps-4">${movie.name} </h1>
            </div>
       
                    <div class="content">
                <img src="Images/${movie.imageName}" class="img-fluid"/>
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
                    smovieContainer.append(movieHTML);
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

        
    


