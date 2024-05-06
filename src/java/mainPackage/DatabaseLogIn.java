package mainPackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.*;

public class DatabaseLogIn {
boolean adminlogin;
Connection con;
    public DatabaseLogIn() {
        connectToDb();
    }



void connectToDb(){
        String driver ="com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/shoetopia";
        
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url,"root",""); 
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
        }
}

public void closeDb() {
        if (con != null) {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

void basicExecute(String query){
    try (Statement stt = con.createStatement()) {
            stt.executeUpdate(query);
    } catch (SQLException ex) {
        Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
    }
}

    
    
    public int signUp(String email, String password ) {
    try(Statement st = con.createStatement();ResultSet rs = st.executeQuery("SELECT * FROM `users` WHERE Email = '" + email + "'")) {
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
            String Query ="SELECT * FROM `users` WHERE Email = '" + email + "'";
            User user = new User(-1,"null");
            try(Statement st = con.createStatement();ResultSet resultSet = st.executeQuery(Query)) {
                String passwordc;
                
                if (resultSet.next()) {
                    passwordc = resultSet.getString("Password");
                    if(resultSet.getInt(10)==0){
                        user = new User(-2,"null");
                    }
                    else if(password.equals(passwordc)){
                        user = new User(resultSet.getInt("Id"),email) ;
                        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
                        basicExecute("UPDATE users SET login='"+timestamp+"' WHERE Id="+resultSet.getInt("Id"));
                    } 
                    resultSet.close();
                }
            
            } catch (SQLException ex) {
                Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
            }
            return user;
    }
    
    public boolean deleteUser(String id,String password){
        User user = signIn(id,password);
        if(user.getId()==-1){
            return false;
        }else{
            basicExecute("DELETE FROM users WHERE Email='"+id+"'");
            return true;
        }
    }
    
    public boolean adminSignIn(String email, String password) {
            String Query ="SELECT `Id`, `Email`, `Password` FROM `admin` WHERE Email = '" + email + "'";
            try(Statement st = con.createStatement();ResultSet resultSet = st.executeQuery(Query)) {
               
                if (resultSet.next()) {
                    if(password.equals(resultSet.getString("Password"))){
                        return true;
                        
                    } 
                
                }          
            
            } catch (SQLException ex) {
                Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
            }
        return false;    
    }
     
    public int addProduct(String name, String description ,String  brand ,int price ,int discount ,int type, String img1,String img2,String img3,String img4) {
        String query="INSERT INTO `products`(`name`, `description`, `brand`, `price`, `discount`, `type`, `availability`, `img01`, `img02`, `img03`, `img04`) VALUES ('"+Tools.convertToSQL(name)+"','"+Tools.convertToSQL(description)+"','"+brand+"',"+price+","+discount+","+type+",1,'"+img1+"','"+img2+"','"+img3+"','"+img4+"')";
        basicExecute(query);
        String Query ="SELECT `Id` FROM `products` WHERE name = '"+name+"' ORDER BY Id DESC";
            int pid=-1;
            try(Statement st = con.createStatement();ResultSet resultSet = st.executeQuery(Query)) {
                
                if (resultSet.next()) {
                pid=resultSet.getInt("id");
                }
            } catch (SQLException ex) {
                Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
            }
            return pid;
    }
     
    public void productDetails(String pid, String name, String description ,String  brand ,String price ,String discount ,String type) {
        basicExecute("UPDATE products SET name='"+name+"' , description='"+Tools.convertToSQL(description)+"' , brand='"+brand+"' , price="+price+" , discount="+discount+" , type="+type+"  WHERE id="+pid);
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
   
    public ArrayList<Product> getAllProducts(String where) {
            String Query ="SELECT * FROM `products` "+where;
            ArrayList<Product> pl = new ArrayList<>();
            
            try (Statement st = con.createStatement();ResultSet rs = st.executeQuery(Query)) {
                while(rs.next()){
//                    Product p = new Product(rs.getInt("id"),rs.getString("name"),Tools.reversToText(rs.getString("description")),rs.getString("brand"),rs.getInt("price"),rs.getInt("discount"),rs.getInt("type"),rs.getInt("availability"),rs.getString("img01"),rs.getString("img02"),rs.getString("img03"),rs.getString("img04"));
                    pl.add(getProduct(rs.getString("id")));
                }
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
          String query ="SELECT * FROM `products` WHERE Id="+id+";";
          try (Statement st = con.createStatement()){
                ResultSet rs= st.executeQuery(query);
                if (rs.next()) {
                    Product product = new Product(rs.getInt("id"),Tools.reversToText(rs.getString("name")),Tools.reversToText(rs.getString("description")),rs.getString("brand"),rs.getInt("price"),rs.getInt("discount"),rs.getInt("type"),rs.getInt("availability"),rs.getString("img01"),rs.getString("img02"),rs.getString("img03"),rs.getString("img04"));
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
          try(Statement st = con.createStatement()) {
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
        
        try (Statement st = con.createStatement()){
               ResultSet rs = st.executeQuery("SELECT * FROM orders WHERE uid="+uid+" ORDER BY oid DESC");
               rs.next();
               int oid = rs.getInt("oid");
                basicExecute("INSERT INTO activity (oid, status) VALUES ("+oid+",1)");
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
        try(Statement st = con.createStatement()){
            ResultSet rs = st.executeQuery("SELECT * FROM orders WHERE oid="+id+";");
            
            if(rs.next()){
                Order order = new Order(id,rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getInt(8),rs.getTimestamp(9));
                if(rs.getInt(2)!=0){
                    order.setUser(getUser(rs.getString(2)));
                }
                ResultSet im = st.executeQuery("SELECT * FROM items WHERE oid="+id+";");
                ArrayList<OrderItem> items = new ArrayList<OrderItem>();
                while(im.next()){
                    OrderItem it = new OrderItem(im.getInt(1),im.getInt(3),im.getString(4),im.getString(5),im.getString(6),im.getInt(7),im.getInt(8),im.getInt(9));
                    items.add(it);
                }
                order.setItems(items);
                
                ResultSet ac = st.executeQuery("SELECT * FROM activity WHERE oid="+id+";");
                ArrayList<Activity> activity = new ArrayList<>();
                while(ac.next()){
                    activity.add(new Activity(ac.getInt(1),ac.getInt(2),ac.getInt(3),ac.getTimestamp(4)));
                }
                order.setActivity(activity);
                return order;
            }
        }catch (SQLException ex) {
                Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
 public ArrayList<Order> getOrders(int type,String uid){
        String query;
        if(type==0){
            query = "SELECT * FROM orders WHERE uid="+uid+" ORDER BY oid DESC";
        }else if(type==8){
            query = "SELECT * FROM orders ORDER BY oid DESC";
        }else if(type==9){
            query = "SELECT * FROM orders ORDER BY oid DESC LIMIT 6";
        }
        else{
            query = "SELECT a.oid FROM activity a JOIN ( SELECT oid, MAX(date) AS latest_date, MAX(id) AS latest_id FROM activity GROUP BY oid ) latest_activity ON a.oid = latest_activity.oid AND a.date = latest_activity.latest_date AND a.id = latest_activity.latest_id WHERE status="+type+" ORDER BY oid DESC";
        }
        try(Statement st = con.createStatement()){
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
     basicExecute("INSERT INTO activity (oid, status) VALUES ("+id+","+st+")");
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
            String Query ="SELECT PASSWORD FROM `users` WHERE Id="+id+"";
            String passworddb = null;
            try (Statement st = con.createStatement()){
                ResultSet resultSet= st.executeQuery(Query);
                if (resultSet.next()) {
                passworddb=resultSet.getString("Password");
                }
            } catch (SQLException ex) {
                Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
            }
            return passworddb;
    }
      

 public boolean isExistWishlist(int uid,int pid){
     try(Statement st = con.createStatement()){
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
     ArrayList<Product> products = new ArrayList<>();
     try(Statement st = con.createStatement()){
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
     ArrayList<Product> products = new ArrayList<>();
     try(Statement st = con.createStatement()){
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
     try(Statement st = con.createStatement()){
         ResultSet rs = st.executeQuery("SELECT * FROM users WHERE Id="+id);
         if(rs.next()){
             return new User(rs.getInt(1),rs.getString(2),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getTimestamp(8),rs.getTimestamp(9),rs.getInt(10));
         }
     }catch(SQLException ex){
        Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
     }
     return null;
 }
 
 public ArrayList<User> getAllUsers(int a){
     String query = "SELECT * FROM users";
     if(a!=2){
         query = "SELECT * FROM users WHERE status="+a;
     }
     ArrayList<User> users = new ArrayList<>();
     try(Statement st = con.createStatement()){
         ResultSet rs = st.executeQuery(query);
         while(rs.next()){
            users.add(new User(rs.getInt(1),rs.getString(2),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getTimestamp(8),rs.getTimestamp(9),rs.getInt(10)));
            
         }
        for(User user: users){
            ResultSet ol = st.executeQuery("SELECT COUNT(*) FROM orders WHERE uid="+user.getId());
            ol.next();
            user.setOcount(ol.getInt(1));
        }
         
     }catch(SQLException ex){
        Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
     }
     return users;
 }
 
 public void changeUserStatus(String id){
     try(Statement st = con.createStatement()){
         ResultSet rs = st.executeQuery("SELECT * FROM users WHERE Id="+id);
         if(rs.next()){
            if(rs.getInt(10)==1){
              basicExecute("UPDATE `users` SET `status`=0 WHERE Id ="+id);
            }else{
              basicExecute("UPDATE `users` SET `status`=1 WHERE Id ="+id);  
            }
         }
         
     }catch(SQLException ex){
        Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
     }
 }
 
 public ArrayList<Address> getAddresses(String id){
     ArrayList<Address> addr = new ArrayList<>();
     try(Statement st = con.createStatement()){
         ResultSet rs = st.executeQuery("SELECT * FROM abook WHERE uid="+id);
         while(rs.next()){
             addr.add(new Address(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9)));
         }
         
     }catch(SQLException ex){
        Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
     }
     return addr;
 }
 
 public void addview(int uid,int pid){
     try(Statement st = con.createStatement()){
         ResultSet rs = st.executeQuery("SELECT * FROM viewcount WHERE uid="+uid+" AND pid="+pid);
         if(rs.next()){
             basicExecute("UPDATE viewcount SET count="+(rs.getInt(4)+1)+" WHERE vid="+rs.getInt(1));
         }else{
             basicExecute("INSERT INTO viewcount (uid,pid,count) VALUES ("+uid+", "+pid+", 1)");
         }
         
     }catch(SQLException ex){
        Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
     }
 }
 
 public ArrayList<Product> getUserViewed(String uid){
     ArrayList<Product> list = new ArrayList<>();
     try(Statement st = con.createStatement()){
         ResultSet rs = st.executeQuery("SELECT * FROM viewcount WHERE uid="+uid+" LIMIT 3");
         int i =0;
         while(rs.next()){
            list.add(getProduct(rs.getString(3)));
            list.get(i).setViewCount(rs.getInt(4));
            i++;
         }
         
     }catch(SQLException ex){
        Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
     }
     return list;
 }
 
 public String[] getAllCounts(){
    String[] counts = {"000","000","000"};
    try(Statement st = con.createStatement()){
        ResultSet rs = st.executeQuery("SELECT (SELECT COUNT(*) FROM orders), (SELECT COUNT(*) FROM products), (SELECT COUNT(*) FROM users);");
        rs.next();
        counts[0] = Tools.digitFormat(rs.getInt(1));
        counts[1] = Tools.digitFormat(rs.getInt(2));
        counts[2] = Tools.digitFormat(rs.getInt(3));
         
     }catch(SQLException ex){
        Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
     }
    return counts;
 }
 
 public double[] getOrdersCategoryCount(){
    double[] counts = {0.0,0.0,0.0,0.0,0.0,0.0,0.0};
    try(Statement st = con.createStatement()){
        ResultSet rs = st.executeQuery("WITH last_records AS (SELECT a.* FROM activity a JOIN (SELECT oid, MAX(date) AS latest_date, MAX(id) AS latest_id FROM activity GROUP BY oid ) latest ON a.oid = latest.oid AND a.date = latest.latest_date AND a.id = latest.latest_id) SELECT COUNT(CASE WHEN status = 1 THEN 1 END) AS status_1,COUNT(CASE WHEN status = 2 THEN 1 END) AS status_2, COUNT(CASE WHEN status = 3 THEN 1 END) AS status_3,COUNT(CASE WHEN status = 4 THEN 1 END) AS status_4,COUNT(CASE WHEN status = 5 THEN 1 END) AS status_5,COUNT(CASE WHEN status = 6 THEN 1 END) AS status_6,COUNT(CASE WHEN status = 7 THEN 1 END) AS status_7,COUNT(*) AS total FROM last_records;");
        rs.next();
        for(int i=0;i<counts.length;i++){
            counts[i] = Tools.percentValue(rs.getInt(i+1), rs.getInt(8));
        }
         
     }catch(SQLException ex){
        Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
     }
    return counts;
 }
 
 public ArrayList<Product> getHighestSold(){
     ArrayList<Product> pr = new ArrayList<>();
     try(Statement st = con.createStatement()){
        ResultSet rs = st.executeQuery("WITH last_order_status AS (SELECT a.oid, a.date, a.status FROM activity a JOIN (SELECT oid, MAX(date) AS latest_date, MAX(id) AS latest_id FROM activity GROUP BY oid) latest ON a.oid = latest.oid AND a.date = latest.latest_date AND a.id = latest.latest_id) SELECT i.pid, SUM(i.quantity) AS total FROM items i JOIN last_order_status los ON i.oid = los.oid WHERE los.status = 4 AND i.pid!='null' GROUP BY i.pid ORDER BY total DESC LIMIT 3;");
        int i=0;
        while(rs.next()){
            pr.add(getProduct(rs.getString(1)));
            pr.get(i).setSoldCount(rs.getInt(2));
            i++;
        }
         
     }catch(SQLException ex){
        Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
     }
     return pr;
 }
 
  public ArrayList<Product> getHighestViewed(){
     ArrayList<Product> pr = new ArrayList<>();
     try(Statement st = con.createStatement()){
        ResultSet rs = st.executeQuery("SELECT pid,SUM(count) as counts FROM `viewcount` GROUP BY pid ORDER BY counts DESC LIMIT 3;");
        int i=0;
        while(rs.next()){
            pr.add(getProduct(rs.getString(1)));
            pr.get(i).setViewCount(rs.getInt(2));
            i++;
        }
         
     }catch(SQLException ex){
        Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
     }
     return pr;
 }
  
  
  public String getWeekOrders(int a){
      ArrayList<Integer> week = new ArrayList<>();
      try(Statement st = con.createStatement()){
        ResultSet rs = st.executeQuery("SELECT COUNT(CASE WHEN status = "+a+" AND DATE(date) = CURRENT_DATE - INTERVAL 6 DAY THEN 1 END),COUNT(CASE WHEN status = "+a+" AND DATE(date) = CURRENT_DATE - INTERVAL 5 DAY THEN 1 END),COUNT(CASE WHEN status = "+a+" AND DATE(date) = CURRENT_DATE - INTERVAL 4 DAY THEN 1 END),COUNT(CASE WHEN status = "+a+" AND DATE(date) = CURRENT_DATE - INTERVAL 3 DAY THEN 1 END),COUNT(CASE WHEN status = "+a+" AND DATE(date) = CURRENT_DATE - INTERVAL 2 DAY THEN 1 END),COUNT(CASE WHEN status = "+a+" AND DATE(date) = CURRENT_DATE - INTERVAL 1 DAY THEN 1 END),COUNT(CASE WHEN status = "+a+" AND DATE(date) = CURRENT_DATE THEN 1 END) FROM activity WHERE date >= CURRENT_DATE - INTERVAL 7 DAY;");
        rs.next();
        for(int i=1;i<=7;i++){
           week.add(rs.getInt(i));
        }
         
     }catch(SQLException ex){
        Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
     }
      return Tools.getStringVal(week);
  }
  
  public String getWeekSales(){
     double a=0;
     ArrayList<Order> orders = new ArrayList<>();
     try(Statement st = con.createStatement()){
        ResultSet rs = st.executeQuery("WITH last_order_status AS ( SELECT a.oid, a.date, a.status FROM activity a JOIN ( SELECT oid, MAX(date) AS latest_date, MAX(id) AS latest_id FROM activity WHERE date >= CURRENT_DATE - INTERVAL 7 DAY GROUP BY oid ) latest ON a.oid = latest.oid AND a.date = latest.latest_date AND a.id = latest.latest_id ) SELECT oid FROM last_order_status WHERE status = 4;");
        while(rs.next()){
            orders.add(getOrder(rs.getInt(1)));
        }
         
     }catch(SQLException ex){
        Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
     }
     for(Order order : orders){
         a+=order.calculateTotal();
     }
     DecimalFormat formatter = new DecimalFormat("#,###.00");
     return formatter.format(a);
  }
  
  public void removeAddress(String id){
      basicExecute("DELETE FROM abook WHERE aid="+id);
  }
 
  public ArrayList<String> getAllColors(){
      ArrayList<String> list = new ArrayList<>();
      try(Statement st = con.createStatement()){
        ResultSet rs = st.executeQuery("SELECT ccode FROM `colors` GROUP BY ccode;");
        while(rs.next()){
            list.add(rs.getString(1));
        }
         
     }catch(SQLException ex){
        Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
     }
     return list;
  }
  public ArrayList<String> getAllBrands(){
      ArrayList<String> list = new ArrayList<>();
      try(Statement st = con.createStatement()){
        ResultSet rs = st.executeQuery("SELECT brand FROM `products` GROUP BY brand;");
        while(rs.next()){
            list.add(rs.getString(1));
        }
         
     }catch(SQLException ex){
        Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
     }
     return list;
  }
  public ArrayList<String> getAllSizes(){
      ArrayList<String> list = new ArrayList<>();
      try(Statement st = con.createStatement()){
        ResultSet rs = st.executeQuery("SELECT size FROM `sizes` GROUP BY size;");
        while(rs.next()){
            list.add(rs.getString(1));
        }
         
     }catch(SQLException ex){
        Logger.getLogger(DatabaseLogIn.class.getName()).log(Level.SEVERE, null, ex);
     }
     return list;
  }
}