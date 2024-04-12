/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

public class Color {
    String id;
    String pid;
    String value;

    public Color(String id, String pid, String value) {
        this.id = id;
        this.pid = pid;
        this.value = value;
    }

    public String getId() {
        return id;
    }

    public String getPid() {
        return pid;
    }

    public String getValue() {
        return value;
    }
    
    
    
}
