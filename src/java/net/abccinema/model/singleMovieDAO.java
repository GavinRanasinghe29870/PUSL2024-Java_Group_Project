/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package net.abccinema.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;
/**
 *
 * @author Vihanga
 */
public class singleMovieDAO {
    private Connection connection;
     
 
    public singleMovieDAO(Connection connection)
    { 
        this.connection = connection;
    }
    
    //Get all movie names
    public List<String>getAllsingleMovieNames() throws SQLException {
        List<String> names = new ArrayList<>();
        String query = "SELECT name FROM singlemovie";
        try(PreparedStatement stmt = connection.prepareStatement(query);
            ResultSet rs = stmt.executeQuery()){
            while (rs.next()){
                names.add(rs.getString("name"));
            }
        }
        return names;
    }


    
    public singleMovie getsingleMovieByName(String name) throws SQLException{
        String query = "SELECT * FROM singleMovie WHERE name = ?";
        try(PreparedStatement stmt = connection.prepareStatement(query)) {
           stmt.setString(1,name);
           try(ResultSet rs = stmt.executeQuery()){
               if(rs.next()){
                   return new singleMovie(
                        rs.getString("name"),
                        rs.getString("movieDesc"),
                        rs.getString("imageURL"),
                        rs.getString("genres"),
                        rs.getString("stars"),
                        rs.getString("directors"),
                        rs.getString("writers"),
                        rs.getString("producers"),
                        rs.getString("music"));

            }
        }
    }

  return null;
}
}

