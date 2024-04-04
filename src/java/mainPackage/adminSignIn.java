/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mainPackage;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nipun
 */
@WebServlet(name = "adminSignIn", urlPatterns = {"/adminSignIn"})
public class adminSignIn extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        
        HttpSession session = request.getSession(true);
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        DatabaseLogIn db3 = new DatabaseLogIn();
        
        if(email!=null && password!=null){
            //database functions
            db3.adminSignIn(email, password);
            if(db3.adminislogin()){
                session.setAttribute("admin", email);
                out.println("admin "+ email +"succesessfully loged in ");
                response.sendRedirect("http://localhost:8080/ECommerce_Web_Project/admin/");
                
            
            
            }
            else{
                response.sendRedirect("http://localhost:8080/ECommerce_Web_Project/admin/index.jsp");
            }
            
        }
        
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
