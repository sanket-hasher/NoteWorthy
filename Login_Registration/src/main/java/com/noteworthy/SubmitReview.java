package com.noteworthy;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/submitReview")
public class SubmitReview extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String reviewerName = request.getParameter("Name");
        String reviewText = request.getParameter("comment");
        String ratingParam = request.getParameter("rating-2");

        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();

        // Validation: Check if any field is empty
        if (reviewerName == null || reviewerName.trim().isEmpty() || 
            reviewText == null || reviewText.trim().isEmpty() || 
            ratingParam == null || ratingParam.trim().isEmpty()) {
            
            out.write("Please fill in all fields before submitting your review.");
            return; // Stop further processing
        }

        try {
            int rating = Integer.parseInt(ratingParam);

            // Database configuration
            String url = "jdbc:mariadb://localhost:3306/User_Details";
            String user = "Sanket";
            String password = "password";

            // JDBC connection setup
            //Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, user, password);

            // SQL insert statement
            String sql = "INSERT INTO review(name, stars, comment) VALUES (?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, reviewerName);
            statement.setInt(2, rating);
            statement.setString(3, reviewText);

            // Execute update and check for success
            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                out.write("Review submitted successfully!");
                out.flush();
            } else {
                out.write("Failed to submit the review. Please try again.");
                out.flush();
            }

            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.write("An error occurred while submitting your review. Please try again later.");
            out.flush();
        }
    }
}
