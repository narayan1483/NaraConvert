package controller;

import dao.FileDAO;
import model.FileModel;
import service.ConvertService;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig(
    maxFileSize    = 50 * 1024 * 1024,   // 50 MB per file
    maxRequestSize = 60 * 1024 * 1024    // 60 MB per request
)
public class UploadServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // --- 1. Get uploaded file part ---
        Part filePart = request.getPart("file");
        String fileName = filePart.getSubmittedFileName();

        // --- 2. Get desired output format ---
        String format = request.getParameter("format");
        if (format == null || format.trim().isEmpty()) {
            format = "png"; // default
        }
        format = format.trim().toLowerCase();

        // --- 3. Build upload directory path ---
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // --- 4. Save uploaded file ---
        String filePath = uploadPath + File.separator + fileName;
        filePart.write(filePath);

        // --- 5. Convert the file ---
        String convertedPath = ConvertService.convertImage(filePath, format);

        if (convertedPath == null) {
            // Conversion failed — show error page
            response.sendRedirect("result.jsp?error=Conversion+failed.+Please+check+file+format.");
            return;
        }

        // --- 6. Save record to DB ---
        String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
        FileModel file = new FileModel();
        file.setFilename(fileName);
        file.setOriginalFormat(ext);
        file.setConvertedFormat(format);
        file.setFilePath(convertedPath);
        FileDAO.saveFile(file);

        // --- 7. Redirect to result page with converted file path ---
        String encodedPath = URLEncoder.encode(convertedPath, "UTF-8");
        response.sendRedirect("result.jsp?file=" + encodedPath);
    }
}