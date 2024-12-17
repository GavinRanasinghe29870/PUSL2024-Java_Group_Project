package net.abccinema.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

// The DAO (Data Access Object) class for managing operations related to the 'singleMovie' entity

public class singleMovieDAO {
    private Connection connection; // The SQL database connection object
    private String query;
    private PreparedStatement stmt; // PreparedStatement object to execute queries
    private ResultSet rs;// ResultSet object to store the result of a query

// Constructor that takes a database connection as input
    public singleMovieDAO(Connection connection) {
        this.connection = connection; // Initialize the connection
    }

   // Method to get a single movie by its ID
   public singleMovie getsingleMovieById(int id)
   {    singleMovie smovie = null; // Declare a 'singleMovie' object to hold the result
        try{
            query="SELECT * FROM movies WHERE m_id=?"; // SQL query to select a movie with a specific ID from the 'movies' table
            stmt = this.connection.prepareStatement(query); // SQL query to select a movie with a specific ID from the 'movies' table
            stmt.setInt(1, id); // Set the parameter for the query (the movie ID)
            rs=stmt.executeQuery();
            if(rs.next()) // Check if a result is found
            {
               
                smovie = new singleMovie(); // Create a new 'singleMovie' object
                smovie.setId(rs.getInt("m_id"));
                smovie.setName(rs.getString("m_name"));
                smovie.setDescription(rs.getString("m_description"));
                smovie.setImageName(rs.getString("m_image"));
                smovie.setGenres(rs.getString("m_genres"));
                smovie.setCast(rs.getString("m_cast"));
                smovie.setDirectors(rs.getString("m_directors"));
                smovie.setProducers(rs.getString("m_producers"));
                smovie.setWriters(rs.getString("m_writers"));
                smovie.setMusic(rs.getString("m_music"));
                
        }
        }catch (Exception e) {
            e.printStackTrace();
        
        }
        return smovie;
    }
   
       
       
       
   }
            


