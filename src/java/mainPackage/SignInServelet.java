package mainPackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SignInServlet", urlPatterns = {"/SignInServlet"})
public class SignInServelet extends HttpServlet {
    
    
 // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        
    }


    @Override
   
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    
      //response.setContentType("text/html");
        /*PrintWriter out = response.getWriter();

        // Retrieve email and password from the request
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String driver = "com.mysql.cj.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/ecommerce";
        String query = "SELECT * FROM credentials WHERE email = ? AND password = ?";

        try {
            Class.forName(driver);
            try (Connection con = DriverManager.getConnection(url, "root", "");
                 PreparedStatement pstmt = con.prepareStatement(query)) {

                pstmt.setString(1, email);
                pstmt.setString(2, password);

                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        // Redirect to home.jsp if email and password are correct
                        response.sendRedirect("home.jsp");
                    } else {
                        // Handle incorrect email/password combination
                        response.sendRedirect("login.jsp?error=Incorrect email or password");
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            // Handle exceptions appropriately
            response.sendRedirect("login.jsp?error=An error occurred while processing your request");
        }*/
        
        HttpSession session = request.getSession(true);
        String email= request.getParameter("email");
        String password= request.getParameter("password");
        System.out.println("uname-"+email+"  passwd-"+password);
        PrintWriter out=response.getWriter();
        out.println("abc");
        
        DatabaseLogIn db1= new DatabaseLogIn();
        db1.checkData(email, password);
        out.print(db1.islogin());
        if(db1.islogin()){
            System.out.println("login Succsessful and rederect to the dash board");
            
            session.setAttribute("email", email);
        
            request.getRequestDispatcher("user.jsp").forward(request, response); 
        }
        else{
            response.sendRedirect("sign-in.jsp");
            System.out.println("login faild and rederect to the dash board");
        }
        
}

}
