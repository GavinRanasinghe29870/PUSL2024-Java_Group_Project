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

/**
 *
 * @author gavin
 */
public class SingleBuyTicketsDao {
    private Connection connection;
    private String query2;
    private PreparedStatement stmt;
    private ResultSet rs;

    public SingleBuyTicketsDao(Connection connection) {
        this.connection = connection;
    }

   public SingleBuyTickets getsingleBuyticketsMovieById(int id)
   {    SingleBuyTickets sbmovie = null;
     try { 
         query2 = "SELECT movies.*, GROUP_CONCAT(movie_time_slots.m_time_slot SEPARATOR ', ') AS time_slots " +
             "FROM movies " +
             "JOIN movie_time_slots ON movies.m_id = movie_time_slots.m_id " +
             "WHERE movies.m_id = ? " +
             "GROUP BY movies.m_id;";
         stmt =this.connection.prepareStatement(query2);
         rs =stmt.executeQuery();
         
        while (rs.next()) {
            SingleBuyTickets row = new SingleBuyTickets();
             row.setId(rs.getInt("m_id"));
                row.setName(rs.getString("m_name"));
                row.setDescription(rs.getString("m_description"));
                row.setImageName(rs.getString("m_image"));
                row.setDescription(rs.getString("m_description"));
                row.setGenres(rs.getString("m_genres"));
                row.setCast(rs.getString("m_cast"));
                row.setDirectors(rs.getString("m_directors"));
                row.setWriters(rs.getString("m_writers"));
                row.setProducers(rs.getString("m_producers"));
                row.setMusic(rs.getString("m_music"));
            
               
        }
        
      } catch (Exception e) {
            e.printStackTrace();
        } 

        return sbmovie;
    }
   
//   public singleMovie getsingleMovieById(int id)
//   {    singleMovie smovie = null;
//        try{
//            query="SELECT * FROM movies WHERE m_id=?";
//            stmt = this.connection.prepareStatement(query);
//            stmt.setInt(1, id);
//            rs=stmt.executeQuery();
//            if(rs.next())
//            {
//               
//                smovie = new singleMovie();
//                smovie.setId(rs.getInt("m_id"));
//                smovie.setName(rs.getString("m_name"));
//                smovie.setDescription(rs.getString("m_description"));
//                smovie.setImageName(rs.getString("m_image"));
//                smovie.setGenres(rs.getString("m_genres"));
//                smovie.setCast(rs.getString("m_cast"));
//                smovie.setDirectors(rs.getString("m_directors"));
//                smovie.setProducers(rs.getString("m_producers"));
//                smovie.setWriters(rs.getString("m_writers"));
//                smovie.setMusic(rs.getString("m_music"));
//                
//        }
//        }catch (Exception e) {
//            e.printStackTrace();
//        
//        }
//        return smovie;
//    }
   
}
