
package mainPackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
/**
 *
 * @author Nipun
 */
@WebServlet(name = "changeImg", urlPatterns = {"/changeImg"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,  // 1 MB
    maxFileSize = 1024 * 1024 * 10,   // 10 MB
    maxRequestSize = 1024 * 1024 * 50 // 50 MB
)
public class changeImg extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DatabaseLogIn db = new DatabaseLogIn();
        String pid = request.getParameter("pid");
        String choice = request.getParameter("choice");
        Part img = request.getPart("img");
        String fileName = getFileName(img.getSubmittedFileName());
        String uploadDir = getServletContext().getRealPath("/img/products/");
        Path uploadPath = Paths.get(uploadDir);
        try {
            Files.copy(img.getInputStream(), uploadPath.resolve(fileName));
            db.changeImg(pid, choice, fileName);
        } catch (IOException e) {
            db.closeDb();
            return;
        }
        PrintWriter out = response.getWriter();
        out.print(fileName);
        db.closeDb();
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
    String getFileName(String fileName){
        Random rand = new Random();
        LocalDateTime myDateObj = LocalDateTime.now();
        DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("ddMMyyyyHHmmss");
        String fileExtension = fileName.substring(fileName.lastIndexOf('.')+ 1);
        return myDateObj.format(myFormatObj)+rand.nextInt(100)+"."+fileExtension;
    }

}