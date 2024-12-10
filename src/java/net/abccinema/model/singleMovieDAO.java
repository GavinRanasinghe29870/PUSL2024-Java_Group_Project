package net.abccinema.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class singleMovieDAO {
    private Connection connection;

    public singleMovieDAO(Connection connection) {
        this.connection = connection;
    }

    public singleMovie getsingleMovieByName(String name) throws SQLException {
        String query = "SELECT * FROM singlemovie WHERE name = ?";
        System.out.println("Executing query: " + query);
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, name);
            System.out.println("Query parameter set: " + name);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                     System.out.println("Data retrieved: " + rs.getString("name"));
                    return new singleMovie(
                        rs.getString("name"),
                        rs.getString("movieDesc"),
                        rs.getString("imageURL"),
                        rs.getString("genres"),
                        rs.getString("stars"),
                        rs.getString("directors"),
                        rs.getString("writers"),
                        rs.getString("producers"),
                        rs.getString("music")
                    );
                }
                else {
                System.out.println("No data found for the movie: " + name);
            }
            }
        }
        return null;
    }
}
