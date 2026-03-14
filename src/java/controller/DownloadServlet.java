package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.*;
import java.net.URLDecoder;

public class DownloadServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // --- 1. Get and decode file path ---
        String rawParam = request.getParameter("file");

        if (rawParam == null || rawParam.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "No file specified.");
            return;
        }

        // Decode URL-encoded path (spaces, special chars)
        String filePath = URLDecoder.decode(rawParam, "UTF-8");

        // --- 2. Security check: block path traversal attacks ---
        File file = new File(filePath).getCanonicalFile();
        String uploadsDir = new File(getServletContext().getRealPath("") + File.separator + "uploads")
                                .getCanonicalPath();

        if (!file.getAbsolutePath().startsWith(uploadsDir)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Access denied.");
            return;
        }

        // --- 3. Check file exists ---
        if (!file.exists() || !file.isFile()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "File not found: " + file.getName());
            return;
        }

        // --- 4. Detect content type ---
        String fileName   = file.getName();
        String ext        = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
        String mimeType   = getMimeType(ext);

        // --- 5. Set response headers ---
        response.setContentType(mimeType);
        response.setContentLengthLong(file.length());
        response.setHeader("Content-Disposition",
                "attachment; filename=\"" + fileName + "\"");

        // --- 6. Stream file to browser ---
        try (
            FileInputStream  fis = new FileInputStream(file);
            OutputStream     os  = response.getOutputStream()
        ) {
            byte[] buffer = new byte[8192];
            int bytesRead;
            while ((bytesRead = fis.read(buffer)) != -1) {
                os.write(buffer, 0, bytesRead);
            }
            os.flush();
        }
    }

    // Helper — map extension to MIME type
    private String getMimeType(String ext) {
        switch (ext) {
            case "png":  return "image/png";
            case "jpg":
            case "jpeg": return "image/jpeg";
            case "gif":  return "image/gif";
            case "bmp":  return "image/bmp";
            case "webp": return "image/webp";
            case "tiff":
            case "tif":  return "image/tiff";
            case "ico":  return "image/x-icon";
            case "svg":  return "image/svg+xml";
            case "pdf":  return "application/pdf";
            default:     return "application/octet-stream";
        }
    }
}