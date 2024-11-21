package com.noteworthy;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import org.json.JSONObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteTaskServlet
 */
@WebServlet("/deletetask")
public class DeleteTaskServlet extends HttpServlet {
    // Same DB configuration as above
	private static final String DB_URL = "jdbc:mariadb://localhost:3306/User_Details";
    private static final String DB_USER = "Sanket";
    private static final String DB_PASSWORD = "password";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        JSONObject jsonResponse = new JSONObject();

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            JSONObject jsonRequest = new JSONObject(request.getReader().readLine());
            String taskId = jsonRequest.getString("taskId");

            String deleteSQL = "DELETE FROM todo WHERE taskid = ?";  // Adjust the SQL as needed

            try (PreparedStatement psDelete = conn.prepareStatement(deleteSQL)) {
                psDelete.setString(1, taskId);
                psDelete.executeUpdate();
            }

            jsonResponse.put("success", true);
        } catch (Exception e) {
            jsonResponse.put("success", false);
            jsonResponse.put("message", e.getMessage());
        }

        response.getWriter().write(jsonResponse.toString());
    }
}
