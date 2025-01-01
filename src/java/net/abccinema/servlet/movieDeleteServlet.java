package net.abccinema.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import net.abccinema.connection.DbCon;
import net.abccinema.model.moviereadDAO;

/**
 *
 * @author kavis
 */
@WebServlet(name = "delete", urlPatterns = {"/delete"})
public class movieDeleteServlet extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            
            moviereadDAO dao = new moviereadDAO(DbCon.getConnection());
            boolean f = dao.deleteMovies(id);
            HttpSession session = request.getSession();
            
            if (f) {
                session.setAttribute("succMsg", "Movie Delete Successfully..");
                response.sendRedirect("MovieManage.jsp");
            }else {
                session.setAttribute("failedMsg", "Something Wrong on Server");
                response.sendRedirect("MovieManage.jsp");
            }
            
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

}
