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


@WebServlet(name = "WishlistServlet", urlPatterns = {"/WishlistServlet"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,  // 1 MB
    maxFileSize = 1024 * 1024 * 10,   // 10 MB
    maxRequestSize = 1024 * 1024 * 50 // 50 MB
)
public class WishlistServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
          String idString = request.getParameter("id");
          int id = Integer.parseInt(idString);
          
          PrintWriter out = response.getWriter();
          DatabaseLogIn db = new DatabaseLogIn();
          HttpSession session = request.getSession(true);
          
          if(session.getAttribute("user")!=null){
              User user = (User)session.getAttribute("user");
              if(db.isExistWishlist(user.getId(), id)){
                  db.removeWishlist(user.getId(), id);
                  response.sendRedirect("wishlist.jsp");
              }else{
                  db.addWishlist(user.getId(), id);
                  out.print("added");
              }
          }else{
              out.print("notlogin");
          }
          
    }
    


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

