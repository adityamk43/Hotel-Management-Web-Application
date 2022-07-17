/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hotel.servlet;

import com.hotel.dao.BookingDao;
import com.hotel.dao.CancelledBookingDao;
import com.hotel.dao.RoomsCategoryDao;
import com.hotel.entities.BookingDetails;
import com.hotel.entities.RoomsCategory;
import com.hotel.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADITYA
 */
public class CancelBookingServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            int bid = Integer.parseInt(request.getParameter("BookingID"));
            
            BookingDao bdao = new BookingDao(ConnectionProvider.getConnection());
            RoomsCategoryDao rdao = new RoomsCategoryDao(ConnectionProvider.getConnection());
            
            BookingDetails booking = new BookingDetails();
            booking.setBid(bid);
            booking.setCid(bdao.GetCIDFromBooking(booking));
            RoomsCategory roomscat = new RoomsCategory();
            
            String RoomCategory = rdao.GetRoomsCategory(booking.getCid()).getCategory();
            roomscat.setCategory(RoomCategory);
            roomscat.setNo_of_rooms(rdao.GetNoofRooms(RoomCategory));
            
            CancelledBookingDao cbdao = new CancelledBookingDao(ConnectionProvider.getConnection());
            
            if(cbdao.CancelBooking(booking, roomscat)){
                HttpSession s = request.getSession();
                s.setAttribute("Cancel", "Done");
                response.sendRedirect("guest.jsp");
            }
            else{
                response.sendRedirect("Error505.jsp");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
