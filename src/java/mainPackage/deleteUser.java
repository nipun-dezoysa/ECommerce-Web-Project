
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

@WebServlet(name = "deleteUser", urlPatterns = {"/deleteUser"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,  // 1 MB
    maxFileSize = 1024 * 1024 * 10,   // 10 MB
    maxRequestSize = 1024 * 1024 * 50 // 50 MB
)
public class deleteUser extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        DatabaseLogIn db = new DatabaseLogIn();
        if(db.deleteUser(id, password)){
            HttpSession session = request.getSession(true);
            session.removeAttribute("user");
            response.getWriter().print("ok");
        }else{
            response.getWriter().print("bad");
        }
        db.closeDb();
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
