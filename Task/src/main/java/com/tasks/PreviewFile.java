package com.tasks;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/preview")
public class PreviewFile extends HttpServlet {
	private static final String DB_URL = "jdbc:mariadb://localhost:3306/User_Details";
    private static final String DB_USER = "Sanket";
    private static final String DB_PASSWORD = "password";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fileId = request.getParameter("fileId");

        if (fileId == null || fileId.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid file ID.");
            return;
        }

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            // Query to fetch file data from database based on fileId
            String sql = "SELECT filetype, filedata FROM user_files WHERE fileid = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, fileId);
            ResultSet resultSet = stmt.executeQuery();

            if (resultSet.next()) {
                // Get file type and file data (binary data)
                String fileType = resultSet.getString("filetype");
                byte[] fileData = resultSet.getBytes("filedata");

                // Set the response content type to the file type
                response.setContentType(fileType);
                response.setContentLength(fileData.length);

                // Write file data to response
                try (InputStream byteArrayInputStream = new ByteArrayInputStream(fileData);
                     var outputStream = response.getOutputStream()) {
                    byte[] buffer = new byte[8192];
                    int bytesRead;
                    while ((bytesRead = byteArrayInputStream.read(buffer)) != -1) {
                        outputStream.write(buffer, 0, bytesRead);
                    }
                }
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "File not found.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error fetching file.");
        }
    }
}
