
package mainPackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.CartItem;

@WebServlet(name = "removeFromCart", urlPatterns = {"/removeFromCart"})
public class removeFromCart extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int color = Integer.parseInt(request.getParameter("color"));
        int size = Integer.parseInt(request.getParameter("size"));
        
        CartItem item = new CartItem(id,color,size);
        HttpSession session = request.getSession(true);
        
        if(session.getAttribute("cart")!=null){
            ArrayList<CartItem> cart = (ArrayList<CartItem>)session.getAttribute("cart");
            for(int i=0;i<cart.size();i++){
                if(item.isEqual(cart.get(i))){
                    cart.remove(i);
                    session.setAttribute("cart", cart);
                    break;
                }
            }
        }
        
        response.getWriter().println("<h1>removed item</h1>");
        
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
