/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mainPackage;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.User;
import models.userUpdate;

/**
 *
 * @author sanjeewa
 */
@WebServlet(name = "updatePassword", urlPatterns = {"/updatePassword"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,  // 1 MB
    maxFileSize = 1024 * 1024 * 10,   // 10 MB
    maxRequestSize = 1024 * 1024 * 50 // 50 MB
)
public class updatePassword extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        int id = user.getId();
        String passwdold=request.getParameter("oldpassword");
        String passwdnew=request.getParameter("newpassword1");
        String passwdnew2=request.getParameter("newpassword2");
        userUpdate upwd = new userUpdate();
        if(upwd.updatePasswd(passwdold, passwdnew,passwdnew2, id)){
            session.removeAttribute("user");
            session.setAttribute("logreq", "./user/");
            response.getWriter().print("ok");
        }else{
            response.getWriter().print("bad");
        }
        
        
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
