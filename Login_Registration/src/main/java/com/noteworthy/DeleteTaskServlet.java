package com.noteworthy;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
    private static final String DB_URL = "jdbc:mysql://localhost:3306/User_Details";
    private static final String DB_USER = "Sanket";
    private static final String DB_PASSWORD = "Sanket7044";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        JSONObject jsonResponse = new JSONObject();

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            // Disable auto-commit for transaction management
            conn.setAutoCommit(false);

            // Read the JSON input
            JSONObject jsonRequest = new JSONObject(request.getReader().readLine());
            String taskId = jsonRequest.getString("taskId");

            // SQL queries to delete from both tables
            String deleteTodoSQL = "DELETE FROM Todo WHERE taskid = ?";
            String deleteTasksSQL = "DELETE FROM tasks WHERE taskid = ?";

            try (PreparedStatement psDeleteTodo = conn.prepareStatement(deleteTodoSQL);
                 PreparedStatement psDeleteTasks = conn.prepareStatement(deleteTasksSQL)) {

                // Set parameters and execute for Todo table
                psDeleteTodo.setString(1, taskId);
                psDeleteTodo.executeUpdate();

                // Set parameters and execute for tasks table
                psDeleteTasks.setString(1, taskId);
                psDeleteTasks.executeUpdate();

                // Commit the transaction
                conn.commit();
                jsonResponse.put("success", true);
            } catch (SQLException e) {
                // Rollback the transaction in case of failure
                conn.rollback();
                throw e;
            }
        } catch (Exception e) {
            jsonResponse.put("success", false);
            jsonResponse.put("message", e.getMessage());
        }

        // Write the JSON response
        response.getWriter().write(jsonResponse.toString());
    }
}
