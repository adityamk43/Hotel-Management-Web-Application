package com.hotel.entities;

// @author ADITYA

public class Guest {
    
    private int gid;
    private String guestname;
    private String emailid;
    private String password;
    private String mobileno;


    public Guest() {
    }

    public Guest(String guestname, String emailid, String password, String mobileno) {
        this.guestname = guestname;
        this.emailid = emailid;
        this.password = password;
        this.mobileno = mobileno;
    }
    
    
    public int getGid() {
        return gid;
    }

    public void setGid(int gid) {
        this.gid = gid;
    }

    public String getGuestname() {
        return guestname;
    }

    public void setGuestname(String guestname) {
        this.guestname = guestname;
    }

    public String getEmailid() {
        return emailid;
    }

    public void setEmailid(String emailid) {
        this.emailid = emailid;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMobileno() {
        return mobileno;
    }

    public void setMobileno(String mobileno) {
        this.mobileno = mobileno;
    }

    
}
