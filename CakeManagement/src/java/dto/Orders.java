/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.time.LocalDateTime;

/**
 *
 * @author tolyh
 */
public class Orders {
    private int orderID;
    private LocalDateTime  dateBuy;
    private float total;
    private String userID;
    private String phone;
    private String address;

    public Orders() {
    }

    public Orders(int orderID, LocalDateTime dateBuy, float total, String userID, String phone, String address) {
        this.orderID = orderID;
        this.dateBuy = dateBuy;
        this.total = total;
        this.userID = userID;
        this.phone = phone;
        this.address = address;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public LocalDateTime getDateBuy() {
        return dateBuy;
    }

    public void setDateBuy(LocalDateTime dateBuy) {
        this.dateBuy = dateBuy;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
    
}
