package net.abccinema.model;

import net.abccinema.model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import net.abccinema.connection.DbCon;

public class UserDao {
    public User getUserById(int userId) {
        User user = null;
        try (Connection connection = DbCon.getConnection()) {
            String sql = "SELECT * FROM users WHERE userId = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, userId);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                user = new User();
                user.setUserId(resultSet.getInt("userId"));
                user.setFullName(resultSet.getString("full_name"));
                user.setEmail(resultSet.getString("email"));
                user.setPhoneNumber(resultSet.getInt("phoneNumber"));
                user.setAddress(resultSet.getString("address"));
                user.setAge(resultSet.getInt("age"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}