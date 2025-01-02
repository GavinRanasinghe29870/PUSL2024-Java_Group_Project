package net.abccinema.model;

import net.abccinema.connection.DbCon;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class purchaseDao {

    private Connection connection;

    // Constructor: Get connection from the existing DbCon class
    public purchaseDao(Connection connection) {
        this.connection = connection;
    }

    // Insert purchase record into the database
    public boolean insertPurchase(purchase purchase) {
        boolean isSuccess = false;

        String query = "INSERT INTO purchases (userId, name, phoneNumber, email, adultTickets, childTickets, totalAmount, paymentMethod, m_id, m_time_slot, seat_numbers) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, purchase.getUserId());
            ps.setString(2, purchase.getUser_name());
            ps.setString(3, purchase.getPhoneNumber());
            ps.setString(4, purchase.getUser_email());
            ps.setInt(5, purchase.getAdultTickets());
            ps.setInt(6, purchase.getChildTickets());
            ps.setDouble(7, purchase.getTotalAmount());
            ps.setString(8, purchase.getPaymentMethod());
            ps.setInt(9, purchase.getM_id());
            ps.setString(10, purchase.getM_timeslot());
            ps.setString(11, purchase.getSeat_numbers());

            int rowsAffected = ps.executeUpdate();
            isSuccess = rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
//            return false;
        }
        return isSuccess;
    }

    public List<purchase> getBookingsByUserId(int userId) {
        List<purchase> bookings = new ArrayList<>();

        try {
            String query = "SELECT * FROM purchases WHERE userId = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                purchase row = new purchase();
                row.setId(rs.getInt("bookingId"));
                row.setAdultTickets(rs.getInt("adultTickets"));
                row.setChildTickets(rs.getInt("childTickets"));
                row.setTotalAmount(rs.getFloat("totalAmount"));

                bookings.add(row);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bookings;
    }

    public boolean deleteBookings(int id) {
        boolean f = false;
        try {
            String query = "DELETE FROM purchases WHERE bookingId=?";
            PreparedStatement pst = connection.prepareStatement(query);
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

    public boolean isSeatAlreadyBooked(int m_id, String m_timeslot, String seat_numbers) {
        boolean isBooked = false;
        String query = "SELECT COUNT(*) FROM purchases WHERE m_id = ? AND m_time_slot = ? AND seat_numbers = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, m_id);
            ps.setString(2, m_timeslot);
            ps.setString(3, seat_numbers);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next() && rs.getInt(1) > 0) {
                    isBooked = true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isBooked;
    }
}
