package com.hotel.dao;
import com.hotel.entities.UserFeedback;
import java.sql.*;

// @author ADITYA
 
public class UserFeedbackDao {
    
    private Connection con;

    public UserFeedbackDao(Connection con) {
        this.con = con;
    }
    
    public boolean SubmitQuery(UserFeedback ufeedback){
        
        boolean f=false;
        
        try{
            
            String query = "insert into \"USERFEEDBACKS\"(\"FNAME\", \"LNAME\", \"EMAIL_ID\", \"MOBILE_NUMBER\", \"USERQUERIES\") values(?, ?, ?, ?, ?)";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1, ufeedback.getFname());
            pst.setString(2, ufeedback.getLname());
            pst.setString(3, ufeedback.getEmailID());
            pst.setString(4, ufeedback.getMobileNo());
            pst.setString(5, ufeedback.getUserQueries());
            
            pst.executeUpdate();
            
            f=true;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return f;
    }
    
}
