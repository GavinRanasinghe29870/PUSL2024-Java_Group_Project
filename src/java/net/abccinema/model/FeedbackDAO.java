package net.abccinema.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
/**
 *
 * @author kavis
 */
public class FeedbackDAO {
    
    private Connection con;
    
    public FeedbackDAO(Connection con) {
        this.con = con;
    }
    
    public boolean addReview(Testimonials fb) {
        boolean isSuccess = false;
        
        try {
            String query = "INSERT INTO feedback(fullName, message, rating) VALUES(?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, fb.getFullName());
            ps.setString(2, fb.getMessage());
            ps.setString(3, fb.getRating());
            
            int i = ps.executeUpdate();
            
            if (i == 1){
                isSuccess = true;
            }
                    
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return isSuccess;
    }
    
}
