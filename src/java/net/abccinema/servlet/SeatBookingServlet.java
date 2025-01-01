package net.abccinema.servlet;

import com.google.gson.Gson;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import net.abccinema.connection.DbCon;
import net.abccinema.model.SeatBookingDAO;

/**
 *
 * @author kavis
 */
@WebServlet(name = "SeatBookingServlet", urlPatterns = {"/SeatBookingServlet"})
public class SeatBookingServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String selectedSeats = request.getParameter("selectedSeats");
            int adultCount = Integer.parseInt(request.getParameter("adultCount"));
            int childCount = Integer.parseInt(request.getParameter("childCount"));
            int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
            int m_id = Integer.parseInt(request.getParameter("m_id"));
            String m_name = request.getParameter("m_name");
            float adultTp = Float.parseFloat(request.getParameter("adultTicketPrice"));
            float childTp = Float.parseFloat(request.getParameter("childTicketPrice"));
            String timeSlots = request.getParameter("timeSlots");

            SeatBookingDAO dao = new SeatBookingDAO(DbCon.getConnection());
            List<String> confirmedSeats = dao.getConfirmedSeats(m_id, timeSlots);

            // Check if any of the selected seats are already reserved
            String[] seatsArray = selectedSeats.split(",");
            boolean seatsAlreadyReserved = false;
            for (String seat : seatsArray) {
                if (confirmedSeats.contains(seat.trim())) {
                    seatsAlreadyReserved = true;
                    break;
                }
            }

            HttpSession session = request.getSession();
            if (seatsAlreadyReserved) {
                session.setAttribute("bookedMsg", "Apologies, the payment for these seats has already been completed by someone else.");
                response.sendRedirect("SeatBooking.jsp?id=" + m_id + "&name=" + m_name + "&timeSlots=" + timeSlots + "&adultTicketPrice=" + adultTp + "&childTicketPrice=" + childTp );
            } else {
                response.sendRedirect("checkout.jsp?id=" + m_id + "&name=" + m_name + "&timeSlots=" + timeSlots + "&selectedSeats=" + selectedSeats + "&adultTicketPrice=" + adultTp + "&childTicketPrice=" + childTp + "&adultCount=" + adultCount + "&childCount=" + childCount + "&totalPrice=" + totalPrice);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
