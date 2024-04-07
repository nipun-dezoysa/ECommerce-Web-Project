import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import mainPackage.DatabaseLogIn;

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
        
        int priceint = Integer.parseInt(price);
        int discountint = Integer.parseInt(discount);
        String sisesstr= Arrays.toString(sizes);
        String colorsstr =Arrays.toString(colors);
        
        
        
        PrintWriter out = response.getWriter();
        out.println(sizes + " " + colors );
        
        Part cimg = request.getPart("cimage");
        String fileName = cimg.getSubmittedFileName();
        
        /*out.println(name);
        out.println(description);
        out.println(brand);
        out.println(price);
        out.println(discount);
        out.println(Arrays.toString(sizes));
        out.println(Arrays.toString(colors));
        out.println(fileName);
        */
        
        
        DatabaseLogIn db5= new DatabaseLogIn();
        
        db5.addProduct(name, description, brand, priceint, discountint, colorsstr, sisesstr, fileName);
        
        
        /*if (!"".equals(fileName)) {
            String uploadDir = getServletContext().getRealPath("/img/products/");
            Path uploadPath = Paths.get(uploadDir);
            
            // Create the directory if it doesn't exist
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }
            
            Path filePath = uploadPath.resolve(fileName);
            try {
                Files.copy(cimg.getInputStream(), filePath);
                out.print("<p style='text-align:center;'>Completed</p>");
            } catch (IOException e) {
                out.print("<p style='text-align:center;color:red'>Error in Uploading your image to the target Folder</p>");
            }
        } else {
            out.print("<p style='text-align:left;color:red'>Error in Uploading your image. Please select an image</p>");
//            request.getRequestDispatcher("Images.jsp").include(request, response);
        }*/
    }
}
