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
    private int color;
    private int size;

    public CartItem(int id, int quantity, int color, int size) {
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

    public int getColor() {
        return color;
    }

    public int getSize() {
        return size;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public boolean isEqual(CartItem a){
      if(a.getId()==this.id && a.getColor()==this.color && a.getSize()==this.size){
          return true;
      }else{
          return false;
      }  
    }
    
    
}
