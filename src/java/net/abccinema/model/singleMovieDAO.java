package net.abccinema.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class singleMovieDAO {
    private Connection connection;
    private String query;
    private PreparedStatement stmt;
    private ResultSet rs;

    public singleMovieDAO(Connection connection) {
        this.connection = connection;
    }

   public List<singleMovie> getAllsingleMovieNames(){
       List<singleMovie> singleM = new ArrayList<>();
     try { 
         query="SELECT * FROM movies";
         stmt =this.connection.prepareStatement(query);
         rs =stmt.executeQuery();
         
        while (rs.next()) {
            singleMovie row = new singleMovie();
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
            
            singleM.add(row);   
        }
        
      } catch (Exception e) {
            e.printStackTrace();
        } 

        return singleM;
    }
   
   public singleMovie getsingleMovieById(int id)
   {    singleMovie smovie = null;
        try{
            query="SELECT * FROM movies WHERE m_id=?";
            stmt = this.connection.prepareStatement(query);
            stmt.setInt(1, id);
            rs=stmt.executeQuery();
            if(rs.next())
            {
               
                smovie = new singleMovie();
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
            


