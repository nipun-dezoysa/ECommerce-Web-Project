/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.text.DecimalFormat;
import java.util.ArrayList;

public class Product {
    int id;
    String name;
    String des;
    String brand;
    int Price;
    int discount;
    int type;
    int available;
    String img1;
    String img2;
    String img3;
    String img4;
    
    ArrayList<Color> colors;
    ArrayList<Size> sizes;

    public Product() {
        
    }
    
    

    public Product(int id, String name, String des, String brand, int Price, int discount, int type, int available, String img1, String img2, String img3, String img4) {
        this.id = id;
        this.name = name;
        this.des = des;
        this.brand = brand;
        this.Price = Price;
        this.discount = discount;
        this.type = type;
        this.available = available;
        this.img1 = img1;
        this.img2 = img2;
        this.img3 = img3;
        this.img4 = img4;
    }

    public Product(int id, String name, String des, String brand, int Price, int discount, int type, int available, String img1, String img2, String img3, String img4, ArrayList<Color> colors, ArrayList<Size> sizes) {
        this.id = id;
        this.name = name;
        this.des = des;
        this.brand = brand;
        this.Price = Price;
        this.discount = discount;
        this.type = type;
        this.available = available;
        this.img1 = img1;
        this.img2 = img2;
        this.img3 = img3;
        this.img4 = img4;
        this.colors = colors;
        this.sizes = sizes;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public int getPrice() {
        return Price;
    }

    public void setPrice(int Price) {
        this.Price = Price;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getAvailable() {
        return available;
    }

    public void setAvailable(int available) {
        this.available = available;
    }

    public String getImg1() {
        return img1;
    }

    public void setImg1(String img1) {
        this.img1 = img1;
    }

    public String getImg2() {
        return img2;
    }

    public void setImg2(String img2) {
        this.img2 = img2;
    }

    public String getImg3() {
        return img3;
    }

    public void setImg3(String img3) {
        this.img3 = img3;
    }

    public String getImg4() {
        return img4;
    }

    public void setImg4(String img4) {
        this.img4 = img4;
    }

    public ArrayList<Color> getColors() {
        return colors;
    }

    public void setColors(ArrayList<Color> colors) {
        this.colors = colors;
    }

    public ArrayList<Size> getSizes() {
        return sizes;
    }

    public void setSizes(ArrayList<Size> sizes) {
        this.sizes = sizes;
    }
    
    public String getformatPrice(){
        double price = (double)this.Price;
        return currFormat(price);
    }
    
    public String getformatDis(){
        double dis = getDisPrice();
        return currFormat(dis);
    }
    
    public double getDisPrice(){
        double price = (double)this.Price;
        return price - (price*this.discount/100);
    }
    
    public String currFormat(double a){
        DecimalFormat formatter = new DecimalFormat("#,###.00");
        return formatter.format(a);
    }
    
    public String getTypeString(){
        if(this.type==1){
            return "Men Shoes";
        }else if(this.type==1){
            return "Women Shoes";
        }else{
            return "Kid Shoes";    
        }
    }
    
}
