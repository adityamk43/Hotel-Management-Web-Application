//@author ADITYA
package com.hotel.dao;

import com.hotel.entities.RoomsCategory;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RoomsCategoryDao {

    private Connection con;

    public RoomsCategoryDao(Connection con) {
        this.con = con;
    }

    public RoomsCategory GetRoomsPrice(int Cid) {
//        ArrayList<RoomsCategory> list = new ArrayList<>();
        RoomsCategory roomscat = null;
        try {
            String query = "Select Priceforadult, PriceforChild from RoomsCategory where cid=? order by cid";

            PreparedStatement pst = con.prepareStatement(query);

            pst.setInt(1, Cid);

            ResultSet res = pst.executeQuery();
            if (res.next()) {
                roomscat = new RoomsCategory();
                roomscat.setPrice_person(res.getInt("Priceforadult"));
                roomscat.setPrice_child(res.getInt("Priceforchild"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return roomscat;
    }

    public List<RoomsCategory> GetRoomsPrice() {
        List<RoomsCategory> list = new ArrayList<>();

        try {
            String query = "Select \"PRICEFORADULT\", \"PRICEFORCHILD\" from \"ROOMSCATEGORY\" order by \"CID\"";

            PreparedStatement pst = con.prepareStatement(query);

            ResultSet res = pst.executeQuery();
            while (res.next()) {
                int priceperadult = res.getInt("Priceforadult");
                int priceperchild = res.getInt("Priceforchild");

                RoomsCategory roomscat = new RoomsCategory(priceperadult, priceperchild);
                list.add(roomscat);

            }
            

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public RoomsCategory GetRoomsCategory(int Cid) {
//        ArrayList<RoomsCategory> list = new ArrayList<>();
        RoomsCategory roomscat = null;
        try {
            String query = "Select \"CATEGORY\" from \"ROOMSCATEGORY\" where \"CID\" =? order by \"CID\"";

            PreparedStatement pst = con.prepareStatement(query);

            pst.setInt(1, Cid);

            ResultSet res = pst.executeQuery();
            if (res.next()) {
                roomscat = new RoomsCategory();
                roomscat.setCategory(res.getString("Category"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return roomscat;
    }

    public int GetNoofRooms(String Category) {
//        int noofrooms = 0;
        RoomsCategory categoryobject = new RoomsCategory();
        try {
            String query = "select \"NOOFROOMS\" from \"ROOMSCATEGORY\" where \"CATEGORY\" = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, Category);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
//                noofrooms = rs.getInt("noofrooms"); 
                categoryobject.setNo_of_rooms(rs.getInt("noofrooms"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return categoryobject.getNo_of_rooms();
//          return noofrooms;
    }
    
}
