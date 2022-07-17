package com.hotel.entities;
import java.sql.*;

// @author ADITYA

public class CancelledBooking {
    
    private int cbid;
    private int roomsbooked;
    private int adults;
    private int kids;
    private String currencyvalue;
    private float totalamount;
    private Timestamp bookingdate;
    private Date checkin;
    private Date checkout;
    private int gid;
    private int cid;

    public CancelledBooking() {
    }

    public CancelledBooking(int roomsbooked, int adults, int kids, String currencyvalue, float totalamount, Date checkin, Date checkout) {
        this.roomsbooked = roomsbooked;
        this.adults = adults;
        this.kids = kids;
        this.currencyvalue = currencyvalue;
        this.totalamount = totalamount;
        this.checkin = checkin;
        this.checkout = checkout;
    }
    
    

    public CancelledBooking(int adults, int kids, String currencyvalue, float totalamount, Date checkin, Date checkout, int gid) {
        this.adults = adults;
        this.kids = kids;
        this.currencyvalue = currencyvalue;
        this.totalamount = totalamount;
        this.checkin = checkin;
        this.checkout = checkout;
        this.gid = gid;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    
    public int getCBid() {
        return cbid;
    }

    public void setCBid(int cbid) {
        this.cbid = cbid;
    }

    public int getRoomsbooked() {
        return roomsbooked;
    }

    public void setRoomsbooked(int roomsbooked) {
        this.roomsbooked = roomsbooked;
    }

    public int getAdults() {
        return adults;
    }

    public void setAdults(int adults) {
        this.adults = adults;
    }

    public int getKids() {
        return kids;
    }

    public void setKids(int kids) {
        this.kids = kids;
    }

    public String getCurrencyvalue() {
        return currencyvalue;
    }

    public void setCurrencyvalue(String currencyvalue) {
        this.currencyvalue = currencyvalue;
    }

    public float getTotalamount() {
        return totalamount;
    }

    public void setTotalamount(float totalamount) {
        this.totalamount = totalamount;
    }

    public Timestamp getBookingdate() {
        return bookingdate;
    }

    public void setBookingdate(Timestamp bookingdate) {
        this.bookingdate = bookingdate;
    }

    public Date getCheckin() {
        return checkin;
    }

    public void setCheckin(Date checkin) {
        this.checkin = checkin;
    }

    public Date getCheckout() {
        return checkout;
    }

    public void setCheckout(Date checkout) {
        this.checkout = checkout;
    }
    
     public int getGid() {
        return gid;
    }

    public void setGid(int gid) {
        this.gid = gid;
    }
    
}
