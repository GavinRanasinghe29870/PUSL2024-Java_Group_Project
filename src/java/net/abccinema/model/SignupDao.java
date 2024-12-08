/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package net.abccinema.model;

       

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SignupDao {
    // Method to insert a Signup object into the database
    public boolean saveSignup(Signup signup) {
        String query = "INSERT INTO signup (full_name, age, username, password, phone_number, address, email, gender) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
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
        }
        return false; // Returns false if an exception occurred
    }

    // Method to find a user by username
    public Signup findUserByUsername(String username) {
        String query = "SELECT * FROM signup WHERE username = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setString(1, username);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                return new Signup(
                    resultSet.getString("full_name"),
                    resultSet.getInt("age"),
                    resultSet.getString("username"),
                    resultSet.getString("password"),
                    null, // Not fetching the re-entered password as it's not stored in the database
                    resultSet.getString("phone_number"),
                    resultSet.getString("address"),
                    resultSet.getString("email"),
                    resultSet.getString("gender")
                );
            }
        } catch (SQLException e) {
        }
        return null; // Returns null if the user is not found or an exception occurred
    }

    private static class DatabaseConnection {

        private static Connection getConnection() {
            throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        }

        public DatabaseConnection() {
        }
    }
}