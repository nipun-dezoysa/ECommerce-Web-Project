
package mainPackage;

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
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter; 
import java.util.Random;


@WebServlet(name = "addProduct", urlPatterns = {"/addProduct"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,  // 1 MB
    maxFileSize = 1024 * 1024 * 10,   // 10 MB
    maxRequestSize = 1024 * 1024 * 50 // 50 MB
)
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
        String type = request.getParameter("type");
        
        int priceint = Integer.parseInt(price);
        int discountint = Integer.parseInt(discount);
        
        PrintWriter out = response.getWriter();
        
        Part cimg = request.getPart("cimage");
        Part img1 = request.getPart("image1");
        Part img2 = request.getPart("image2");
        Part img3 = request.getPart("image3");
        
        String fileName1 = getFileName(cimg.getSubmittedFileName());
        String fileName2 = getFileName(img1.getSubmittedFileName());
        String fileName3 = getFileName(img2.getSubmittedFileName());
        String fileName4 = getFileName(img3.getSubmittedFileName());
        
        String uploadDir = getServletContext().getRealPath("/img/products/");
        Path uploadPath = Paths.get(uploadDir);
        
        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        } 
       
        //images copy to img/products folder
        try {
            Files.copy(cimg.getInputStream(), uploadPath.resolve(fileName1));
            Files.copy(img1.getInputStream(), uploadPath.resolve(fileName2));
            Files.copy(img2.getInputStream(), uploadPath.resolve(fileName3));
            Files.copy(img3.getInputStream(), uploadPath.resolve(fileName4));
                
        } catch (IOException e) {
            out.print("Error in Uploading your image to the target Folder");
            return;
        }
        
        DatabaseLogIn db5= new DatabaseLogIn();
        
        int pid = db5.addProduct(name, description, brand, priceint, discountint,Integer.parseInt(type),fileName1,fileName2,fileName3,fileName4);
       
        for(int x=0;x<sizes.length;x++){
            db5.addSizes(Integer.parseInt(sizes[x]), pid);
        }
        
        for(int x=0;x<colors.length;x++){
            db5.addColors(pid, colors[x]);
        }
        db5.closeDb();
        out.print("Product added successfully");
        
    }
   
    //generete unique file name to each uploaded image
    String getFileName(String fileName){
        Random rand = new Random();
        LocalDateTime myDateObj = LocalDateTime.now();
        DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("ddMMyyyyHHmmss");
        String fileExtension = fileName.substring(fileName.lastIndexOf('.')+ 1);
        return myDateObj.format(myFormatObj)+rand.nextInt(100)+"."+fileExtension;
    }
}
