package net.abccinema.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SignupDao {
    private Connection connection;

    public SignupDao(Connection connection) {
        this.connection = connection;
    }

    // Method to authenticate a user
    public User logUser(String username, String password) {
        User user = null;
        String query = "SELECT * FROM users WHERE username = ? AND password = ?";
        
        try (PreparedStatement pst = connection.prepareStatement(query)) {
            pst.setString(1, username);
            pst.setString(2, password);

            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("userId"));
                user.setFullName(rs.getString("fullName"));
                user.setAge(rs.getInt("age"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setPhoneNumber(rs.getInt("phoneNumber"));
                user.setAddress(rs.getString("address"));
                user.setEmail(rs.getString("email"));
                user.setGender(rs.getString("gender"));
            }
        } catch (SQLException e) {
            System.err.println("Error during user authentication: " + e.getMessage());
            e.printStackTrace();
        }
        return user;
    }
    public boolean saveSignup(User user) {
        String query = "INSERT INTO users (fullName, age, username, password, phoneNumber, address, email, gender) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement pst = connection.prepareStatement(query)) {
            pst.setString(1, user.getFullName());
            pst.setInt(2, user.getAge());
            pst.setString(3, user.getUsername());
            pst.setString(4, user.getPassword());
            pst.setInt(5, user.getPhoneNumber());
            pst.setString(6, user.getAddress());
            pst.setString(7, user.getEmail());
            pst.setString(8, user.getGender());

            int rowsAffected = pst.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.err.println("Error during user registration: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }
}
