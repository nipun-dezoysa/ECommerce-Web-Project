package mainPackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.*;

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

static void basicExecute(String query){
    connectToDb();
    try {
        st.executeUpdate(query);
        st.close();
    } catch (SQLException ex) {
        Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
    }
}

    
    
    public void getData(String email, String password ) {
            String query="INSERT INTO `users`(`Email`, `Password`) VALUES  ('" + email + "','" + password + "')";
            basicExecute(query);
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
     
     
     
     public void addProduct(String name, String description ,String  brand ,int price ,int discount ,int type, String img1,String img2,String img3,String img4) {
        String query="INSERT INTO `products`(`name`, `description`, `brand`, `price`, `discount`, `type`, `availability`, `img01`, `img02`, `img03`, `img04`) VALUES ('"+name+"','"+description+"','"+brand+"',"+price+","+discount+","+type+",1,'"+img1+"','"+img2+"','"+img3+"','"+img4+"')";
        basicExecute(query);
    }
     
     public void addSizes(int size, int pid) {
            String query="INSERT INTO `sizes`(`pid`,`size`) VALUES ("+pid+","+size+")";
            basicExecute(query);
    }
     
    public void addColors(int pid,String ccode ) {
            String query="INSERT INTO `colors`(`pid`, `ccode`) VALUES ('"+pid+"','"+ccode+"')";
            basicExecute(query);
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
   
      public ArrayList<Product> getAllProducts() {
          connectToDb();
            String Query ="SELECT * FROM `products`";
            ArrayList<Product> pl = new ArrayList<>();
            
            try {
                ResultSet rs= st.executeQuery(Query);
                while(rs.next()){
                    Product p = new Product(rs.getInt("id"),rs.getString("name"),rs.getString("description"),rs.getString("brand"),rs.getInt("price"),rs.getInt("discount"),rs.getInt("type"),rs.getInt("availability"),rs.getString("img01"),rs.getString("img02"),rs.getString("img03"),rs.getString("img04"));
                    pl.add(p);
                }
                st.close();
            } catch (SQLException ex) {
                Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
            }
            return pl;
    }
      
      public void deleteProduct(String id){
          String query ="DELETE FROM `products` WHERE id="+id+";";
          basicExecute(query);
      }
      
      public Product getProduct(String id){
          connectToDb();
          String query ="SELECT * FROM `products` WHERE Id="+id+";";
          try {
                ResultSet rs= st.executeQuery(query);
                if (rs.next()) {
                    Product product = new Product(rs.getInt("id"),rs.getString("name"),rs.getString("description"),rs.getString("brand"),rs.getInt("price"),rs.getInt("discount"),rs.getInt("type"),rs.getInt("availability"),rs.getString("img01"),rs.getString("img02"),rs.getString("img03"),rs.getString("img04"));
                    ResultSet srs= st.executeQuery("SELECT * FROM `sizes` WHERE pid="+id+";");
                    
                    ArrayList<Size> sizes = new ArrayList<>();
                    while(srs.next()){
                        sizes.add(new Size(srs.getString("sid"),srs.getString("pid"),srs.getString("size")));
                    }
                    product.setSizes(sizes);
                    ResultSet crs= st.executeQuery("SELECT * FROM `sizes` WHERE pid="+id+";");
                    ArrayList<Color> colors = new ArrayList<>();
                    while(crs.next()){
                        colors.add(new Color(crs.getString("cid"),crs.getString("pid"),crs.getString("ccode")));
                    }
                  product.setColors(colors);
//                    return new Product(rs.getInt("id"),rs.getString("name"),rs.getString("description"),rs.getString("brand"),rs.getInt("price"),rs.getInt("discount"),rs.getInt("type"),rs.getInt("availability"),rs.getString("img01"),rs.getString("img02"),rs.getString("img03"),rs.getString("img04"),colors,sizes);
                    return product;
                }
                
                
            } catch (SQLException ex) {
                Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
            }
        return null;
      }

    
    
    
}