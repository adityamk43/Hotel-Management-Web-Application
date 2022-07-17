package com.hotel.entities;

// @author ADITYA

public class UserFeedback {
    
    private String Fname;
    private String Lname;
    private String EmailID;
    private String MobileNo;
    private String UserQueries;

    public UserFeedback() {
    }
    
    public UserFeedback(String Fname, String Lname, String EmailID, String MobileNo, String UserQueries) {
        this.Fname = Fname;
        this.Lname = Lname;
        this.EmailID = EmailID;
        this.MobileNo = MobileNo;
        this.UserQueries = UserQueries;
    }

    public String getFname() {
        return Fname;
    }

    public void setFname(String Fname) {
        this.Fname = Fname;
    }

    public String getLname() {
        return Lname;
    }

    public void setLname(String Lname) {
        this.Lname = Lname;
    }

    public String getEmailID() {
        return EmailID;
    }

    public void setEmailID(String EmailID) {
        this.EmailID = EmailID;
    }

    public String getMobileNo() {
        return MobileNo;
    }

    public void setMobileNo(String MobileNo) {
        this.MobileNo = MobileNo;
    }

    public String getUserQueries() {
        return UserQueries;
    }

    public void setUserQueries(String UserQueries) {
        this.UserQueries = UserQueries;
    }
    
}
