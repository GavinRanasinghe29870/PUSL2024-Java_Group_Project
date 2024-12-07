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
public class buyticketsDao {

    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public buyticketsDao(Connection con) {
        this.con = con;
    }

    public List<buytickets> getAllMovies(){
        List<buytickets> movies = new ArrayList<>();

        try {
            query = "SELECT * from movies";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();
            System.out.println(rs);

            while (rs.next()) {
                buytickets row = new buytickets();
                row.setId(rs.getInt("m_id"));
                row.setName(rs.getString("m_name"));
                row.setImageName(rs.getString("m_image"));
                row.setDescription(rs.getString("m_description"));
                row.setTimeSlots(rs.getString("m_time"));
                row.setStartDate(rs.getString("m_start_date"));
                row.setEndDate(rs.getString("m_end_date"));
                row.setGenres(rs.getString("m_genres"));
                row.setCast(rs.getString("m_cast"));
                row.setDirectors(rs.getString("m_directors"));
                row.setWriters(rs.getString("m_writers"));
                row.setProducers(rs.getString("m_producers"));
                row.setMusic(rs.getString("m_music"));
                row.setTicketPriceAdult(rs.getString("m_price_adult"));
                row.setTicketPriceChild(rs.getString("m_price_child"));

                movies.add(row);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return movies;
    }
}
