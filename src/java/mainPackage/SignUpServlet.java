
package mainPackage;

import com.sun.xml.wss.impl.PolicyTypeUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "SignUpServlet", urlPatterns = {"/SignUpServlet"})
public class SignUpServlet extends HttpServlet {

  

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        out.println("Welcome to the SignUp ");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        
     String driver="com.mysql.cj.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/ecommerce";
       
        String query = "INSERT INTO users (username, email) VALUES ('" + username + "', '" + email + "')";


        try {
            Class.forName(driver);
            Connection con = DriverManager.getConnection(url, "root", ""); 
            Statement st =con.createStatement();
           st.executeUpdate(query);
        } catch (ClassNotFoundException | SQLException ex) {
            
        }
    }

}
