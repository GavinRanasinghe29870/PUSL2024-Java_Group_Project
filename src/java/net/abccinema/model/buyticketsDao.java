package net.abccinema.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author gavin
 */
public class buyticketsDao {

    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public buyticketsDao(Connection con) {
        this.con = con;
    }

    public List<buytickets> getMovies() {
        List<buytickets> movies = new ArrayList<>();

        try {
            query = "SELECT * from movies";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
                buytickets row = new buytickets();
                row.setId(rs.getInt("m_id"));
                row.setName(rs.getString("m_name"));
                row.setImage(rs.getString("m_image"));
                row.setDescription(rs.getString("m_description"));
                row.setTime(rs.getString("m_time"));
                row.setDate(rs.getString("m_date"));
                
                movies.add(row);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return movies;
    }
}
