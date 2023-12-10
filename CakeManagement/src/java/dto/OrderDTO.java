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
public class OrderDTO {
    private String cakeID;
    private int quantity;
    private float price;
    
    public OrderDTO() {
    }

    public OrderDTO(String cakeID, int quantity, float price) {
        this.cakeID = cakeID;
        this.quantity = quantity;
        this.price = price;
    }

    public String getCakeID() {
        return cakeID;
    }

    public void setCakeID(String cakeID) {
        this.cakeID = cakeID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    
    
}
