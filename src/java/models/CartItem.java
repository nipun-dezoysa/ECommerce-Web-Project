/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

/**
 *
 * @author Nipun
 */
public class CartItem {
    private int id;
    private int quantity;
    private String color;
    private String size;

    public CartItem(int id, int quantity, String color, String size) {
        this.id = id;
        this.quantity = quantity;
        this.color = color;
        this.size = size;
    }

    public int getId() {
        return id;
    }

    public int getQuantity() {
        return quantity;
    }

    public String getColor() {
        return color;
    }

    public String getSize() {
        return size;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    
    
    
}
