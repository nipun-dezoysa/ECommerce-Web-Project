/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mainPackage;

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
public class DatabaseLogIn {
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
        //DatabaseLogIn db1=new DatabaseLogIn();
        //db1.getData();
        
        //db1.checkData("abc2.@gmail.com", "1234");
        //System.out.println(db1.islogin());
        
    }
    
    
boolean login;
    

  
    
    public void getData(String email, String password ) {
        
        String driver ="com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/shoetopia";
            String query="INSERT INTO `users`(`Email`, `Password`) VALUES  ('" + email + "','" + password + "')";
            try {
                Class.forName(driver);
                Connection con = DriverManager.getConnection(url,"root","");
                Statement st = con.createStatement();
                st.executeUpdate(query);
            
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
            }
    }
    
    
    
    public void checkData(String email, String password) {
        
        String driver ="com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/shoetopia";
            String Query ="SELECT `Id`, `Email`, `Password` FROM `users` WHERE Email = '" + email + "'";
            System.out.println("log email: " + email);
            System.out.println("log passwd: " + password);
            
            try {
                Class.forName(driver);
                Connection con = DriverManager.getConnection(url,"root","");
                Statement st = con.createStatement();
                String emailc="";
                String passwordc="";
                
                ResultSet resultSet= st.executeQuery(Query);
                if (resultSet.next()) {
                    emailc = resultSet.getString("Email");
                    passwordc = resultSet.getString("Password");
                    System.out.println("Username: " + emailc);
                    System.out.println("Password: " + passwordc);
                    if(password.equals(passwordc) && email.equals(emailc)){
                        login = true;
                        System.out.println("Password correct");
                        
                    } 
                    resultSet.close();
                    st.close();
                
    }           else{
                        System.out.println("This is not correct password or username");
                       
                }
            
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
            }
    }
    public boolean islogin(){
        return login;
    }
}