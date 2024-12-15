package net.abccinema.servlet;

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
import java.util.List;
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

            SeatBookingDAO dao = new SeatBookingDAO(DbCon.getConnection());
            List<String> confirmedSeats = dao.getConfirmedSeats(m_id);

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
                response.sendRedirect("SeatBooking.jsp?id=" + m_id);
            } else {
                response.sendRedirect("checkout.jsp?id=" + m_id + "&selectedSeats=" + selectedSeats + "&adultCount=" + adultCount + "&childCount=" + childCount + "&totalPrice=" + totalPrice);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int m_id = Integer.parseInt(request.getParameter("m_id"));
            SeatBookingDAO dao = new SeatBookingDAO(DbCon.getConnection());
            List<String> confirmedSeats = dao.getConfirmedSeats(m_id);
            request.setAttribute("confirmedSeats", confirmedSeats);
            request.getRequestDispatcher("SeatBooking.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
