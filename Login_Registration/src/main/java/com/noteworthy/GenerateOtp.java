package com.noteworthy;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Random;

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
import jakarta.servlet.http.HttpSession;

@WebServlet("/generateotp")
public class GenerateOtp extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String DB_URL = "jdbc:mysql://localhost:3306/user_details";
    private static final String DB_USER = "Sanket";
    private static final String DB_PASSWORD = "Sanket7044";

    // Email configuration for sending OTP
    private static final String EMAIL = "eduler.notes@gmail.com"; // Replace with your email
    private static final String EMAIL_PASSWORD = "clki pyqk gcay zmbk"; // Replace with your email password

    public GenerateOtp() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");

        if (email == null || email.isEmpty()) {
            response.sendRedirect("forgot.jsp?email=invalid");
        } else {
            try {
                // Load MySQL JDBC Driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish a connection
                Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

                // SQL select query to verify user credentials
                String sql = "SELECT username FROM User WHERE email = ?";

                // Prepare statement
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, email);

                // Execute query
                ResultSet resultSet = preparedStatement.executeQuery();

                // Check if a matching user exists
                if (resultSet.next()) {
                    String username = resultSet.getString("username");
                    HttpSession session = request.getSession();
                    session.setAttribute("username", username);
                    session.setAttribute("email",email );

                    // Generate OTP
                    int otp = generateOtp();
                    session.setAttribute("otp", Integer.toString(otp));

                    // Send OTP to email
                    sendOtpEmail(email, otp);

                    // Redirect to otp.jsp
                    response.sendRedirect("otp.jsp");
                } else {
                    response.sendRedirect("forgot.jsp?email=notfound");
                }

                // Close resources
                resultSet.close();
                preparedStatement.close();
                connection.close();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
                response.getWriter().println("<h3>Error: JDBC Driver not found.</h3>");
            } catch (SQLException e) {
                e.printStackTrace();
                response.getWriter().println("<h3>Error: Database connection or SQL operation failed.</h3>");
            } catch (MessagingException e) {
                e.printStackTrace();
                response.getWriter().println("<h3>Error: Unable to send OTP email.</h3>");
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private int generateOtp() {
        Random random = new Random();
        return 100000 + random.nextInt(900000); // Generates a 6-digit OTP
    }

    private void sendOtpEmail(String recipientEmail, int otp) throws MessagingException {
        // Set up email properties
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        // Get the session object
        Session session = Session.getInstance(props, new jakarta.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(EMAIL, EMAIL_PASSWORD);
            }
        });

        // Compose the email message
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(EMAIL));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
        message.setSubject("Your OTP Code");
        message.setText("Dear user,\n\nYour OTP code is: " + otp + "\n\nPlease enter this code to complete your request.\n\nThank you.");

        // Send the email
        Transport.send(message);
    }
}
