/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
public class User {
    int id;
    String email;
    String fname;
    String lname;
    String bday;
    String pno;
    Timestamp reg;
    Timestamp login;
    int status;
    
    int ocount;

    public int getOcount() {
        return ocount;
    }

    public void setOcount(int ocount) {
        this.ocount = ocount;
    }

    public User(int id, String email) {
        this.id = id;
        this.email = email;
    }

    public User(int id, String email, String fname, String lname, String bday, String pno, Timestamp reg, Timestamp login, int status) {
        this.id = id;
        this.email = email;
        this.fname = fname;
        this.lname = lname;
        this.bday = bday;
        this.pno = pno;
        this.reg = reg;
        this.login = login;
        this.status = status;
        
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getBday() {
        return bday;
    }

    public void setBday(String bday) {
        this.bday = bday;
    }

    public String getPno() {
        return pno;
    }

    public void setPno(String pno) {
        this.pno = pno;
    }

    public Timestamp getReg() {
        return reg;
    }

    public void setReg(Timestamp reg) {
        this.reg = reg;
    }

    public Timestamp getLogin() {
        return login;
    }

    public void setLogin(Timestamp login) {
        this.login = login;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    public String getFullName(){
        if(this.fname==null||this.lname==null){
            return "not updated";
        }else{
            return this.fname+" "+this.lname;
        }
    }
    
    public String getLogDate(){
        DateFormat f = new SimpleDateFormat("dd MMM yyyy");
        return f.format(login);
    }
    public String getLogDateTime(){
        DateFormat f = new SimpleDateFormat("dd MMM yyyy HH:mm");
        return f.format(login);
    }
    public String getRegDateTime(){
        DateFormat f = new SimpleDateFormat("dd MMM yyyy HH:mm");
        return f.format(reg);
    }
}
