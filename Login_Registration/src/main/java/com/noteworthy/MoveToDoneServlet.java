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

@WebServlet("/movetodone")
public class MoveToDoneServlet extends HttpServlet {
	  private static final String DB_URL = "jdbc:mysql://localhost:3306/User_Details";
	    private static final String DB_USER = "Sanket";
	    private static final String DB_PASSWORD = "Sanket7044";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        JSONObject jsonResponse = new JSONObject();

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            JSONObject jsonRequest = new JSONObject(request.getReader().readLine());
            String taskId = jsonRequest.getString("taskId");
            String description = jsonRequest.getString("taskDescription");

            String insertSQL = "INSERT INTO Done (taskid, description) VALUES (?, ?)";
            String deleteSQL = "DELETE FROM InProgress WHERE taskid = ?";
            try (PreparedStatement psInsert = conn.prepareStatement(insertSQL);
                 PreparedStatement psDelete = conn.prepareStatement(deleteSQL)) {

                psInsert.setString(1, taskId);
                psInsert.setString(2, description);
                psInsert.executeUpdate();

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
