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

/**
 *
 * @author Nipun
 */
@WebServlet(name = "addToCart", urlPatterns = {"/addToCart"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,  // 1 MB
    maxFileSize = 1024 * 1024 * 10,   // 10 MB
    maxRequestSize = 1024 * 1024 * 50 // 50 MB
)
public class addToCart extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int color = Integer.parseInt(request.getParameter("color"));
        int size = Integer.parseInt(request.getParameter("size"));
        
        CartItem item = new CartItem(id,quantity,color,size);
        ArrayList<CartItem> cart = new ArrayList<CartItem>();
        
        HttpSession session = request.getSession(true);
        
        if(session.getAttribute("cart")==null){
            cart.add(item);
        }else{
            cart = (ArrayList<CartItem>)session.getAttribute("cart");
            boolean isExist = false;
            for(int i=0;i<cart.size();i++){
                if(item.isEqual(cart.get(i))){
                    cart.get(i).setQuantity(item.getQuantity());
                    isExist = true;
                    break;
                }
            }
            if(!isExist){
                cart.add(item);
            }
        }
        session.setAttribute("cart", cart);
        response.getWriter().print(cart.size());
        
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
