package com.noteworthy;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/loadReviews")
public class LoadReviews extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        // Database configuration
        String url = "jdbc:mariadb://localhost:3306/User_Details";
        String user = "Sanket";
        String password = "password";

        List<String> reviews = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection(url, user, password);
             PreparedStatement statement = connection.prepareStatement("SELECT name, comment, stars FROM review");
             ResultSet resultSet = statement.executeQuery()) {
        	//Class.forName("com.mysql.cj.jdbc.Driver");

            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String comment = resultSet.getString("comment");
                int stars = resultSet.getInt("stars");

                reviews.add(String.format("{\"name\":\"%s\", \"comment\":\"%s\", \"stars\":%d}", name, comment, stars));
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.write("[]"); // Return an empty array in case of error
            return;
        }

        out.write("[" + String.join(",", reviews) + "]");
        out.flush();
    }
}
