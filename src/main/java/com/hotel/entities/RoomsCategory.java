package com.hotel.entities;

/**
 *
 * @author ADITYA
 */
public class RoomsCategory {
    
    private int cid;
    private String category;
    private int price_person;
    private int price_child;
    private int no_of_rooms;

    public RoomsCategory() {
    }

    public RoomsCategory(int cid) {
        this.cid = cid;
    }
    
    public RoomsCategory(String category) {
        this.category = category;
    }
    
    
    public RoomsCategory(int cid, String category, int price_person, int price_child) {
        this.cid = cid;
        this.category = category;
        this.price_person = price_person;
        this.price_child = price_child;
    }

    public RoomsCategory(int cid, int price_person, int price_child) {
        this.cid = cid;
        this.price_person = price_person;
        this.price_child = price_child;
    }

    public RoomsCategory(int price_person, int price_child) {
        this.price_person = price_person;
        this.price_child = price_child;
    }
    
    
    public RoomsCategory(String category, int price_person, int price_child) {
        this.category = category;
        this.price_person = price_person;
        this.price_child = price_child;
    }

    public int getNo_of_rooms() {
        return no_of_rooms;
    }

    public void setNo_of_rooms(int no_of_rooms) {
        this.no_of_rooms = no_of_rooms;
    }
    
    
    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getPrice_person() {
        return price_person;
    }

    public void setPrice_person(int price_person) {
        this.price_person = price_person;
    }

    public int getPrice_child() {
        return price_child;
    }

    public void setPrice_child(int price_child) {
        this.price_child = price_child;
    }
    
    
    
}
