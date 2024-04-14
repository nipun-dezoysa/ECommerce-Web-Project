package mainPackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class wishlist {
  
  // Retrieve all items from wishlist table
  public static List<WishlistItem> getAllItems() {
    List<WishlistItem> wishlistItems = new ArrayList<>();

    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/shoetopia";
    String query = "SELECT * FROM wishlist";

    try {
      Class.forName(driver);
      try (Connection con = DriverManager.getConnection(url, "root", "");
         PreparedStatement pst = con.prepareStatement(query);
         ResultSet rs = pst.executeQuery()) {

        while (rs.next()) {
          int id = rs.getInt("id");
          String name = rs.getString("name");
          int price = rs.getInt("price");
          String img = rs.getString("img01");

          WishlistItem item = new WishlistItem(id, name, price, img);
          wishlistItems.add(item);
        }
      }
    } catch (ClassNotFoundException | SQLException ex) {
      Logger.getLogger(wishlist.class.getName()).log(Level.SEVERE, null, ex);
    }

    return wishlistItems;
  }

  // Remove item from wishlist
  public static void removeItem(int id) {
    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/shoetopia";
    String query = "DELETE FROM wishlist WHERE id = ?";

    try {
      Class.forName(driver);
      try (Connection con = DriverManager.getConnection(url, "root", "");
         PreparedStatement pst = con.prepareStatement(query)) {
        pst.setInt(1, id);
        pst.executeUpdate();
      }
    } catch (ClassNotFoundException | SQLException ex) {
      Logger.getLogger(wishlist.class.getName()).log(Level.SEVERE, null, ex);
    }
  }
}
