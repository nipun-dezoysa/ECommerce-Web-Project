/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

/**
 *
 * @author Nipun
 */
public class Order {
  int id;
  User user;
  String name;
  String email;
  String phone;
  String address;
  String note;
  int status;
  Timestamp date;
  ArrayList<OrderItem> items;
  ArrayList<Activity> activity;
  
  int itemCount=0;

    public Order(int id, User user, String name, String email, String phone, String address, String note, int status, Timestamp date, ArrayList<OrderItem> items) {
        this.id = id;
        this.user = user;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.note = note;
        this.status = status;
        this.date = date;
        this.items = items;
    }

    public Order(int id, String name, String email, String phone, String address, String note, int status, Timestamp date) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.note = note;
        this.status = status;
        this.date = date;
    }
    
    public String getTotal(){
        double total = 0;
        for(int i=0;i<items.size();i++){
            total+= items.get(i).getTotal();
        }
        DecimalFormat formatter = new DecimalFormat("#,###.00");
        return formatter.format(total);
    }
    
    public String getFTotal(){
        double total = 0;
        for(int i=0;i<items.size();i++){
            total+= items.get(i).getTotal();
        }
        DecimalFormat formatter = new DecimalFormat("#,###.00");
        return formatter.format(total+30);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getStatus() {
        return activity.get(activity.size()-1).getStatus();
    }

    public String getDate() {
        DateFormat f = new SimpleDateFormat("dd MMM yyyy");
        return f.format(activity.get(0).getDate());
    }
    
    public String getTime() {
        DateFormat f = new SimpleDateFormat("HH:mm");
        return f.format(activity.get(0).getDate());
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public ArrayList<OrderItem> getItems() {
        return items;
    }

    public void setItems(ArrayList<OrderItem> items) {
        this.items = items;
    }

    public int getItemCount() {
        return itemCount;
    }

    public void setItemCount(int itemCount) {
        this.itemCount = itemCount;
    }

    public ArrayList<Activity> getActivity() {
        return activity;
    }

    public void setActivity(ArrayList<Activity> activity) {
        this.activity = activity;
    }
    
    
  
  
}
