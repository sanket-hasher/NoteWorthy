package com.noteworthy;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import org.json.JSONObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddTask
 */
@WebServlet("/addtask")
public class AddTask extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/User_Details";
    private static final String DB_USER = "Sanket";
    private static final String DB_PASSWORD = "Sanket7044";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        String username = null;

        // Retrieve the username from cookies
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("username".equals(cookie.getName())) {
                    username = cookie.getValue();
                    break;
                }
            }
        }

        // Return an error if the username is not found
        if (username == null) {
            JSONObject errorResponse = new JSONObject();
            errorResponse.put("success", false);
            errorResponse.put("message", "Username not found in cookies.");
            out.write(errorResponse.toString());
            return;
        }

        try {
            // Parse JSON request body
            StringBuilder json = new StringBuilder();
            String line;
            while ((line = request.getReader().readLine()) != null) {
                json.append(line);
            }
            JSONObject jsonObject = new JSONObject(json.toString());

            // Retrieve task description and taskId from JSON
            String taskDescription = jsonObject.getString("taskName");
            String taskId = jsonObject.getString("taskId"); // Get taskId from the JSON request

            // Establish database connection
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Insert task into `Todo` table using the provided taskId
            String insertTodoSQL = "INSERT INTO Todo (taskid, description) VALUES (?, ?)";
            PreparedStatement psTodo = conn.prepareStatement(insertTodoSQL);
            psTodo.setString(1, taskId); // Use the taskId from the JavaScript code
            psTodo.setString(2, taskDescription);
            int rowsTodo = psTodo.executeUpdate();

            if (rowsTodo > 0) {
                // Insert user-task mapping into `tasks` table
                String insertMappingSQL = "INSERT INTO tasks (taskid, username) VALUES (?, ?)";
                PreparedStatement psMapping = conn.prepareStatement(insertMappingSQL);
                psMapping.setString(1, taskId); // Use the same taskId
                psMapping.setString(2, username);
                int rowsMapping = psMapping.executeUpdate();

                // Return success response if both inserts succeed
                if (rowsMapping > 0) {
                    JSONObject responseObject = new JSONObject();
                    responseObject.put("success", true);
                    responseObject.put("taskId", taskId);
                    responseObject.put("description", taskDescription);
                    out.write(responseObject.toString());
                } else {
                    throw new Exception("Failed to insert user-task mapping into tasks.");
                }
            } else {
                throw new Exception("Failed to insert task into Todo.");
            }

            // Close the connection
            conn.close();
        } catch (Exception e) {
            JSONObject errorResponse = new JSONObject();
            errorResponse.put("success", false);
            errorResponse.put("message", e.getMessage());
            out.write(errorResponse.toString());
            e.printStackTrace();
        } finally {
            out.close();
        }
    }
}
