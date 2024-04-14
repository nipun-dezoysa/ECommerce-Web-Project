
package mainPackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class wishlist {
 // Insert data into wishlist table
    public static void insertWishlist(String id, String name, String price, String img) {
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/login";
        String query = "INSERT INTO `wishlist`(`id`, `name`, `price`, `img`) VALUES (?, ?, ?, ?)";

        try {
            Class.forName(driver);
            try (Connection con = DriverManager.getConnection(url, "root", "");
                 PreparedStatement pst = con.prepareStatement(query)) {
                pst.setString(1, id);
                pst.setString(2, name);
                pst.setString(3, price);
                pst.setString(4, img);
                pst.executeUpdate();
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(wishlist.class.getName()).log(Level.SEVERE, null, ex);
        }
    
    }
    
    // Retrieve all product from to wishlist table
    public static List<wishlist> getAllWishlist() {
        List<wishlist> wishList = new ArrayList<>();

        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/login";
        String query = "SELECT * FROM wishlist";

        try {
            Class.forName(driver);
            try (Connection con = DriverManager.getConnection(url, "root", "");
                 PreparedStatement pst = con.prepareStatement(query);
                 ResultSet rs = pst.executeQuery()) {

                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    String price = rs.getString("price");
                    String img = rs.getString("img");

                    wishlist wishlist = new wishlist(id, name, price, img);
                    wishList.add(wishlist);
                }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(wishlist.class.getName()).log(Level.SEVERE, null, ex);
        }

        return wishList;
    }

    // Remove data from wishlist table
    public static void removeWishlist(String id, String name, String price, String img) {
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/login";
        String query = "DELETE FROM wishlist WHERE id = ? AND name = ? AND price = ? AND img = ?";

        try {
            Class.forName(driver);
            try (Connection con = DriverManager.getConnection(url, "root", "");
                 PreparedStatement pst = con.prepareStatement(query)) {
                pst.setString(1, id);
                pst.setString(2, name);
                pst.setString(3, price);
                pst.setString(4, img);
                pst.executeUpdate();
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(wishlist.class.getName()).log(Level.SEVERE, null, ex);
        }
    }    


}