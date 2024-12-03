package net.abccinema.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import net.abccinema.model.*;
import java.util.ArrayList;
import java.util.List;

public class TestimonialsDao {
    
    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    
    public TestimonialsDao(Connection con) {
        this.con = con;
    }
    
    public List<Testimonials> getAllTestimonial(){
        List<Testimonials> testimonials = new ArrayList<Testimonials>();
        
        try {
            query = "SELECT * FROM feedback";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();
            while(rs.next()) {
                Testimonials row = new Testimonials();
                row.setFullName(rs.getString("fullName"));
                row.setMessage(rs.getString("message"));
                row.setRating(rs.getString("rating"));
                
                testimonials.add(row);
            }
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        return testimonials;
    }
}
