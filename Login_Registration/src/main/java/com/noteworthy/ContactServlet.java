package com.noteworthy;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/contact_customer")
public class ContactServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/user_details";
    private static final String DB_USER = "Sanket";
    private static final String DB_PASSWORD = "Sanket7044";
    private static final String EMAIL = "eduler.notes@gmail.com"; 
    private static final String EMAIL_PASSWORD = "clki pyqk gcay zmbk"; 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Retrieve form data
        String name = request.getParameter("Name");
        String email = request.getParameter("Email");
        String comment = request.getParameter("Comment");

        // Validate form data
        if (name == null || name.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            comment == null || comment.trim().isEmpty()) {
            response.sendRedirect("contact.jsp?msg=invalid");
            return;
        }

        // Database insertion
        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String query = "INSERT INTO contact (Name, Email, comment) VALUES (?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, comment);

            int rowsInserted = preparedStatement.executeUpdate();
            if (rowsInserted > 0) {
            	response.sendRedirect("contact.jsp?msg=success");

                // Send email confirmation
                sendEmail(name, email,comment);
            } else {
            	response.sendRedirect("contact.jsp?msg=error");
            }
        } catch (SQLException e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
            e.printStackTrace();
        }
    }

    private void sendEmail(String name, String recipientEmail,String comment) {
   

        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(EMAIL,EMAIL_PASSWORD);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(EMAIL));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(recipientEmail));
            message.setSubject("Thank You for Contacting Us");
            message.setText("Dear " + name + ",\n\nThank you for reaching out to us. We have received your comment: \n\""+comment+"\"\n\nWe will get back to you shortly.\n\nBest regards,\nTeam Eduler");

            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
