/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loginandsignpackage;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author sanjeewa
 */
public class data {
    public static void main(String[] args) {
        // JDBC URL, username, and password of MySQL server
        String url = "jdbc:mysql://localhost:3306/login";
        String user = "root";
        String password = "";
        String name = "'abe'";
        String passwd="'kamal";

        // SQL query to insert data into the table
        String query = "INSERT INTO `std`(`uname`, `passwd`) VALUES ('" + name + "','" + passwd + "')";

        try {
            // Establishing a connection to the database
            Connection connection = DriverManager.getConnection(url, user, password);

            // Creating a prepared statement
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            // String containing double quotes
            String data = "This is a \"test\"";

            // Setting the value for the prepared statement
            preparedStatement.setString(1, data);

            // Executing the query
            preparedStatement.executeUpdate();

            // Closing the resources
            preparedStatement.close();
            connection.close();

            System.out.println("Data inserted successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
}
