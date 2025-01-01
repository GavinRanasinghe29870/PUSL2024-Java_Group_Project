package net.abccinema.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class moviereadDAO {

    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public moviereadDAO(Connection con) {
        this.con = con;
    }

    // Method to get all movies
    public List<movieinsert> getAllMovies() {
        List<movieinsert> movie = new ArrayList<>();

        try {
            query = "SELECT * FROM movies";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();
            while (rs.next()) {
                movieinsert row = new movieinsert();
                row.setId(rs.getString("m_id"));
                row.setName(rs.getString("m_name"));
                row.setImageName(rs.getString("m_image"));
                row.setDescription(rs.getString("m_description"));
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

                movie.add(row);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return movie;
    }

    // Method to delete a movie by ID
    public boolean deleteMovies(int id) {
        boolean f = false;
        try {
            query = "DELETE FROM movies WHERE m_id=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            int i = pst.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    // Method to get a movie by ID
    public movieinsert getMovieById(String movieId) {
        movieinsert movie = null;
        try {
            query = "SELECT * FROM movies WHERE m_id=?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, movieId);
            rs = pst.executeQuery();
            if (rs.next()) {
                movie = new movieinsert();
                movie.setId(rs.getString("m_id"));
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
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return movie;
    }
}
