/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hotel.dao;

import com.hotel.entities.BookingDetails;
import com.hotel.entities.Payment;
import java.sql.*;

/**
 *
 * @author ADITYA
 */
public class PaymentDao {

    private Connection con;

    public PaymentDao(Connection con) {
        this.con = con;
    }

    public boolean InsertPaymentDetails1(Payment payment, BookingDetails booking) {
        boolean f = false;

        try {

            String query = "insert into \"PAYMENT\"(\"BID\", \"PAYMENTMETHOD\") values(?,?)";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setInt(1, booking.getBid());
            pst.setString(2, payment.getPaymentMethod());
           
            pst.executeUpdate();

            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
    
    public boolean InsertPaymentDetails2(Payment payment, BookingDetails booking) {
        boolean f = false;

        try {

            String query = "insert into \"PAYMENT\"(\"BID\", \"PAYMENTMETHOD\", \"CARDNUMBER\", \"EXPDATE\", \"NAMEOFCARD\") values(?,?,?,?,?)";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setInt(1, booking.getBid());
            pst.setString(2, payment.getPaymentMethod());
            pst.setString(3, payment.getCardNumber());
            pst.setString(4, payment.getCardExpDate());
            pst.setString(5, payment.getCardName());

            pst.executeUpdate();

            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public int setPaymentID(Payment payment) {
        int pid = 0;

        try {
            
            String query = "Select \"PID\" from \"PAYMENT\" where \"BID\"=?";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setInt(1, payment.getBid());
            
            ResultSet set = pst.executeQuery();
            
            if(set.next()){
                pid= set.getInt("pid");
            }
            

        } catch (Exception e) {
            e.printStackTrace();
        }

        return pid;
    }
    
    public Payment getPayment(BookingDetails booking) {
        
        Payment payment = new Payment();
        
        try {
            
            String query = "Select \"PID\" from \"PAYMENT\" where \"BID\"=?";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setInt(1, booking.getBid());
            
            ResultSet set = pst.executeQuery();
            
            if(set.next()){
                payment.setPid(set.getInt("pid"));
            }
            

        } catch (Exception e) {
            e.printStackTrace();
        }

        return payment;
    }

}
