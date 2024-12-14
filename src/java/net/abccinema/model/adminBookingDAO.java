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
    
    public List<adminBooking> getAllBooking(){
        List<adminBooking> ab = new ArrayList<adminBooking>();
        
        try {
            query = "SELECT * FROM booking";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();
            while(rs.next()) {
                adminBooking row = new adminBooking();
                row.setBookingId(rs.getInt("bookingId"));
                row.setName(rs.getString("name"));
                row.setAdultSeat(rs.getInt("adultSeat"));
                row.setChildSeat(rs.getInt("childSeat"));
                row.setMovieName(rs.getString("movieName"));
                row.setTotalPrice(rs.getFloat("totalPrice"));
                
                ab.add(row);
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return ab;
    }
}
