package net.abccinema.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class buyticketsDao {

    private Connection con;
    private String query1;
    private PreparedStatement pst;
    private ResultSet rs;

    public buyticketsDao(Connection con) {
        this.con = con;
    }

    public List<buytickets> getAllMovies() {
        List<buytickets> movies = new ArrayList<>();
        try {
            query1 = "SELECT movies.*, GROUP_CONCAT(movie_time_slots.m_time_slot SEPARATOR ', ') AS time_slots\n"
                    + "FROM movies\n"
                    + "JOIN movie_time_slots ON movies.m_id = movie_time_slots.m_id\n"
                    + "GROUP BY movies.m_id;";
            pst = this.con.prepareStatement(query1);
            rs = pst.executeQuery();

            while (rs.next()) {
                buytickets movie = new buytickets();
                movie.setId(rs.getInt("m_id"));
                movie.setName(rs.getString("m_name"));
                movie.setDescription(rs.getString("m_description"));
                movie.setImageName(rs.getString("m_image"));
                movie.setStartDate(rs.getString("m_start_date"));
                movie.setEndDate(rs.getString("m_end_date"));
                movie.setGenres(rs.getString("m_genres"));
                movie.setCast(rs.getString("m_cast"));
                movie.setDirectors(rs.getString("m_directors"));
                movie.setWriters(rs.getString("m_writers"));
                movie.setProducers(rs.getString("m_producers"));
                movie.setMusic(rs.getString("m_music"));
                movie.setTicketPriceAdult(rs.getString("m_price_adult"));
                movie.setTicketsPriceChild(rs.getString("m_price_child"));

                // Set concatenated time slots
                movie.setTimeSlots(Arrays.asList(rs.getString("time_slots").split(", ")));
                movies.add(movie);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return movies;
    }

//    private List<String> getMovieTimeSlots(int movieId) {
//        List<String> timeSlots = new ArrayList<>();
//        try {
//            String query2 = "SELECT m_time_slot FROM movie_time_slots WHERE m_id=?";
//            pst = this.con.prepareStatement(query2);
//            pst.setInt(1, movieId);
//            rs = pst.executeQuery();
//            while (rs.next()) {
//                timeSlots.add(rs.getString("m_time_slot"));
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return timeSlots;
//    }
    public buytickets getMovieById(int id) {
        buytickets movie = null;
        try {
            query1 = "SELECT m_id, m_name FROM movies WHERE m_id=?";
            pst = this.con.prepareStatement(query1);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            if (rs.next()) {
                movie = new buytickets();
                movie.setId(rs.getInt("m_id"));
                movie.setName(rs.getString("m_name"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return movie;
    }
}
