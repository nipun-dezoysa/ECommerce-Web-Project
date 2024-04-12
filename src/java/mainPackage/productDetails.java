
package mainPackage;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author Nipun
 */
@WebServlet(name = "productDetails", urlPatterns = {"/productDetails"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,  // 1 MB
    maxFileSize = 1024 * 1024 * 10,   // 10 MB
    maxRequestSize = 1024 * 1024 * 50 // 50 MB
)
public class productDetails extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("des");
        String brand = request.getParameter("brand");
        String price = request.getParameter("price");
        String discount = request.getParameter("discount");
        String type = request.getParameter("type");
        String pid = request.getParameter("pid");
        DatabaseLogIn db = new DatabaseLogIn();
        
        db.productDetails(pid, name, description, brand, price, discount, type);
        
        
        PrintWriter out = response.getWriter();
        out.print(pid);
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}