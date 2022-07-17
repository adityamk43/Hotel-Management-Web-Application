/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hotel.servlet;

import com.hotel.dao.BookingDao;
import com.hotel.entities.BookingDetails;
import com.hotel.entities.Guest;
import com.hotel.entities.RoomsCategory;
import com.hotel.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADITYA
 */
public class BookingData extends HttpServlet {

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

//            Room Details
            String Room_Name = request.getParameter("roomname");
            int Rooms_Booked = Integer.parseInt(request.getParameter("roomsbooked"));
            int Adults = Integer.parseInt(request.getParameter("noofadults"));
            int Kids = Integer.parseInt(request.getParameter("noofkids"));
            float Total_Amount = Float.parseFloat(request.getParameter("totalamount"));
            Date check_in = Date.valueOf(request.getParameter("checkin"));
            Date check_out = Date.valueOf(request.getParameter("checkout"));
            String CurrencyName = request.getParameter("currencyname");

//            Guest_Details
            String Guest_name = "";
            String Guest_emailid = "";
            if (request.getParameter("guestname") != null && request.getParameter("guestemailid") != null) {
                Guest_name = request.getParameter("guestname").toUpperCase();
                Guest_emailid = request.getParameter("guestemailid").toUpperCase();
            }
            String Guest_password = request.getParameter("guestpassword");
            String Guest_mobno = request.getParameter("guestmobno");

            BookingDetails booking = new BookingDetails(Rooms_Booked, Adults, Kids, CurrencyName, Total_Amount, check_in, check_out);
            RoomsCategory category = new RoomsCategory(Room_Name);

            HttpSession s = request.getSession();
            Guest guest = (Guest) s.getAttribute("CurrentGuest");
            s.setAttribute("Booking", booking);
            s.setAttribute("Category", category);

            if (guest == null) {
                guest = new Guest(Guest_name, Guest_emailid, Guest_password, Guest_mobno);
                s.setAttribute("Guest", guest);
                response.sendRedirect("PaymentMethod.jsp");
            } else {
                s.setAttribute("Guest", guest);
                response.sendRedirect("PaymentMethod.jsp");
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
