import mainPackage.WishlistItem;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class wishlist {
    private String jdbcURL = "jdbc:mysql://localhost:3306/shouetopia";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";
    
    private static final String SELECT_ALL_ITEMS = "SELECT * FROM wishlist";

    protected Connection getConnection() throws SQLException {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
    
    public List<WishlistItem> getAllItems() {
        List<WishlistItem> items = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ITEMS)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                // Assuming WishlistItem is a class representing a single item in the wishlist
                WishlistItem item = new WishlistItem();
                // Populate item fields from resultSet
                item.setId(resultSet.getInt("id"));
                item.setName(resultSet.getString("name"));
                item.setPrice(resultSet.getInt("price"));
                item.setImg(resultSet.getString("img"));
                
                items.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return items;
    }
}
