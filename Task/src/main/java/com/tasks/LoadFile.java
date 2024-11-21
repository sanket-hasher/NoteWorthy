package com.tasks;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/load")
public class LoadFile extends HttpServlet {
    private static final long serialVersionUID = 1L;
	private static final String DB_URL = "jdbc:mariadb://localhost:3306/User_Details";
    private static final String DB_USER = "Sanket";
    private static final String DB_PASSWORD = "password";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = (String) request.getSession().getAttribute("username");
        if (username == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        try {
            //Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            PreparedStatement stmt = connection.prepareStatement(
                "SELECT fileid, filename, filetype FROM user_files WHERE Username = ?"
            );
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();

            List<Map<String, Object>> files = new ArrayList<>();
            while (rs.next()) {
                Map<String, Object> file = new HashMap<>();
                file.put("fileid", rs.getInt("fileid"));
                file.put("filename", rs.getString("filename"));
                file.put("filetype", rs.getString("filetype"));
                files.add(file);
            }

            response.setContentType("application/json");
            response.getWriter().write(new Gson().toJson(files));
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}
