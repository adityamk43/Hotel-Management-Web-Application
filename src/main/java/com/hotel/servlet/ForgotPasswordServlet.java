package com.hotel.servlet;

import com.hotel.dao.BookingDao;
import com.hotel.entities.Message;
import com.hotel.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// @author ADITYA
public class ForgotPasswordServlet extends HttpServlet {

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

            String EmailID = request.getParameter("Resetguestemailid").toLowerCase();
            String Password = request.getParameter("newguestpassword");

            BookingDao bdao = new BookingDao(ConnectionProvider.getConnection());

            Message msg = new Message();

            if (bdao.CheckResetEmail(EmailID)) {
                if (bdao.ResetPasswordByEmail(EmailID, Password)) {
                    msg = new Message("Your Password has been Reset Successfully!! You can Login Again", "success", "alert-success");

                } else {
                    msg = new Message("Your Password was not set due to some error!! You can Try Again Later", "error", "alert-danger");
                }
            }
            else{
                msg = new Message("Please SignUp First!! You can Signup By Booking Your First Room.", "error", "alert-danger");
            }
            HttpSession s = request.getSession();
            s.setAttribute("Message", msg);
            response.sendRedirect("booking.jsp");
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
