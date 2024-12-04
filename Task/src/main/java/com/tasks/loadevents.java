package com.tasks;

import java.io.IOException;

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

    /**
     * @see HttpServlet#HttpServlet()
     */
    public loadevents() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Set content type to JSON
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            // Create a JSON object for the date and events
            JsonObject jsonResponse = new JsonObject();

            // Example of a date (can be dynamic, if needed)
            jsonResponse.addProperty("day", 30);
            jsonResponse.addProperty("month", 11);
            jsonResponse.addProperty("year", 2024);

            // Create the events array
            JsonArray events = new JsonArray();

            // Create the first event
            JsonObject event1 = new JsonObject();
            event1.addProperty("title", "Chemistry");
            event1.addProperty("time", "10:00 AM - 11:00 AM");
            event1.addProperty("date", "27/11/2024");  // Event date
            events.add(event1);
            
            
            JsonObject event2 = new JsonObject();
            event1.addProperty("title", "bio");
            event1.addProperty("time", "10:00 AM - 11:00 AM");
            event1.addProperty("date", "22/11/2024");  // Event date
            events.add(event2);

            // Add the events array to the JSON response
            jsonResponse.add("events", events);

            // Send the JSON response to the client
            response.getWriter().write(jsonResponse.toString());

        } catch (Exception e) {
            // If an error occurs, set the response status to 500 (Internal Server Error)
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            // Log the exception
            e.printStackTrace();
            // Send a generic error message in the response
            response.getWriter().write("{\"status\":\"error\",\"message\":\"An error occurred while processing the request\"}");
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
