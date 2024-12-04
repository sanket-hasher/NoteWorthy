package com.tasks;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

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
                processJsonObject(jsonObject);

            } else if (jsonElement.isJsonArray()) {
                JsonArray jsonArray = jsonElement.getAsJsonArray();
                System.out.println("Received JsonArray: " + jsonArray);

                // Process the JsonArray
                for (JsonElement element : jsonArray) {
                    JsonObject obj = element.getAsJsonObject();
                    processJsonObject(obj);
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
    private void processJsonObject(JsonObject jsonObject) {
        int day = jsonObject.get("day").getAsInt();
        int month = jsonObject.get("month").getAsInt();
        int year = jsonObject.get("year").getAsInt();
        System.out.println("Date: " + day + "/" + month + "/" + year);

        JsonArray events = jsonObject.getAsJsonArray("events");
        if (events.size() > 0) {
            JsonObject lastEvent = events.get(events.size() - 1).getAsJsonObject();
            String title = lastEvent.get("title").getAsString();
            String time = lastEvent.get("time").getAsString();

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
}
