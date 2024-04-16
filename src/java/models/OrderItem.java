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
public class OrderItem {
    int id;
    int pid;
    String name;
    String size;
    String Color;
    int price;
    int discount;
    int quantity;
    String img;

    public OrderItem(int id, int pid, String name, String size, String Color, int price, int discount, int quantity, String img) {
        this.id = id;
        this.pid = pid;
        this.name = name;
        this.size = size;
        this.Color = Color;
        this.price = price;
        this.discount = discount;
        this.quantity = quantity;
        this.img = img;
    }

    public int getId() {
        return id;
    }

    public int getPid() {
        return pid;
    }

    public String getName() {
        return name;
    }

    public String getSize() {
        return size;
    }

    public String getColor() {
        return Color;
    }

    public int getPrice() {
        return price;
    }

    public int getDiscount() {
        return discount;
    }

    public int getQuantity() {
        return quantity;
    }

    public String getImg() {
        return img;
    }
    
    
    
}
