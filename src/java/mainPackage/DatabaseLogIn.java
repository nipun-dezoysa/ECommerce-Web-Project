package mainPackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.*;

public class DatabaseLogIn {
boolean adminlogin;
static Statement st;

//public static void main(String args[])  //static method  
//{  
//    getOrder(15);
//}
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
    } catch (SQLException ex) {
        Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
    }
}

    
    
    public int signUp(String email, String password ) {
        connectToDb();
    try {
        ResultSet rs = st.executeQuery("SELECT * FROM `users` WHERE Email = '" + email + "'");
        if(!rs.next()){
            basicExecute("INSERT INTO `users`(`Email`, `Password` , `status`) VALUES  ('" + email + "','" + password + "', 1)");
            return 1;
        }
    } catch (SQLException ex) {
        Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
    }
      return -1;
    }
    
    
    
    public User signIn(String email, String password) {
            connectToDb();
            String Query ="SELECT * FROM `users` WHERE Email = '" + email + "'";
            User user = new User(-1,"null");
            try {
                String passwordc;
                ResultSet resultSet= st.executeQuery(Query);
                if (resultSet.next()) {
                    passwordc = resultSet.getString("Password");
                    if(password.equals(passwordc)){
                        user = new User(resultSet.getInt("Id"),email) ;
                    } 
                    resultSet.close();
                }
                st.close();
            
            } catch (SQLException ex) {
                Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
            }
            return user;
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
     
    public void productDetails(String pid, String name, String description ,String  brand ,String price ,String discount ,String type) {
        basicExecute("UPDATE products SET name='"+name+"' , description='"+description+"' , brand='"+brand+"' , price="+price+" , discount="+discount+" , type="+type+"  WHERE id="+pid);
    }
     
     public void addSizes(int size, int pid) {
            String query="INSERT INTO `sizes`(`pid`,`size`) VALUES ("+pid+","+size+")";
            basicExecute(query);
    }
    public void removeSize(String id){
          basicExecute("DELETE FROM `sizes` WHERE sid="+id+";");
    }
     
    public void addColors(int pid, String ccode ) {
            String query="INSERT INTO `colors`(`pid`, `ccode`) VALUES ('"+pid+"','"+ccode+"')";
            basicExecute(query);
    }
    public void removeColor(String id){
          basicExecute("DELETE FROM `colors` WHERE cid="+id+";");
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
   
    public ArrayList<Product> getAllProducts(String where) {
            connectToDb();
            String Query ="SELECT * FROM `products` "+where;
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
                    
                    ResultSet crs= st.executeQuery("SELECT * FROM `colors` WHERE pid="+id+";");
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
      
      public void changeImg(String pid,String choice,String img){
          basicExecute("UPDATE products SET "+choice+"= '"+img+"' WHERE id="+pid);
      }
      
      public String[] getColorSize(int c , int s){
          String[] result = new String[2];
          connectToDb();
          try {
              ResultSet crs = st.executeQuery("SELECT * FROM colors WHERE cid="+c);
              if(crs.next()){
                  result[0] = crs.getString("ccode");
              }else{
                  result[0] = "demo";
              }
              
              ResultSet srs = st.executeQuery("SELECT *FROM sizes WHERE sid="+s);
              if(srs.next()){
                  result[1] = srs.getString("size");
              }else{
                  result[1] = "demo";
              }
            } catch (SQLException ex) {
                Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
            }
          
          return result;
      }
    
    public boolean addOrder(int uid,String name,String email,String phone,String address,String note, ArrayList<CartItem> items){
        Date date = new Date();
        Timestamp time = new Timestamp(date.getTime());
        basicExecute("INSERT INTO orders (uid, name, email, phone, address, note, status, date) VALUES ("+uid+", '"+name+"', '"+email+"', '"+phone+"', '"+address+"', '"+note+"', 1, '"+time+"')");
        
        try {
               ResultSet rs = st.executeQuery("SELECT * FROM orders WHERE uid="+uid+" ORDER BY oid DESC");
               rs.next();
               int oid = rs.getInt("oid");
                for(int i=0;i<items.size();i++){
                    Product pr = getProduct(items.get(i).getId()+"");
                    String[] gg = getColorSize(items.get(i).getColor(),items.get(i).getSize());
                    System.out.print(gg[0]+" "+gg[1]);
                    basicExecute("INSERT INTO items (oid, pid, name, size, color, price, discount, quantity) VALUES ("+oid+", "+pr.getId()+", '"+pr.getName()+"', "+gg[1]+" ,'"+gg[0]+"', "+pr.getPrice()+", "+pr.getDiscount()+", "+items.get(i).getQuantity()+")");
            
                 }
               return true; 
            } catch (SQLException ex) {
                Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
            }
        
        return false;
    }
    
    public void addAddress(int uid,String fname,String lname,String email,String phone,String address,String town, String province){
        basicExecute("INSERT INTO abook (uid,fname,lname,email,phone,address,town,province) VALUES ("+uid+", '"+fname+"','"+lname+"','"+email+"','"+phone+"','"+address+"','"+town+"','"+province+"')");
    }
    
    
 public Order getOrder(int id){
        connectToDb();
        try{
            ResultSet rs = st.executeQuery("SELECT * FROM orders WHERE oid="+id+";");
            
            if(rs.next()){
                Order order = new Order(id,rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getInt(8),rs.getString(9));
                if(rs.getInt(2)!=0){
                    int uid = rs.getInt(2);
                    ResultSet us = st.executeQuery("SELECT * FROM users WHERE Id="+rs.getInt(2));
                    us.next();
                    order.setUser(new User(uid,us.getString(2)));
                }
                ResultSet im = st.executeQuery("SELECT * FROM items WHERE oid="+id+";");
                ArrayList<OrderItem> items = new ArrayList<OrderItem>();
                while(im.next()){
                    System.out.print("yoo");
                    String img = "demo.jpg";
                    OrderItem it = new OrderItem(im.getInt(1),im.getInt(3),im.getString(4),im.getString(5),im.getString(6),im.getInt(7),im.getInt(8),im.getInt(9));
//                    if(im.getInt(3)!=0){
//                        ResultSet pr = st.executeQuery("SELECT * FROM products WHERE Id="+im.getInt(3));
//                        pr.next();
//                        img = pr.getString(2);
//                        it.setImg(img);
//                    }
                    items.add(it);
                }
                order.setItems(items);
                return order;
            }
        }catch (SQLException ex) {
                Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
 public ArrayList<Order> getOrders(int type,String uid){
        connectToDb();
        String query;
        if(type==0){
            query = "SELECT * FROM orders WHERE uid="+uid+" ORDER BY oid DESC";
        }else if(type==6){
            query = "SELECT * FROM orders ORDER BY oid DESC";
        }
        else{
            query = "SELECT * FROM orders WHERE status="+type+" ORDER BY oid DESC";
        }
        try{
            ResultSet rs = st.executeQuery(query);
            ArrayList<Order> orders = new ArrayList<Order>();
            while(rs.next()){
                Order o = getOrder(rs.getInt(1));
                if(o!=null) orders.add(o);
            }
            return orders;
            
        }catch (SQLException ex) {
                Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
 
 public void changeStatus(int st,int id){
     basicExecute("UPDATE orders SET status="+st+" WHERE oid="+id);
 }
 

 public void updateUser(int id,String fname,String lname,String bday,String tno){
     basicExecute("UPDATE `users` SET `first_name`='"+fname+"',`last_name`='"+lname+"',`birth_date`='"+bday+"',`phone_No`='"+tno+"' WHERE Id ="+id+"");
 }
 
 public void updateEmail(int id,String email){
     basicExecute("UPDATE `users` SET `email`='"+email+"' WHERE Id ="+id+"");
 }
 
 public void updatePasswd(int id,String Password){
     basicExecute("UPDATE `users` SET `PASSWORD`='"+Password+"' WHERE Id ="+id+"");
 }
 
   public String getPasswd(int id) {
          connectToDb();
            String Query ="SELECT PASSWORD FROM `users` WHERE Id="+id+"";
            String passworddb = null;
            try {
                ResultSet resultSet= st.executeQuery(Query);
                if (resultSet.next()) {
                passworddb=resultSet.getString("Password");
                }
                st.close();
            } catch (SQLException ex) {
                Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
            }
            return passworddb;
    }
      

 public boolean isExistWishlist(int uid,int pid){
     connectToDb();
     try{
         ResultSet rs = st.executeQuery("SELECT * FROM wishlist WHERE uid="+uid+" AND pid="+pid);
         if(rs.next()){
             return true;
         }
     }catch(SQLException ex){
        Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
     }
     return false;
 }
 
 public void addWishlist(int uid,int pid){
      basicExecute("INSERT INTO wishlist (uid,pid) VALUES ("+uid+","+pid+")");
 }
 
 public void removeWishlist(int uid,int pid){
      basicExecute("DELETE FROM wishlist WHERE uid="+uid+" AND pid="+pid);
 }
 
 public ArrayList<Product> getWishlist(int uid){
     connectToDb();
     ArrayList<Product> products = new ArrayList<>();
     try{
         ResultSet rs = st.executeQuery("SELECT * FROM wishlist WHERE uid="+uid);
         
         while(rs.next()){
             products.add(getProduct(rs.getString(3)));
         }
     }catch(SQLException ex){
        Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
     }
     return products;
 }

 

 //Retrive DATA USING BRAND
 public ArrayList<Product> ProductsByBrand(String brand){
     connectToDb();
     ArrayList<Product> products = new ArrayList<>();
     try{
         ResultSet rs = st.executeQuery("SELECT * FROM products WHERE brand='"+brand+"'");
         
         while(rs.next()){
             products.add(getProduct(rs.getString(1)));
         }
     }catch(SQLException ex){
        Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
     }
     return products;
 }
 
 public User getUser(String id){
     connectToDb();
     try{
         ResultSet rs = st.executeQuery("SELECT * FROM users WHERE Id="+id);
         if(rs.next()){
             
         }
     }catch(SQLException ex){
        Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
     }
     return null;
 }
 
 public ArrayList<User> getAllUsers(){
     connectToDb();
     ArrayList<User> users = new ArrayList<>();
     try{
         ResultSet rs = st.executeQuery("SELECT * FROM users");
         while(rs.next()){
            users.add(new User(rs.getInt(1),rs.getString(2),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getTimestamp(8),rs.getTimestamp(9),rs.getInt(10)));
            
         }
        for(User user: users){
            ResultSet ol = st.executeQuery("SELECT COUNT(*) FROM orders WHERE uid="+rs.getInt(1));
            ol.next();
            user.setOcount(ol.getInt(1));
        }
         
     }catch(SQLException ex){
        Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
     }
     return users;
 }

}