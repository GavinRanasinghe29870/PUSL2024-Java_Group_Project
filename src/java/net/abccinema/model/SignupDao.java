/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package net.abccinema.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SignupDao {
    // Method to insert a Signup object into the database
    public boolean saveSignup(Signup signup) {
        String query = "INSERT INTO users (fullName, age, username, password, phoneNumber, address, email, gender) " +
                       "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setString(1, signup.getFullName());
            preparedStatement.setInt(2, signup.getAge());
            preparedStatement.setString(3, signup.getUsername());
            preparedStatement.setString(4, signup.getPassword());
            preparedStatement.setString(5, signup.getPhoneNumber());
            preparedStatement.setString(6, signup.getAddress());
            preparedStatement.setString(7, signup.getEmail());
            preparedStatement.setString(8, signup.getGender());

            int rowsInserted = preparedStatement.executeUpdate();
            return rowsInserted > 0; // Returns true if the insertion was successful
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // Returns false if an exception occurred
    }

    // User login method
    public Signup logUser(String email, String password) {
        Signup user = null;
        String query = "SELECT * FROM users WHERE email = ? AND password = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement pst = connection.prepareStatement(query)) {

            pst.setString(1, email);
            pst.setString(2, password);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                user = new Signup();
                user.setId(rs.getInt("userId")); // Ensure `userId` matches your table's primary key
                user.setFullName(rs.getString("fullName"));
                user.setAge(rs.getInt("age"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setPhoneNumber(rs.getString("phoneNumber"));
                user.setAddress(rs.getString("address"));
                user.setEmail(rs.getString("email"));
                user.setGender(rs.getString("gender"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user; // Returns the user object or null if not found
    }
}

class DatabaseConnection {
    static Connection getConnection() {
        Connection connection = null;
        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Database connection parameters
            String url = "jdbc:mysql://localhost:3306/abccinema";
            String username = "root";
            String password = "DragonDulith12345";
            
            // Establish connection
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException e) {
            System.err.println("MySQL JDBC Driver not found. Include it in your library path!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Error connecting to the database!");
            e.printStackTrace();
        }
        return connection;
    }

    public DatabaseConnection() {
        // Default constructor
    }
}
