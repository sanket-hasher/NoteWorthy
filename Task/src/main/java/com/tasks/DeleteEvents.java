package com.tasks;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/delete-event")
public class DeleteEvents extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String DB_URL = "jdbc:mysql://localhost:3306/user_details";
    private static final String DB_USER = "Sanket";
    private static final String DB_PASSWORD = "Sanket7044";

    public DeleteEvents() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Debug: Print out the request
        System.out.println("Received a POST request at /delete-event");

        // Read the JSON input from the request body using BufferedReader
        BufferedReader reader = request.getReader();
        StringBuilder jsonString = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            jsonString.append(line);
        }

        // Convert the JSON string to a JsonObject
        JsonObject jsonObject = JsonParser.parseString(jsonString.toString()).getAsJsonObject();
        
        // Debug: Log the incoming JSON
        System.out.println("Received JSON: " + jsonString.toString());

        // Check if event_id exists and is not null
        String eventId = null;
        if (jsonObject.has("event_id") && !jsonObject.get("event_id").isJsonNull()) {
            eventId = jsonObject.get("event_id").getAsString();
            // Debug: Log the extracted event_id
            System.out.println("Extracted event_id: " + eventId);
        } else {
            System.out.println("event_id not found or is null in the JSON.");
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Error: event_id is missing or null.");
            return;
        }

        try {
            // Connect to the database
            System.out.println("Connecting to the database...");
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            System.out.println("Database connection successful.");

            // Prepare the SQL statement
            String sql = "DELETE FROM Events WHERE event_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, Integer.parseInt(eventId)); // Parse event_id as integer
            System.out.println("Prepared SQL statement: " + sql);

            // Execute the update
            int rowsAffected = stmt.executeUpdate();
            System.out.println("Rows affected: " + rowsAffected);

            // Close connection
            conn.close();

            // Respond with success or failure
            if (rowsAffected > 0) {
                response.setStatus(HttpServletResponse.SC_OK);
                System.out.println("Event deleted successfully.");
            } else {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                System.out.println("Event not found.");
            }
        } catch (Exception e) {
            e.printStackTrace();  // Log the exception stack trace
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Error: " + e.getMessage());
            System.out.println("Error occurred: " + e.getMessage());
        }
    }
}
