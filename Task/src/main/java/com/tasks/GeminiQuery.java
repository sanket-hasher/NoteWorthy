package com.tasks;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/gemini")
public class GeminiQuery extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String API_KEY = "AIzaSyBoB9SUv8ebI0tHm6XzFaKS6yO9FlxIlgU";
    private static final String GEMINI_URL = "https://generativelanguage.googleapis.com/v1/models/gemini-1.5-flash:generateContent?key=" + API_KEY;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String editorData = request.getParameter("editorData");
        //String editorData="write a c program to explain pointer";
        if (editorData == null || editorData.trim().isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("No editor data provided.");
            return;
        }

        String payload = "{\n" +
                         "  \"contents\": [\n" +
                         "    { \"parts\": [ { \"text\": \"" + editorData + "\" } ] }\n" +
                         "  ]\n" +
                         "}";

        HttpURLConnection connection = null;
        try {
            URL url = new URL(GEMINI_URL);
            connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setDoOutput(true);

            // Send the payload
            try (OutputStream os = connection.getOutputStream()) {
                byte[] input = payload.getBytes(StandardCharsets.UTF_8);
                os.write(input, 0, input.length);
            }

            int responseCode = connection.getResponseCode();
            System.out.println("Response Code from Gemini API: " + responseCode);

            if (responseCode == HttpURLConnection.HTTP_OK) {
                try (BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
                    String inputLine;
                    StringBuilder content = new StringBuilder();
                    while ((inputLine = in.readLine()) != null) {
                        content.append(inputLine);
                    }

                    // Debug: Log the raw JSON response
                    String rawResponse = content.toString();
                    //System.out.println("Raw Response from Gemini API: " + rawResponse);

                    // Parse JSON response with Gson
                    Gson gson = new Gson();
                    JsonObject jsonResponse = gson.fromJson(rawResponse, JsonObject.class);

                    // Extract main content
                    StringBuilder generatedContent = new StringBuilder();
                    if (jsonResponse.has("candidates")) {
                        JsonArray candidatesArray = jsonResponse.getAsJsonArray("candidates");
                        for (int i = 0; i < candidatesArray.size(); i++) {
                            JsonObject candidate = candidatesArray.get(i).getAsJsonObject();
                            JsonObject contentObject = candidate.getAsJsonObject("content");
                            if (contentObject != null && contentObject.has("parts")) {
                                JsonArray partsArray = contentObject.getAsJsonArray("parts");
                                for (int j = 0; j < partsArray.size(); j++) {
                                    JsonObject part = partsArray.get(j).getAsJsonObject();
                                    generatedContent.append(part.get("text").getAsString()).append("\n");
                                }
                            }
                        }
                    }

                    // Log the extracted content
                    String generatedText = generatedContent.toString().trim();
                    System.out.println("Generated Content: " + generatedText);

                    // Send the plain text response back
                    response.setContentType("text/plain");
                    response.getWriter().write(generatedText);
                }
            } else {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("Error calling Gemini API: " + responseCode);
            }
        } catch (IOException e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Error during request to Gemini API: " + e.getMessage());
        } finally {
            if (connection != null) {
                connection.disconnect();
            }
        }
    }
}
