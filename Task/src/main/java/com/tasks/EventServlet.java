package com.tasks;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/event-handler")
public class EventServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String DB_URL = "jdbc:mysql://localhost:3306/user_details";
    private static final String DB_USER = "Sanket";
    private static final String DB_PASSWORD = "Sanket7044";

    public EventServlet() {
        super();
    }

    // Do GET request handling here (if required)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"message\":\"GET request handling not implemented.\"}");
    }

    // Do POST request handling here
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        
        String username = (String) request.getSession().getAttribute("username");
        if (username == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }
        
        
        StringBuilder json = new StringBuilder();
        String line;
        try (BufferedReader reader = request.getReader()) {
            while ((line = reader.readLine()) != null) {
                json.append(line);
            }
        }

        try {
            // Parse the JSON dynamically
            JsonElement jsonElement = JsonParser.parseString(json.toString());

            if (jsonElement.isJsonObject()) {
                JsonObject jsonObject = jsonElement.getAsJsonObject();
                System.out.println("Received JsonObject: " + jsonObject);

                // Process the JsonObject
                processJsonObject(jsonObject, username);

            } else if (jsonElement.isJsonArray()) {
                JsonArray jsonArray = jsonElement.getAsJsonArray();
                System.out.println("Received JsonArray: " + jsonArray);

                // Process the JsonArray
                for (JsonElement element : jsonArray) {
                    JsonObject obj = element.getAsJsonObject();
                    processJsonObject(obj,username);
                }
            } else {
                throw new IllegalArgumentException("Unexpected JSON type");
            }

            // Send success response
            out.write("{\"status\":\"success\"}");
        } catch (Exception e) {
            e.printStackTrace();
            // Send error response
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.write("{\"status\":\"error\",\"message\":\"Failed to process the request: " + e.getMessage() + "\"}");
        } finally {
            out.flush();
        }
    }

    // Helper method to process JsonObject
    private void processJsonObject(JsonObject jsonObject, String username) {
        int day = jsonObject.get("day").getAsInt();
        int month = jsonObject.get("month").getAsInt();
        int year = jsonObject.get("year").getAsInt();
        System.out.println("Date: " + day + "/" + month + "/" + year);
        
      
        JsonArray events = jsonObject.getAsJsonArray("events");
        if (events.size() > 0) {
            JsonObject lastEvent = events.get(events.size() - 1).getAsJsonObject();
            String title = lastEvent.get("title").getAsString();
            String time = lastEvent.get("time").getAsString();
            String eventDate = String.format("%d-%02d-%02d %s", year, month, day, time);
            System.out.println(eventDate);
            
            String[] times = time.split(" - ");
            String startTime = convertTo24HourFormat(times[0].trim());
            String endTime = convertTo24HourFormat(times[1].trim());

            String eventStartDateTime = String.format("%d-%02d-%02d %s", year, month, day, startTime);
            String eventEndDateTime = String.format("%d-%02d-%02d %s", year, month, day, endTime);
            saveEventToDatabase(username, title, eventStartDateTime, eventEndDateTime);

            // Print the result
            System.out.println("Last Event:");
            System.out.println("Date: " + day + "/" + month + "/" + year);
            System.out.println("Title: " + title);
            System.out.println("Time: " + time);
        } 
        else {
            System.out.println("No events found for the last date.");
        }
    
   
    }
    private void saveEventToDatabase(String username, String eventName, String eventStartDateTime, String eventEndDateTime) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // Establish a database connection
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Prepare the SQL INSERT query
            String sql = "INSERT INTO Events (username, event_name, event_start_time, event_end_time) VALUES (?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, eventName);
            preparedStatement.setString(3, eventStartDateTime);
            preparedStatement.setString(4, eventEndDateTime);
            // Execute the query
            preparedStatement.executeUpdate();
        }
        catch (SQLException e) {
            e.printStackTrace();
        } 
        finally {
            // Close resources
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            }
            catch (SQLException e) 
            {
                e.printStackTrace();
            }
        }
    }
    
    private String convertTo24HourFormat(String time) {
        try {
            // Convert 12-hour time format to 24-hour format
            java.text.SimpleDateFormat inputFormat = new java.text.SimpleDateFormat("hh:mm a");
            java.text.SimpleDateFormat outputFormat = new java.text.SimpleDateFormat("HH:mm:ss");
            return outputFormat.format(inputFormat.parse(time));
        } catch (Exception e) {
            throw new IllegalArgumentException("Invalid time format: " + time, e);
        }
    }
    
}
