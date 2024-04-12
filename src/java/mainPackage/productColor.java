
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
@WebServlet(name = "productColor", urlPatterns = {"/productColor"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,  // 1 MB
    maxFileSize = 1024 * 1024 * 10,   // 10 MB
    maxRequestSize = 1024 * 1024 * 50 // 50 MB
)
public class productColor extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String value = request.getParameter("value");
        String pid = request.getParameter("pid");
        DatabaseLogIn db = new DatabaseLogIn();
        
        if(pid==null){
            db.removeColor(value);
        }else{
            db.addColors( Integer.parseInt(pid),value);
        }
        
        PrintWriter out = response.getWriter();
        out.print(value);
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}