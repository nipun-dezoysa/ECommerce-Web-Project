/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

/**
 *
 * @author Nipun
 */
public class Stepper {
    String place;
    String color;
    String icon;
    Timestamp time;

    public Stepper(String place, String color, String icon) {
        this.place = place;
        this.color = color;
        this.icon = icon;
    }

    public Stepper(String place, String color, String icon, Timestamp time) {
        this.place = place;
        this.color = color;
        this.icon = icon;
        this.time = time;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public String getDate(){
        DateFormat f = new SimpleDateFormat("dd MMM yyyy");
        if(color.equals("gray"))return "Est. "+f.format(time);
        else return f.format(time);
    }
    

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }
    
    
}
