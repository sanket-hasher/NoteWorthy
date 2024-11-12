package com.noteworthy;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.json.JSONArray;
import org.json.JSONObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/loadTasks")
public class LoadTasksServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/User_Details";
    private static final String DB_USER = "Sanket";
    private static final String DB_PASSWORD = "Sanket7044";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
            // Establish the database connection
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String sql = "SELECT t.taskid, " +
                         "COALESCE(tt.description, ip.description, dt.description) AS description, " +
                         "CASE " +
                         "  WHEN tt.taskid IS NOT NULL THEN 'todo' " +
                         "  WHEN ip.taskid IS NOT NULL THEN 'inprogress' " +
                         "  WHEN dt.taskid IS NOT NULL THEN 'done' " +
                         "  ELSE 'unknown' " +
                         "END AS status " +
                         "FROM tasks t " +
                         "LEFT JOIN todo tt ON t.taskid = tt.taskid " +
                         "LEFT JOIN inprogress ip ON t.taskid = ip.taskid " +
                         "LEFT JOIN done dt ON t.taskid = dt.taskid " +
                         "WHERE t.username = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            // Collect tasks in a JSON array
            JSONArray tasks = new JSONArray();
            while (rs.next()) {
                JSONObject task = new JSONObject();
                task.put("taskid", rs.getString("taskid"));
                task.put("description", rs.getString("description"));
                task.put("status", rs.getString("status"));
                tasks.put(task);
            }

            // Send the response as JSON
            JSONObject responseObject = new JSONObject();
            responseObject.put("success", true);
            responseObject.put("tasks", tasks);
            out.write(responseObject.toString());

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
