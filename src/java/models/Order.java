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
    
    public double calculateTotal(){
        double total = 0;
        for(int i=0;i<items.size();i++){
            total+= items.get(i).getTotal();
        }
        return total;
    }
    
    public String getTotal(){
        DecimalFormat formatter = new DecimalFormat("#,###.00");
        return formatter.format(calculateTotal());
    }
    
    public String getFTotal(){
        DecimalFormat formatter = new DecimalFormat("#,###.00");
        return formatter.format(calculateTotal()+30);
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
    
   String Fdate(Timestamp a){
        DateFormat f = new SimpleDateFormat("dd MMM yyyy");
        return f.format(a);
    }
    
    public String[] getDeliverDates(){
        String[] dates = new String[5];
        dates[0] = getDate();
        Timestamp deliver=null;
        Timestamp ship=null;
        for(Activity ac : activity){
            if(ac.getStatus()==3)ship=ac.getDate();
            if(ac.getStatus()==4)deliver=ac.getDate();
        }
        if(ship==null){
            ship = new Timestamp(activity.get(0).getDate().getTime()+ (24L * 60L * 60L * 1000L * 2));
            dates[1] = "Est."+Fdate(ship);
            dates[3] = "gray";
        }else{
           dates[1] = Fdate(ship);
           dates[3] = "blue";
        }
        if(deliver==null){
            deliver= new Timestamp(ship.getTime()+ (24L * 60L * 60L * 1000L * 4));
            dates[2] = "Est. "+Fdate(deliver);
            dates[4] = "gray";
        }else{
            dates[2] = Fdate(deliver);
            dates[4] = "blue";
        }
        
        
        return dates;
    }
    
    public ArrayList<Stepper> getStepper(){
        ArrayList<Stepper> st = new ArrayList<>();
        for(Activity ac : activity){
            if(ac.getStatus()==1)st.add(new Stepper("Placed","blue","fa-cart-shopping",ac.getDate()));
            else if(ac.getStatus()==3)st.add(new Stepper("Shipped","blue","fa-truck",ac.getDate()));
            else if(ac.getStatus()==4)st.add(new Stepper("Delivered","blue","fa-check",ac.getDate()));
            else if(ac.getStatus()==5)st.add(new Stepper("Canceled by you","red","fa-xmark",ac.getDate()));
            else if(ac.getStatus()==6)st.add(new Stepper("Declained","red","fa-xmark",ac.getDate()));
            else if(ac.getStatus()==7)st.add(new Stepper("Returned","red","fa-rotate-left",ac.getDate()));
        }
        if(activity.get(activity.size()-1).getStatus()<=3){
            if(activity.get(activity.size()-1).getStatus()<3){
                st.add(new Stepper("Shipped","gray","fa-truck",new Timestamp(activity.get(0).getDate().getTime()+ (24L * 60L * 60L * 1000L * 2))));
            }
            st.add(new Stepper("Delivered","gray","fa-check",new Timestamp(st.get(1).getTime().getTime()+ (24L * 60L * 60L * 1000L * 2))));
        }
        return st;
    }
    
  
  
}