
package mainPackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.CartItem;
import models.User;

@WebServlet(name = "placeOrder", urlPatterns = {"/placeOrder"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,  // 1 MB
    maxFileSize = 1024 * 1024 * 10,   // 10 MB
    maxRequestSize = 1024 * 1024 * 50 // 50 MB
)
public class placeOrder extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fname = request.getParameter("firstname");
        String lname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String province = request.getParameter("province");
        String note = request.getParameter("note");
        String add = request.getParameter("add");
        
        if(note==null)note="";
        
        HttpSession session = request.getSession(true);
        DatabaseLogIn db = new DatabaseLogIn();
        PrintWriter out = response.getWriter();
        
        if(session.getAttribute("user")!=null && session.getAttribute("cart")!=null){
            User user = (User) session.getAttribute("user");
            ArrayList<CartItem> cart = (ArrayList<CartItem>)session.getAttribute("cart");
            if(db.addOrder(user.getId(),fname+" "+lname, email, phone, address+", "+city+", "+province, note,cart)){
                session.removeAttribute("cart");
                if(add!=null){
                    db.addAddress(user.getId(), fname, lname, email, phone, address, city, province);
                }
                out.print("ok");
            }else{
                out.print("nohhhh");
            }
            
        }else{
            out.print("no");
        }
        db.closeDb();
      
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
