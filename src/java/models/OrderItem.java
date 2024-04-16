/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.text.DecimalFormat;

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

    public OrderItem(int id, int pid, String name, String size, String Color, int price, int discount, int quantity) {
        this.id = id;
        this.pid = pid;
        this.name = name;
        this.size = size;
        this.Color = Color;
        this.price = price;
        this.discount = discount;
        this.quantity = quantity;
        this.img = "demo.jpg";
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
    
    public String getformatPrice(){
        double pric = (double)this.price;
        return currFormat(pric);
    }
    
    public String getformatDis(){
        double dis = getDisPrice();
        return currFormat(dis);
    }
    
    public double getDisPrice(){
        double pric = (double)this.price;
        return pric - (pric*this.discount/100);
    }
    
    public double getTotal(){
        return this.quantity *getDisPrice();
    }
    public String getformatTotal(){
        return currFormat(getTotal());
    }
    
    public String currFormat(double a){
        DecimalFormat formatter = new DecimalFormat("#,###.00");
        return formatter.format(a);
    }

    public void setImg(String img) {
        this.img = img;
    }
    
    
}
