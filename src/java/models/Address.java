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
public class Address {
    String id;
    String uid;
    String fname;
    String lname;
    String email;
    String Phone;
    String address;
    String town;
    String Province;

    public Address(String id, String uid, String fname, String lname, String email, String Phone, String address, String town, String Province) {
        this.id = id;
        this.uid = uid;
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.Phone = Phone;
        this.address = address;
        this.town = town;
        this.Province = Province;
    }

    public String getId() {
        return id;
    }

    public String getUid() {
        return uid;
    }

    public String getFname() {
        return fname;
    }

    public String getLname() {
        return lname;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return Phone;
    }

    public String getAddress() {
        return address;
    }

    public String getTown() {
        return town;
    }

    public String getProvince() {
        return Province;
    }
    
    public String getFullAddress(){
        return this.address+", "+this.getTown()+", "+this.getProvince();
    }
    
}
