package mainPackage;


import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "WishlistServlet", urlPatterns = {"/WishlistServlet"})
public class WishlistServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          String idString = request.getParameter("id");
          int id = Integer.parseInt(idString);
        String action = request.getParameter("action");

        if ("remove".equals(action)) {
            // Remove data from wishlist table
            wishlist.removeItem(id);
            response.sendRedirect("wishlist.jsp");
        } else {
            // Insert data into wishlist table

           response.sendRedirect("product.jsp");
        }
    }
    


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

