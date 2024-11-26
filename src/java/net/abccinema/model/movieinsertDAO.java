package net.abccinema.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author gavin
 */
public class movieinsertDAO {
    
    private Connection con;
    private String query;
    private PreparedStatement pst;

    public movieinsertDAO (Connection con) {
        this.con = con;
    }
    
    public boolean insertMovie(movieinsert movie){
       boolean isSuccess = false; 
       
       try{
           query = "INSERT INTO movies (m_name, m_image, m_description, m_time, m_genres, "
                   + "m_cast, m_directors, m_writers, m_producers, m_music, m_price_adult, m_price_child)"
                   + "VALUES(0,'"
                   + movie.getName()+"', '"
                   + movie.getImageName()+"','"
                   + movie.getDescription()+"', '"
                   + String.join(",", movie.getTimeSlots())+"','"
                   + movie.getGenres()+"','"
                   + movie.getCast()+"','"
                   + movie.getDirectors()+"','"
                   + movie.getWriters()+"','"
                   + movie.getProducers()+"','"
                   + movie.getMusic()+"','"
                   + movie.getTicketPriceAdult()+"','"
                   + movie.getIcketPriceChild()+"')";
           pst = this.con.prepareStatement(query);
           int rs = pst.executeUpdate(query);
           
           if(rs > 0){
               isSuccess = true;
           } else{
               isSuccess = false;
           }
       }catch(Exception e){
           e.printStackTrace();
       }
       return isSuccess;
    }
}
