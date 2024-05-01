
package mainPackage;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(name = "removeAddress", urlPatterns = {"/removeAddress"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,  // 1 MB
    maxFileSize = 1024 * 1024 * 10,   // 10 MB
    maxRequestSize = 1024 * 1024 * 50 // 50 MB
)
public class removeAddress extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            DatabaseLogIn db = new DatabaseLogIn();
            String id = request.getParameter("id");
            db.removeAddress(id);
            db.closeDb();
            response.getWriter().print("ok");
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
