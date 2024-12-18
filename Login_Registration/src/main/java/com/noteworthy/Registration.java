package com.noteworthy;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

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

/**
 * Servlet implementation class Registration
 */
@WebServlet("/register")
public class Registration extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String DB_URL = "jdbc:mysql://localhost:3306/user_details";
    private static final String DB_USER = "Sanket";
    private static final String DB_PASSWORD = "Sanket7044";
    private static final String EMAIL = "eduler.notes@gmail.com"; 
    private static final String EMAIL_PASSWORD = "clki pyqk gcay zmbk";

    public Registration() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm-password");
        String passwordPattern = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=\\-{}|:;'<>,.?/]).+$";

        if (username == null || username.isEmpty() || email == null || email.isEmpty() ||
            password == null || password.isEmpty() || confirmPassword == null || confirmPassword.isEmpty()) {
            response.sendRedirect("signup.jsp?msg=invalid");
            return;
        }
        if (password.length() < 8) {
            response.sendRedirect("signup.jsp?msg=short-password");
            return;
        }
        if (!password.matches(passwordPattern)) {
            response.sendRedirect("signup.jsp?msg=weak-password");
            return;
        }
        if (!password.equals(confirmPassword)) {
            response.sendRedirect("signup.jsp?msg=password-mismatch");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sqlUserCheck = "SELECT Username FROM User WHERE Username = ?";
            String sqlRegister = "INSERT INTO User (Username, Email, Password) VALUES (?, ?, ?)";
            PreparedStatement preparedStatement1 = connection.prepareStatement(sqlUserCheck);
            preparedStatement1.setString(1, username);
            ResultSet resultSet = preparedStatement1.executeQuery();

            if (resultSet.next()) {
                response.sendRedirect("signup.jsp?msg=same-username-found");
                return;
            }

            PreparedStatement preparedStatement2 = connection.prepareStatement(sqlRegister);
            preparedStatement2.setString(1, username);
            preparedStatement2.setString(2, email);
            preparedStatement2.setString(3, password);

            int rowsInserted = preparedStatement2.executeUpdate();

            if (rowsInserted > 0) {
                sendConfirmationEmail(email, username);
                response.sendRedirect("signup.jsp?msg=valid");
            } else {
                response.sendRedirect("signup.jsp?msg=signup-failed");
            }

            preparedStatement2.close();
            preparedStatement1.close();
            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println("<h3>Error: Database connection or SQL operation failed.</h3>");
        }
    }

    private void sendConfirmationEmail(String recipientEmail, String username) {


        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new jakarta.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(EMAIL,EMAIL_PASSWORD);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(EMAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("Welcome to Eduler!");
            message.setText("Dear " + username + ",\n\nThank you for registering at Eduler. Create, organize, and manage your tasks perfectly here!\n\nBest Regards,\nEduler Team");

            Transport.send(message);
            System.out.println("Confirmation email sent successfully.");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
