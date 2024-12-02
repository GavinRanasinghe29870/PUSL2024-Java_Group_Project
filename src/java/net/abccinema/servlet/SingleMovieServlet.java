/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
//package net.abccinema.servlet;
//
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.util.List;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Vihanga
// */
//
//public class SingleMovieServlet extends HttpServlet 
//{ 
//   private singleMovieDAO SingleMovieDAO;
//
//    @Override
//    public void init()throws ServletException{
//           try{
//               String dbUrl = "jdbc:mysql://localhost:3306/abccinema";
//               String dbUser = "root";
//               String dbPassword = "1234";
//               Connection connection = DriverManager.getConnection(dbUrl,dbUser,dbPassword);
//               SingleMovieDAO = new singleMovieDAO(connection);
//            }
//            catch(Exception e){
//               throw new ServletException(e);
//}
//} 
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//       
//        try { 
//            String name = request.getParameter("name"); 
//            List<String>singleMovieNames = SingleMovieDAO.getAllsingleMovieNames();
//            request.setAttribute("name", singleMovieNames);
//           
//           if(name != null && !name.isEmpty()){
//               singleMovie SingleMovie = SingleMovieDAO.getsingleMovieByName(name);
//               request.setAttribute("singleMovie", SingleMovie);
//               
//           }
//           
//           RequestDispatcher dispatcher = request.getRequestDispatcher("singleMoviepage.jsp");
//           dispatcher.forward(request, response);
//} catch(Exception e){
//    throw new ServletException(e);
// 
//           
//           
//           /* TODO output your page here. You may use following sample code. */
//            
//        }
//    }
//
//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}
