package controller;

import dao.FileDAO;
import service.ConvertService;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class ConvertServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String filePath = request.getParameter("filepath");
        String format = request.getParameter("format");

        String newFile = ConvertService.convertImage(filePath, format);

        if (newFile != null) {

            response.sendRedirect("result.jsp?file=" + newFile);

        } else {

            response.getWriter().println("Conversion Failed");

        }

    }

}