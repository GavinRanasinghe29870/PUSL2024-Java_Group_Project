package net.abccinema.model;

import net.abccinema.connection.DbCon;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class purchaseDao {
    private Connection connection;

    // Constructor: Get connection from the existing DbCon class
    public purchaseDao(Connection connection) {
        this.connection = connection;
    }

    // Insert purchase record into the database
    public boolean insertPurchase(purchase purchase) {
        boolean isSuccess = false;
        
        String query = "INSERT INTO purchases (name, phoneNumber, email, adultTickets, childTickets, totalAmount, paymentMethod) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, purchase.getUser_name());
            ps.setString(2, purchase.getPhoneNumber());
            ps.setString(3, purchase.getUser_email());
            ps.setInt(4, purchase.getAdultTickets());
            ps.setInt(5, purchase.getChildTickets());
            ps.setDouble(6, purchase.getTotalAmount());
            ps.setString(7, purchase.getPaymentMethod());

            int rowsAffected = ps.executeUpdate();
            isSuccess = rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
//            return false;
        }
        return isSuccess;
    }
}
 