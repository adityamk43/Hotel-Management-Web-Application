//@author ADITYA
package com.hotel.dao;

import com.hotel.entities.BookingDetails;
import com.hotel.entities.Guest;
import com.hotel.entities.RoomsCategory;
import java.sql.*;
import java.util.ArrayList;
//import java.util.ArrayList;

public class BookingDao {

    private Connection con;

    public BookingDao(Connection con) {
        this.con = con;
    }

    public boolean saveBookingData(Guest guestdata, BookingDetails Bookingdata, RoomsCategory categoryname) {
        boolean f = false;

        try {
//            getting category id
            String RoomCategory = "select \"CID\", \"NOOFROOMS\" from \"ROOMSCATEGORY\" where \"CATEGORY\" = ?";
            PreparedStatement pst1 = con.prepareStatement(RoomCategory);
            pst1.setString(1, categoryname.getCategory());

            int cid = 0;
            int noofrooms_before = 0;

            ResultSet rs1 = pst1.executeQuery();

            if (rs1.next()) {
                cid = rs1.getInt("cid");
                noofrooms_before = rs1.getInt("noofrooms");

            }

//            inserting guest data
            String GuestData_query1 = "insert into \"GUEST\"(\"GUESTNAME\", \"EMAILID\", \"MOBILENUMBER\", \"PASSWORD\") values(?,?,?,?)";
            PreparedStatement pst2 = con.prepareStatement(GuestData_query1);
            pst2.setString(1, guestdata.getGuestname().toLowerCase());
            pst2.setString(2, guestdata.getEmailid().toLowerCase());
            pst2.setString(3, guestdata.getMobileno());
            pst2.setString(4, guestdata.getPassword());

            pst2.executeUpdate();

//            Getting guest id
            String GuestData_query2 = "select \"GID\" from \"GUEST\" where \"GUESTNAME\" = ?";
            PreparedStatement pst3 = con.prepareStatement(GuestData_query2);
            pst3.setString(1, guestdata.getGuestname().toLowerCase());

            ResultSet rs2 = pst3.executeQuery();
            int gid = 0;

            if (rs2.next()) {
                gid = rs2.getInt("gid");
            }

//            inserting booking details data
            String BookingDetails_query = "insert into \"BookingDetails\"(\"NOOFADULTS\", \"NOOFKIDS\", \"CURRENCYVALUE\", \"TOTALAMOUNT\", \"ROOMSBOOKED\", \"CHECKIN\", \"CHECKOUT\", \"GID\", \"CID\") values(?,?,?,?,?,?,?,?,?)";
            PreparedStatement pst4 = con.prepareStatement(BookingDetails_query);
            pst4.setInt(1, Bookingdata.getAdults());
            pst4.setInt(2, Bookingdata.getKids());
            pst4.setString(3, Bookingdata.getCurrencyvalue());
            pst4.setFloat(4, Bookingdata.getTotalamount());
            pst4.setInt(5, Bookingdata.getRoomsbooked());
            pst4.setDate(6, Bookingdata.getCheckin());
            pst4.setDate(7, Bookingdata.getCheckout());
            pst4.setInt(8, gid);
            pst4.setInt(9, cid);

            pst4.executeUpdate();

            int Rooms_left = noofrooms_before - (Bookingdata.getRoomsbooked());
            String NoofRooms_query = "update \"ROOMSCATEGORY\" set \"NOOFROOMS\" = ? where \"CATEGORY\" = ?";
            PreparedStatement pst5 = con.prepareStatement(NoofRooms_query);
            pst5.setInt(1, Rooms_left);
            pst5.setString(2, categoryname.getCategory());

            pst5.executeUpdate();

            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public Guest getGuestbyEmailandPassword(String email, String password) {
        Guest guest = null;

        try {

            String query = "select * from \"GUEST\" where \"EMAILID\" =? and \"PASSWORD\" = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password);

            ResultSet set = pst.executeQuery();

            if (set.next()) {
                guest = new Guest();

                guest.setGid(set.getInt("gid"));
                guest.setGuestname(set.getString("guestname").toUpperCase());
                guest.setEmailid(set.getString("emailid"));
                guest.setPassword(set.getString("password"));
                guest.setMobileno(set.getString("mobilenumber"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return guest;
    }

    public int setGuestGID(Guest guest) {
        int gid = 0;

        try {

            String query = "select \"GID\" from \"GUEST\" where \"EMAILID\" =?";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1, guest.getEmailid().toLowerCase());

            ResultSet set = pst.executeQuery();

            if (set.next()) {
                gid = set.getInt("gid");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return gid;
    }

    public ArrayList<BookingDetails> getGuestBookingDetails(Guest guest) {

        ArrayList<BookingDetails> booking_list = new ArrayList<>();

        try {

            String query1 = "select * from \"BookingDetails\" where \"GID\"=? order by \"BOOKINGDATE\" desc";
            PreparedStatement pst1 = con.prepareStatement(query1);
            pst1.setInt(1, guest.getGid());

            ResultSet set2 = pst1.executeQuery();

            while (set2.next()) {
                BookingDetails booking = new BookingDetails();

                booking.setBid(set2.getInt("bid"));
                booking.setGid(set2.getInt("gid"));
                booking.setAdults(set2.getInt("noofadults"));
                booking.setKids(set2.getInt("noofkids"));
                booking.setRoomsbooked(set2.getInt("roomsbooked"));
                booking.setCid(set2.getInt("cid"));
                booking.setTotalamount(set2.getFloat("totalamount"));
                booking.setCurrencyvalue(set2.getString("currencyvalue"));
                booking.setBookingdate(set2.getTimestamp("bookingdate"));
                booking.setCheckin(set2.getDate("checkin"));
                booking.setCheckout(set2.getDate("checkout"));

                booking_list.add(booking);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return booking_list;
    }

    public Timestamp getGuestBookingDate(BookingDetails booking) {

        try {

            String query1 = "select \"BOOKINGDATE\" from \"BookingDetails\" where \"BID\"=? order by \"BOOKINGDATE\"";
            PreparedStatement pst1 = con.prepareStatement(query1);
            pst1.setInt(1, booking.getBid());

            ResultSet set2 = pst1.executeQuery();

            if (set2.next()) {

                booking.setBookingdate(set2.getTimestamp("bookingdate"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return booking.getBookingdate();
    }

    public BookingDetails SavedGuestBookingDetails(BookingDetails booking) {

        try {

            String query1 = "select * from \"BookingDetails\" where \"BID\"=?";
            PreparedStatement pst1 = con.prepareStatement(query1);
            pst1.setInt(1, booking.getBid());

            ResultSet set2 = pst1.executeQuery();

            if (set2.next()) {

//                booking.setBid(set2.getInt("bid"));
                booking.setGid(set2.getInt("gid"));
                booking.setAdults(set2.getInt("noofadults"));
                booking.setKids(set2.getInt("noofkids"));
                booking.setRoomsbooked(set2.getInt("roomsbooked"));
                booking.setCid(set2.getInt("cid"));
                booking.setTotalamount(set2.getFloat("totalamount"));
                booking.setCurrencyvalue(set2.getString("currencyvalue"));
                booking.setBookingdate(set2.getTimestamp("bookingdate"));
                booking.setCheckin(set2.getDate("checkin"));
                booking.setCheckout(set2.getDate("checkout"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return booking;
    }

    public boolean saveLoginGuestBookingData(BookingDetails booking, Guest guest, RoomsCategory categoryname) {

        boolean f = false;

        try {
//            getting category id
            String RoomCategory = "select \"CID\", \"NOOFROOMS\" from \"ROOMSCATEGORY\" where \"CATEGORY\" = ?";
            PreparedStatement pst = con.prepareStatement(RoomCategory);
            pst.setString(1, categoryname.getCategory());

            int cid = 0;
            int noofrooms_before = 0;

            ResultSet rs1 = pst.executeQuery();

            if (rs1.next()) {
                cid = rs1.getInt("cid");
                noofrooms_before = rs1.getInt("noofrooms");

            }

//            inserting booking details data
            String BookingDetails_query = "insert into \"BookingDetails\"(\"NOOFADULTS\", \"NOOFKIDS\", \"CURRENCYVALUE\", \"TOTALAMOUNT\", \"ROOMSBOOKED\", \"CHECKIN\", \"CHECKOUT\", \"GID\", \"CID\") values(?,?,?,?,?,?,?,?,?)";
            
            PreparedStatement pst1 = con.prepareStatement(BookingDetails_query);
            pst1.setInt(1, booking.getAdults());
            pst1.setInt(2, booking.getKids());
            pst1.setString(3, booking.getCurrencyvalue());
            pst1.setFloat(4, booking.getTotalamount());
            pst1.setInt(5, booking.getRoomsbooked());
            pst1.setDate(6, booking.getCheckin());
            pst1.setDate(7, booking.getCheckout());
            pst1.setInt(8, guest.getGid());
            pst1.setInt(9, cid);

            pst1.executeUpdate();

            int Rooms_left = noofrooms_before - (booking.getRoomsbooked());
            String NoofRooms_query = "update \"ROOMSCATEGORY\" set \"NOOFROOMS\" = ? where \"CATEGORY\" = ?";
            PreparedStatement pst2 = con.prepareStatement(NoofRooms_query);
            pst2.setInt(1, Rooms_left);
            pst2.setString(2, categoryname.getCategory());

            pst2.executeUpdate();

            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;

    }

    public int setBookingID(Guest guest) {
        int bid = 0;

        try {

            String query = "Select \"BID\" from \"BookingDetails\" where \"GID\"=? order by \"BOOKINGDATE\" desc";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setInt(1, guest.getGid());

            ResultSet set = pst.executeQuery();

            if (set.next()) {
                bid = set.getInt("bid");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return bid;
    }

    public int GetCIDFromBooking(BookingDetails booking) {
        int cid = 0;

        try {

            String query = "select \"CID\" from \"BookingDetails\" where \"BID\" =?";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setInt(1, booking.getBid());

            ResultSet set = pst.executeQuery();

            if (set.next()) {

                cid = set.getInt("cid");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return cid;
    }

    public boolean CheckResetEmail(String EmailID) {

        boolean f = false;

        try {

            String query0 = "select \"EMAILID\" from \"GUEST\" where \"EMAILID\"=?";
            PreparedStatement pst0 = this.con.prepareStatement(query0);
            pst0.setString(1, EmailID);

            ResultSet set = pst0.executeQuery();

            if (set.next()) {
                f=true;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public boolean ResetPasswordByEmail(String EmailID, String Password) {

        boolean f = false;

        try {

            String query = "update \"GUEST\" set \"PASSWORD\" =? where \"EMAILID\"  =?";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1, Password);
            pst.setString(2, EmailID);

            pst.executeUpdate();

            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
}
