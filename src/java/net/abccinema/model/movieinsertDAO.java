package net.abccinema.model;

//import net.abccinema.connection.DbCon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author gavin
 */
public class movieinsertDAO {

    private Connection connection;

    public movieinsertDAO(Connection connection) {
        this.connection = connection;
    }

    public boolean insertMovie(movieinsert movie) {
        boolean isSuccess = false;

        String query = "INSERT INTO movies (m_id, m_name, m_image, m_description, m_start_date, m_end_date, m_genres, "
                + "m_cast, m_directors, m_writers, m_producers, m_music, m_price_adult, m_price_child) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        String insertTimeSlotsQuery = "INSERT INTO movie_time_slots(m_id, m_time_slot) VALUES(?, ?)";
        try (PreparedStatement pst = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS); 
             PreparedStatement timeslotPst = connection.prepareStatement(insertTimeSlotsQuery)) {
            pst.setString(1, movie.getId());
            pst.setString(2, movie.getName());
            pst.setString(3, movie.getImageName());
            pst.setString(4, movie.getDescription());
            pst.setString(5, movie.getStartDate());
            pst.setString(6, movie.getEndDate());
            pst.setString(7, movie.getGenres());
            pst.setString(8, movie.getCast());
            pst.setString(9, movie.getDirectors());
            pst.setString(10, movie.getWriters());
            pst.setString(11, movie.getProducers());
            pst.setString(12, movie.getMusic());
            pst.setDouble(13, Double.parseDouble(movie.getTicketPriceAdult()));
            pst.setDouble(14, Double.parseDouble(movie.getTicketPriceChild()));

            pst.executeUpdate();
            ResultSet rs = pst.getGeneratedKeys();
            if (rs.next()) {
                String movieId = rs.getString(0001);
                if (movie.getTimeSlots() != null && movie.getTimeSlots().length > 0) {
                    for (String timeSlots : movie.getTimeSlots()) {
                        timeslotPst.setString(1, movieId);
                        timeslotPst.setString(2, timeSlots);
                        timeslotPst.addBatch();
                    }
                    int[] timeSlotResults = timeslotPst.executeBatch();

                    isSuccess = timeSlotResults.length == movie.getTimeSlots().length;
                } else {
                    isSuccess = true;
                }
            }

        } catch (Exception e) {
            System.err.println("Error during movie insertion: " + e.getMessage());
            e.printStackTrace();
        }
        return isSuccess;

    }
}