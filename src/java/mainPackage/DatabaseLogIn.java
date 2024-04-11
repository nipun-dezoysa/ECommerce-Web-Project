package mainPackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DatabaseLogIn {
boolean login;
boolean adminlogin;
static Statement st;
static void connectToDb(){
        String driver ="com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/shoetopia";
        
        try {
            Class.forName(driver);
            Connection con = DriverManager.getConnection(url,"root",""); 
            st = con.createStatement();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
        }
}

    
    
    public void getData(String email, String password ) {
        
        connectToDb();
            String query="INSERT INTO `users`(`Email`, `Password`) VALUES  ('" + email + "','" + password + "')";
            try {
                
                st.executeUpdate(query);
            
            } catch (SQLException ex) {
                Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
            }
    }
    
    
    
    public void checkData(String email, String password) {
        connectToDb();
            String Query ="SELECT `Id`, `Email`, `Password` FROM `users` WHERE Email = '" + email + "'";
            
            try {
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
            
            } catch (SQLException ex) {
                Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
            }
    }
    public boolean islogin(){
        return login;
    }
    public void adminSignIn(String email, String password) {
        connectToDb();
            String Query ="SELECT `Id`, `Email`, `Password` FROM `admin` WHERE Email = '" + email + "'";
            System.out.println("log email: " + email);
            System.out.println("log passwd: " + password);
            
            try {
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
            
            } catch (SQLException ex) {
                Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
            }
    }
     public boolean adminislogin(){
        return adminlogin;
    }
     
     
     
     public void addProduct(String name, String description ,String  brand ,int price ,int discount ,int type,int ava, String img1,String img2,String img3,String img4) {
         connectToDb();
            String query="INSERT INTO `products`(`name`, `description`, `brand`, `price`, `discount`, `type`, `availability`, `img01`, `img02`, `img03`, `img04`) VALUES ('"+name+"','"+description+"','"+brand+"',"+price+","+discount+","+type+","+ava+",'"+img1+"','"+img2+"','"+img3+"','"+img4+"')";
            try {
                st.executeUpdate(query);
                st.close();
            
            } catch (SQLException ex) {
                Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
            }
    }
     
     public void addSizes(int size, int pid) {
         connectToDb();
            String query="INSERT INTO `sizes`(`pid`,`size`) VALUES ("+pid+","+size+")";
            try {
                st.executeUpdate(query);
                st.close();
            
            } catch ( SQLException ex) {
                Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
            }
    }
     
    public void addColors(int pid,String ccode ) {
        connectToDb();
            String query="INSERT INTO `colors`(`pid`, `ccode`) VALUES ('"+pid+"','"+ccode+"')";
            try {
                st.executeUpdate(query);
                st.close();
            
            } catch (SQLException ex) {
                Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
            }
    }
    
    
      public int getpid(String name) {
          connectToDb();
            String Query ="SELECT `Id` FROM `products` WHERE name = '"+name+"'";
            int pid=-1;
           
            
            try {
                ResultSet resultSet= st.executeQuery(Query);
                if (resultSet.next()) {
                pid=resultSet.getInt("id");
                }
                st.close();
            } catch (SQLException ex) {
                Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
            }
            return pid;
    }

    
    
    
}