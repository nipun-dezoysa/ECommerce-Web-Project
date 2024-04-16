
package mainPackage;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nipun
 */
@WebServlet(name = "SignOutServelet", urlPatterns = {"/SignOutServelet"})
public class SignOutServelet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        session.removeAttribute("user");
        response.getWriter().print("logout");
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
