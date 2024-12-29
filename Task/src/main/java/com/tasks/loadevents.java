package com.tasks;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class loadevents
 */
@WebServlet("/loadd")
public class loadevents extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String DB_URL = "jdbc:mysql://localhost:3306/user_details";
    private static final String DB_USER = "Sanket";
    private static final String DB_PASSWORD = "Sanket7044";

    public loadevents() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        
        String username = (String) request.getSession().getAttribute("username");
        if (username == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        JsonObject jsonResponse = new JsonObject();
        JsonArray events = new JsonArray();

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            // Query the Events table
            String sql = "SELECT event_id, username, event_name, event_start_time, event_end_time FROM Events where username=?";
            
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            ResultSet resultSet = statement.executeQuery();
            

            // Iterate through the result set and add events to the JSON array
            while (resultSet.next()) {
                JsonObject event = new JsonObject();
                event.addProperty("event_id", resultSet.getInt("event_id"));
                event.addProperty("username", resultSet.getString("username"));
                event.addProperty("event_name", resultSet.getString("event_name"));
                event.addProperty("event_start_time", resultSet.getString("event_start_time"));
                event.addProperty("event_end_time", resultSet.getString("event_end_time"));
                
                events.add(event);
                
            }

            // Add the events array to the JSON response
            jsonResponse.add("events", events);
            //System.out.println(jsonResponse);

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            jsonResponse.addProperty("status", "error");
            jsonResponse.addProperty("message", "An error occurred while loading events.");
        }

        // Write the JSON response
        response.getWriter().write(jsonResponse.toString());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
