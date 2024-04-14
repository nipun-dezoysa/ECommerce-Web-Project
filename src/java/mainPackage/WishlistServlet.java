import mainPackage.WishlistItem;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/wishlist")
public class WishlistServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Assuming you have a WishlistDAO to interact with the database
        wishlist wishlist = new wishlist();
        
        // Retrieve wishlist items from the database
        List<WishlistItem> wishlistItems = wishlist.getAllItems();
        
        // Set the retrieved data as an attribute in the request
        request.setAttribute("wishlistItems", wishlistItems);
        
        // Forward the request to the JSP file for rendering
        request.getRequestDispatcher("/wishlist.jsp").forward(request, response);
    }
}
