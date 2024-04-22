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
public class Activity {
    int id;
    int oid;
    int status;
    Timestamp date;

    public Activity(int id, int oid, int status, Timestamp date) {
        this.id = id;
        this.oid = oid;
        this.status = status;
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public int getOid() {
        return oid;
    }

    public int getStatus() {
        return status;
    }

    public Timestamp getDate() {
        return date;
    }
    
    public String getFDate(){
        DateFormat f = new SimpleDateFormat("dd MMM yyyy HH:mm");
        return f.format(this.date);
    }
    
}
