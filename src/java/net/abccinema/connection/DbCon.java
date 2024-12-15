//package net.abccinema.connection;
//
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.util.logging.Level;
//import java.util.logging.Logger;
//
//public class DbCon {
//    private static Connection connection = null;
//
//    public static Connection getConnection() throws ClassNotFoundException {
//        if (connection == null) {
//            try {
//                Class.forName("com.mysql.cj.jdbc.Driver");
//                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/abccinema", "root", "gavin123");
//                System.out.println("Database connected.");
//            } catch (Exception e) {
//                try {
//                    System.err.println("Error connecting to database: " + e.getMessage());
//                    throw e;
//                } catch (Exception ex) {
//                    Logger.getLogger(DbCon.class.getName()).log(Level.SEVERE, null, ex);
//                }
//            }
//        }
//        return connection;
//    }
//}
package net.abccinema.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbCon {

    // Get a connection on each request (not static to avoid reuse issues)
    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection("jdbc:mysql://localhost:3306/abccinema", "root", "DragonDulith12345");
        } catch (ClassNotFoundException | SQLException e) {
            throw new SQLException("Error connecting to database", e);
        }
    }
}

//package net.abccinema.connection;
//
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.SQLException;
//
///**
// *
// * @author gavin
// */
//public class DbCon {
//
//    private static Connection connection = null;
//
//    public static Connection getConnection() throws ClassNotFoundException, SQLException {
//        if (connection == null) {
//            try {
//                Class.forName("com.mysql.cj.jdbc.Driver");
//                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/abccinema", "root", "gavin123");
//                System.out.print("Connected");
//            } catch (ClassNotFoundException | SQLException e) {
//                System.err.println("Error connecting to database: " + e.getMessage());
//                throw e;
//            } 
//        }
//        return connection;
//    }
//}
