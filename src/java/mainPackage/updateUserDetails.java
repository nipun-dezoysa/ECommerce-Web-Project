/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mainPackage;

import java.io.IOException;
import java.io.PrintWriter;
import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.User;

/**
 *
 * @author sanjeewa
 */
@WebServlet(name = "updateUserDetails", urlPatterns = {"/updateUserDetails"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,  // 1 MB
    maxFileSize = 1024 * 1024 * 10,   // 10 MB
    maxRequestSize = 1024 * 1024 * 50 // 50 MB
)
public class updateUserDetails extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        int id = user.getId();
        String fname=request.getParameter("fname");
        String lname=request.getParameter("lname");
        String bday=request.getParameter("bday");
        String tno=request.getParameter("tno");
        DatabaseLogIn db= new DatabaseLogIn();
        db.updateUser(id, fname, lname, bday, tno);
        db.closeDb();
        response.getWriter().print("ok");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
