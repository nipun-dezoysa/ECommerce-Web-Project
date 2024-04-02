import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(name = "addProduct", urlPatterns = {"/addProduct"})
@MultipartConfig
public class addProduct extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("des");
        String brand = request.getParameter("brand");
        String price = request.getParameter("price");
        String discount = request.getParameter("discount");
        String[] sizes = request.getParameterValues("sizes");
        String[] colors = request.getParameterValues("colors");
        
        PrintWriter out = response.getWriter();
        Part myloc = request.getPart("pimage");
        String fileName = myloc.getSubmittedFileName();
        
        if (!"".equals(fileName)) {
            String uploadDir = getServletContext().getRealPath("/img/products/");
            Path uploadPath = Paths.get(uploadDir);
            
            // Create the directory if it doesn't exist
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }
            
            Path filePath = uploadPath.resolve(fileName);
            try {
                Files.copy(myloc.getInputStream(), filePath);
                out.print("<p style='text-align:center;'>Completed</p>");
            } catch (IOException e) {
                out.print("<p style='text-align:center;color:red'>Error in Uploading your image to the target Folder</p>");
            }
        } else {
            out.print("<p style='text-align:left;color:red'>Error in Uploading your image. Please select an image</p>");
//            request.getRequestDispatcher("Images.jsp").include(request, response);
        }
    }
}
