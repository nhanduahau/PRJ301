/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author tolyh
 */
public class OrderDetails {
    private int orderDetailsID;
    private String cakeID;
    private int orderID;
    private float price;
    private int quantity;
    private float total;

    public OrderDetails() {
    }

    public OrderDetails(int orderDetailsID, String cakeID, int orderID, float price, int quantity, float total) {
        this.orderDetailsID = orderDetailsID;
        this.cakeID = cakeID;
        this.orderID = orderID;
        this.price = price;
        this.quantity = quantity;
        this.total = total;
    }

    public int getOrderDetailsID() {
        return orderDetailsID;
    }

    public void setOrderDetailsID(int orderDetailsID) {
        this.orderDetailsID = orderDetailsID;
    }

    public String getCakeID() {
        return cakeID;
    }

    public void setCakeID(String cakeID) {
        this.cakeID = cakeID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }
    
    
}
