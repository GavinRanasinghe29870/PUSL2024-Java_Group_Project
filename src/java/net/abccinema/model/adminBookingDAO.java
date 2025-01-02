package net.abccinema.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class adminBookingDAO {

    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public adminBookingDAO(Connection con) {
        this.con = con;
    }

    public List<adminBooking> getAllBooking() {
        List<adminBooking> bookings = new ArrayList<>();

        try {
            query = "SELECT * FROM purchases";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
                adminBooking booking = new adminBooking();
                booking.setBookingId(rs.getInt("bookingId"));
                booking.setName(rs.getString("name"));
                booking.setPhoneNumber(rs.getString("phoneNumber"));
                booking.setEmail(rs.getString("email"));
                booking.setAdultTickets(rs.getInt("adultTickets"));
                booking.setChildTickets(rs.getInt("childTickets"));
                booking.setTotalAmount(rs.getFloat("totalAmount"));
                booking.setPaymentMethod(rs.getString("paymentMethod"));
                booking.setMovieId(rs.getInt("m_id"));
                booking.setMovieTimeSlot(rs.getString("m_time_slot"));
                booking.setSeatNumbers(rs.getString("seat_numbers"));
                booking.setBookDate(rs.getString("book_date"));

                bookings.add(booking);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return bookings;
    }
}
