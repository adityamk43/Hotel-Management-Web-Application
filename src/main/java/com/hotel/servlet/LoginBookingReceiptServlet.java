/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hotel.servlet;

import com.hotel.dao.BookingDao;
import com.hotel.dao.PaymentDao;
import com.hotel.dao.RoomsCategoryDao;
import com.hotel.entities.BookingDetails;
import com.hotel.entities.Guest;
import com.hotel.entities.Payment;
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
public class LoginBookingReceiptServlet extends HttpServlet {

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
            
            HttpSession s = request.getSession();
            Guest guest = (Guest) s.getAttribute("CurrentGuest");
            int bid = Integer.parseInt(request.getParameter("BookingID"));
            
//            out.print(bid);

            BookingDetails booking = new BookingDetails();
            booking.setBid(bid);
            
            BookingDao bdao = new BookingDao(ConnectionProvider.getConnection());
            RoomsCategoryDao rdao = new RoomsCategoryDao(ConnectionProvider.getConnection());
            PaymentDao pdao = new PaymentDao(ConnectionProvider.getConnection());
            
            booking = bdao.SavedGuestBookingDetails(booking);
            
            RoomsCategory category = rdao.GetRoomsCategory(booking.getCid());
            
            Payment payment = pdao.getPayment(booking);
            
            s.setAttribute("Guest", guest);
            s.setAttribute("Booking", booking);
            s.setAttribute("Category", category);
            s.setAttribute("PaymentObject", payment);
            
            response.sendRedirect("Receipt.jsp");
            
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
