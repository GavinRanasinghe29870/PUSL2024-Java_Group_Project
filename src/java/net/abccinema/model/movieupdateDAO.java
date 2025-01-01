package net.abccinema.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class movieupdateDAO {
    private final Connection connection;

    public movieupdateDAO(Connection connection) {
        this.connection = connection;
    }

    public boolean updateMovie(movieinsert movie) {
        boolean isUpdated = false;

        String updateMovieQuery = "UPDATE movies SET m_name=?, m_image=?, m_description=?, m_start_date=?, m_end_date=?, m_genres=?, "
                + "m_cast=?, m_directors=?, m_writers=?, m_producers=?, m_music=?, m_price_adult=?, m_price_child=? WHERE m_id=?";
        String deleteTimeSlotsQuery = "DELETE FROM movie_time_slots WHERE m_id=?";
        String insertTimeSlotsQuery = "INSERT INTO movie_time_slots(m_id, m_time_slot) VALUES(?, ?)";

        try {
            connection.setAutoCommit(false); // Begin transaction

            try (PreparedStatement pst = connection.prepareStatement(updateMovieQuery)) {
                pst.setString(1, movie.getName());
                pst.setString(2, movie.getImageName());
                pst.setString(3, movie.getDescription());
                pst.setString(4, movie.getStartDate());
                pst.setString(5, movie.getEndDate());
                pst.setString(6, movie.getGenres());
                pst.setString(7, movie.getCast());
                pst.setString(8, movie.getDirectors());
                pst.setString(9, movie.getWriters());
                pst.setString(10, movie.getProducers());
                pst.setString(11, movie.getMusic());
                pst.setDouble(12, Double.parseDouble(movie.getTicketPriceAdult()));
                pst.setDouble(13, Double.parseDouble(movie.getTicketPriceChild()));
                pst.setString(14, movie.getId());
                pst.executeUpdate();
            }

            try (PreparedStatement deletePst = connection.prepareStatement(deleteTimeSlotsQuery)) {
                deletePst.setString(1, movie.getId());
                deletePst.executeUpdate();
            }

            if (movie.getTimeSlots() != null && movie.getTimeSlots().length > 0) {
                try (PreparedStatement insertPst = connection.prepareStatement(insertTimeSlotsQuery)) {
                    for (String timeSlot : movie.getTimeSlots()) {
                        insertPst.setString(1, movie.getId());
                        insertPst.setString(2, timeSlot);
                        insertPst.addBatch();
                    }
                    insertPst.executeBatch();
                }
            }

            connection.commit();
            isUpdated = true;
        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (SQLException rollbackEx) {
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
            }
        }

        return isUpdated;
    }
}
