package com.hotel.entities;

/**
 *
 * @author ADITYA
 */
public class Payment {
    
    private int pid;
    private int bid;
    private String PaymentMethod;
    private String CardNumber;
    private String CardExpDate;
    private String CardName;

    public Payment() {
    }

    public Payment(int bid, String PaymentMethod, String CardNumber, String CardExpDate, String CardName) {
        this.bid = bid;
        this.PaymentMethod = PaymentMethod;
        this.CardNumber = CardNumber;
        this.CardExpDate = CardExpDate;
        this.CardName = CardName;
    }

    public Payment(int bid, String PaymentMethod) {
        this.bid = bid;
        this.PaymentMethod = PaymentMethod;
    }
    

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public String getPaymentMethod() {
        return PaymentMethod;
    }

    public void setPaymentMethod(String PaymentMethod) {
        this.PaymentMethod = PaymentMethod;
    }

    public String getCardNumber() {
        return CardNumber;
    }

    public void setCardNumber(String CardNumber) {
        this.CardNumber = CardNumber;
    }

    public String getCardExpDate() {
        return CardExpDate;
    }

    public void setCardExpDate(String CardExpDate) {
        this.CardExpDate = CardExpDate;
    }

    public String getCardName() {
        return CardName;
    }

    public void setCardName(String CardName) {
        this.CardName = CardName;
    }
    
    
    
}
