package net.abccinema.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.ResultSet;
import java.util.List;

/**
 *
 * @author kavis
 */
public class SeatBookingDAO {
    
    private Connection con;
    
    public SeatBookingDAO(Connection con) {
        this.con = con;
    }
    
    public List<String> getConfirmedSeats(int m_id, String timeSlots) {
        List<String> confirmedSeats = new ArrayList<>();
        String query = "SELECT seat_numbers FROM purchases WHERE m_id = ? AND m_time_Slot = ? AND paymentMethod IS NOT NULL AND DATE(book_date) = CURRENT_DATE";
        try (PreparedStatement pst = this.con.prepareStatement(query)) {
            pst.setInt(1, m_id);
            pst.setString(2, timeSlots);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                String[] seats = rs.getString("seat_numbers").split(",");
                for (String seat : seats) {
                    confirmedSeats.add(seat.trim());
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return confirmedSeats;
    }
}