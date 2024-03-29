/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loginandsignpackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author sanjeewa
 */
public class dblogin {
    public static void main(String[] arg){
        /*String driver ="com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/login";
        String query="INSERT INTO `std`(`uname`, `passwd`) VALUES ('asansaju123','dagldsaas')";
        try {
            Class.forName(driver);
            Connection con = DriverManager.getConnection(url,"root","");
            Statement st = con.createStatement();
            st.executeUpdate(query);
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(dblogin.class.getName()).log(Level.SEVERE, null, ex);
        }
        */
        //dblogin db1= new dblogin();
        
        //db1.getData("kalpa", "dklsajk");
        //db1.checkData("sanju", "123");
        
        
    }
    
    

    

  
    
    public void getData(String name, String passwd) {
        
        String driver ="com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/login";
            String query="INSERT INTO `std`(`uname`, `passwd`) VALUES ('" + name + "','" + passwd + "')";
            try {
                Class.forName(driver);
                Connection con = DriverManager.getConnection(url,"root","");
                Statement st = con.createStatement();
                st.executeUpdate(query);
            
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(dblogin.class.getName()).log(Level.SEVERE, null, ex);
            }
    }
    boolean login;
    
    
    public void checkData(String name, String passwd) {
        
        String driver ="com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/login";
            String query="INSERT INTO `std`(`uname`, `passwd`) VALUES ('" + name + "','" + passwd + "')";
            String query1="SELECT `uname`,`passwd` FROM `std` WHERE uname='" + name + "'";
            String query2="SELECT `passwd` FROM `std` WHERE uname='" + name + "'";
            System.out.println("log uname: " + name);
            System.out.println("log passwd: " + passwd);
            
            try {
                Class.forName(driver);
                Connection con = DriverManager.getConnection(url,"root","");
                Statement st = con.createStatement();
                String namec="";
                String passwdc="";
                
                ResultSet resultSet= st.executeQuery(query1);
                if (resultSet.next()) {
                    namec = resultSet.getString("uname");
                    passwdc = resultSet.getString("passwd");
                    System.out.println("Username: " + namec);
                    System.out.println("Password: " + passwdc);
                    if(passwd.equals(passwdc) && name.equals(namec)){
                        login = true;
                        
                    } 
                    resultSet.close();
                    st.close();
                
    }           else{
                        System.out.println("This is not correct password or username");
                       
                }
            
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(dblogin.class.getName()).log(Level.SEVERE, null, ex);
            }
    }
    public boolean islogin(){
        return login;
    }
    
    
}
