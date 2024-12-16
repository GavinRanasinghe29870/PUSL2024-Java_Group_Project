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

            
                    let movieHTML = `
                     <div class="main" style="background-color:#D4AF37; margin-right:57.5%; text-align: center;" >
                <h1 class=" fw-bold ps-4">${sbmovie.name} </h1>
            </div>
       
                    <div class="content">
                <img src="Images/${sbmovie.imageName}" class="img-fluid"/>
                <button class="btn">BUY TICKETS</button>
        </div>
                    <div class="desc">
            <div class="col">
               <p>${sbmovie.description}</p>
            </div>
        </div>
                    <div class="genre">
            <div class="col1">
                
                <p class="genre-header">GENRES:  <button class="button button1">${sbmovie.genres} </button> </p> 
                
            </div>
        </div>
                    <div class="movie">
            <div class="col2">
                <h4 class="title">Stars :  <p class="text-text2">${sbmovie.cast} </p></h4> <br>
                <h4 class="title">Directors :  <p class="text-text2">${sbmovie.directors} </p></h4> <br>
                <h4 class="title">Writers :  <p class="text-text2">${sbmovie.writers} </p> </h4> <br>
                <h4 class="title">Producers :   <p class="text-text2">${sbmovie.producers} </p></h4> <br>
                <h4 class="title">Music :   <p class="text-text2">${sbmovie.music} </p></h4>
              
            </div>
           
        </div>
                    
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

        
    




