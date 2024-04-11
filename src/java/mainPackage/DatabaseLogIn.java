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
        DatabaseLogIn db1=new DatabaseLogIn();
        //db1.getData();
        
        //db1.checkData("abc2.@gmail.com", "1234");
        //System.out.println(db1.islogin());
        //db1.addSizes(20, 5, 0, 0);
        db1.getpid("sas");
        
    }
    
    
boolean login;
boolean adminlogin;
    

  
    
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
    public void adminSignIn(String email, String password) {
        
        String driver ="com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/shoetopia";
            String Query ="SELECT `Id`, `Email`, `Password` FROM `admin` WHERE Email = '" + email + "'";
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
                        adminlogin = true;
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
     public boolean adminislogin(){
        return adminlogin;
    }
     
     
     
     public void addProduct(String name, String description ,String  brand ,int price ,int discount ,String sizes,String colors, String image) {
        
        String driver ="com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/shoetopia";
            String query="INSERT INTO `products`(`name`, `description`, `brand`, `price`, `discount`, `sizes`, `colors`, `img01`, `img02`, `img03`, `img04`) VALUES ('"+name+"','"+description+"','"+brand+"',"+price+","+discount+",'"+sizes+"','"+colors+"','"+image+"','null','null','null')";
            //String query = "INSERT INTO `products`(`name`, `description`, `brand`, `price`, `discount`, `sizes`, `colors`, `img01`, `img02`, `img03`, `img04`) VALUES ('abc','dsadasd dfadfa dafa','deded',1700,2,'dqd eded ','edwfew','fewfwef','null','null','null')";
            
            try {
                Class.forName(driver);
                Connection con = DriverManager.getConnection(url,"root","");
                Statement st = con.createStatement();
                st.executeUpdate(query);
            
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
            }
    }
     
     public void addSizes(int size, int pid,int ave,int type ) {
        
        String driver ="com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/shoetopia";
            String query="INSERT INTO `sizes`(`size`, `pid`, `availability`, `type`) VALUES ("+size+","+pid+",1,1)";
            try {
                Class.forName(driver);
                Connection con = DriverManager.getConnection(url,"root","");
                Statement st = con.createStatement();
                st.executeUpdate(query);
            
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
            }
    }
     
    public void addColors(int pid,String ccode ) {
        
        String driver ="com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/shoetopia";
            String query="INSERT INTO `colors`(`pid`, `ccode`) VALUES ('"+pid+"','"+ccode+"')";
            try {
                Class.forName(driver);
                Connection con = DriverManager.getConnection(url,"root","");
                Statement st = con.createStatement();
                st.executeUpdate(query);
            
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
            }
    }
    
    
      public int getpid(String name) {
        
        String driver ="com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/shoetopia";
            String Query ="SELECT `Id` FROM `products` WHERE name = '"+name+"'";
            int pid=-1;
           
            
            try {
                Class.forName(driver);
                Connection con = DriverManager.getConnection(url,"root","");
                Statement st = con.createStatement();
                
                
                ResultSet resultSet= st.executeQuery(Query);
                if (resultSet.next()) {
                    
                
                pid=resultSet.getInt("id");
                
                }
                
                
              
            
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            System.out.println(pid);
            return pid;
    }

    
    
    
}