package com.tasks;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

/**
 * Servlet implementation class UploadFile
 */
@WebServlet("/upload")
@MultipartConfig
public class UploadFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DB_URL = "jdbc:mariadb://localhost:3306/User_Details";
    private static final String DB_USER = "Sanket";
    private static final String DB_PASSWORD = "password";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadFile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = (String) request.getSession().getAttribute("username");
        System.out.println(username);
        if (username == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        try  {
        	//Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            Part filePart = request.getPart("file");
            String fileName = filePart.getSubmittedFileName();
            String fileType = filePart.getContentType();

            PreparedStatement stmt = connection.prepareStatement(
                "INSERT INTO user_files (Username, filename, filetype, filedata) VALUES (?, ?, ?, ?)"
            );
            stmt.setString(1, username);
            stmt.setString(2, fileName);
            stmt.setString(3, fileType);
            stmt.setBinaryStream(4, filePart.getInputStream());

            stmt.executeUpdate();
            response.setStatus(HttpServletResponse.SC_OK);
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}