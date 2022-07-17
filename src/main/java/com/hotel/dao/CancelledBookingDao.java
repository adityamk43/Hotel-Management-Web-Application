package com.hotel.dao;

import com.hotel.entities.BookingDetails;
import com.hotel.entities.CancelledBooking;
import com.hotel.entities.Guest;
import com.hotel.entities.RoomsCategory;
import java.sql.*;
import java.util.ArrayList;

// @author ADITYA
public class CancelledBookingDao {

    private Connection con;

    public CancelledBookingDao(Connection con) {
        this.con = con;
    }

    public boolean CancelBooking(BookingDetails booking, RoomsCategory categoryname) {
        boolean f = false;
        CancelledBooking cancelledbooking = new CancelledBooking();

        try {

            //getting category id
            String RoomCategory = "select \"NOOFROOMS\" from \"ROOMSCATEGORY\" where \"CATEGORY\" = ?";
            PreparedStatement pst = con.prepareStatement(RoomCategory);
            pst.setString(1, categoryname.getCategory());

            int noofrooms_before = 0;

            ResultSet rs1 = pst.executeQuery();

            if (rs1.next()) {
                noofrooms_before = rs1.getInt("noofrooms");

            }
            
            //copying cancelbooking details to cancelbooking table
            String query = "Insert into \"CANCELLEDBOOKING\"(select * from \"BookingDetails\" where \"BID\"=?)";
            PreparedStatement pst1 = this.con.prepareStatement(query);
            pst1.setInt(1, booking.getBid());

            pst1.executeUpdate();

            
            //deleting cancelbookingdata from bookingsdetails table
            String query2 = "Delete from \"BookingDetails\" where \"BID\"=?";
            PreparedStatement pst2 = this.con.prepareStatement(query2);
            pst2.setInt(1, booking.getBid());

            pst2.executeUpdate();
            
            //getting roomsbooked from cancelbooking table
            String query3 = "select \"ROOMSBOOKED\" from \"CANCELLEDBOOKING\" where \"CBID\"=?";
            PreparedStatement pst3 = this.con.prepareStatement(query3);
            pst3.setInt(1, booking.getBid());

            ResultSet Rset = pst3.executeQuery();
            
            if(Rset.next()){
                cancelledbooking.setRoomsbooked(Rset.getInt("roomsbooked"));
            }
            
            //updating roomscat noofrooms after booking is cancelled
            int Rooms_left = noofrooms_before + (cancelledbooking.getRoomsbooked());
            String NoofRooms_query = "update \"ROOMSCATEGORY\" set \"NOOFROOMS\" = ? where \"CATEGORY\" = ?";
            PreparedStatement pst4 = con.prepareStatement(NoofRooms_query);
            pst4.setInt(1, Rooms_left);
            pst4.setString(2, categoryname.getCategory());

            pst4.executeUpdate();

            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public ArrayList<CancelledBooking> getGuestCancelledBookingDetails(Guest guest) {

        ArrayList<CancelledBooking> cancelledbooking_list = new ArrayList<>();

        try {

            String query1 = "select * from \"CANCELLEDBOOKING\" where \"GID\"=? order by \"BOOKINGDATE\" desc";
            PreparedStatement pst1 = con.prepareStatement(query1);
            pst1.setInt(1, guest.getGid());

            ResultSet set2 = pst1.executeQuery();

            while (set2.next()) {
                CancelledBooking cancelledbooking = new CancelledBooking();

                cancelledbooking.setCBid(set2.getInt("cbid"));
                cancelledbooking.setGid(set2.getInt("gid"));
                cancelledbooking.setAdults(set2.getInt("noofadults"));
                cancelledbooking.setKids(set2.getInt("noofkids"));
                cancelledbooking.setRoomsbooked(set2.getInt("roomsbooked"));
                cancelledbooking.setCid(set2.getInt("cid"));
                cancelledbooking.setTotalamount(set2.getFloat("totalamount"));
                cancelledbooking.setCurrencyvalue(set2.getString("currencyvalue"));
                cancelledbooking.setBookingdate(set2.getTimestamp("bookingdate"));
                cancelledbooking.setCheckin(set2.getDate("checkin"));
                cancelledbooking.setCheckout(set2.getDate("checkout"));

                cancelledbooking_list.add(cancelledbooking);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cancelledbooking_list;
    }
}
