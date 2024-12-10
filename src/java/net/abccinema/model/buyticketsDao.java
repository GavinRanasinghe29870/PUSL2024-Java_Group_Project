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

    public buyticketsDao(Connection con) {
        this.con = con;
    }

    public List<buytickets> getAllMovies() {
        List<buytickets> movies = new ArrayList<>();

        query = "SELECT * from movies";

        try (PreparedStatement pst = con.prepareStatement(query); ResultSet rs = pst.executeQuery()) {
            System.out.println("Executing query: " + query);
            while (rs.next()) {
                buytickets movie = new buytickets();
                movie.setId(rs.getInt("m_id"));
                movie.setName(rs.getString("m_name"));
                movie.setImageName(rs.getString("m_image"));
                movie.setDescription(rs.getString("m_description"));
                movie.setStartDate(rs.getString("m_start_date"));
                movie.setEndDate(rs.getString("m_end_date"));
                movie.setGenres(rs.getString("m_genres"));
                movie.setCast(rs.getString("m_cast"));
                movie.setDirectors(rs.getString("m_directors"));
                movie.setWriters(rs.getString("m_writers"));
                movie.setProducers(rs.getString("m_producers"));
                movie.setMusic(rs.getString("m_music"));
                movie.setTicketPriceAdult(rs.getString("m_price_adult"));
                movie.setTicketPriceChild(rs.getString("m_price_child"));

                movies.add(movie);
                System.out.println("Movie added: " + movie.getName());

            }
            System.out.println("Total movies retrieved: " + movies.size());
        } catch (Exception e) {
            System.out.println("Error in getAllMovies: " + e.getMessage());
            e.printStackTrace();
        }

        return movies;
    }
}
