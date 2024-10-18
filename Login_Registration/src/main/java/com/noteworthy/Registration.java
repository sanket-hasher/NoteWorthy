package com.noteworthy;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class Register
 */
@WebServlet("/register")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	  private static final String DB_URL = "jdbc:mysql://localhost:3306/user_details";
	    private static final String DB_USER = "Sanket";
	    private static final String DB_PASSWORD = "Sanket7044";

    /**
     * Default constructor. 
     */
    public Registration() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: Sanket Dey ' server ").append(request.getContextPath());
		 response.setContentType("text/html");
	        PrintWriter out = response.getWriter();
	        
	        String username = request.getParameter("username");
	        String email = request.getParameter("email");
	        String password = request.getParameter("password");
	        String confirmPassword = request.getParameter("confirm-password");
	        String passwordPattern = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=\\-{}|:;'<>,.?/]).+$";

	        // Validate the input data
	        if (username == null || username.isEmpty() || email == null || email.isEmpty() ||
	            password == null || password.isEmpty() || confirmPassword == null || confirmPassword.isEmpty()) {
	            
//	            System.out.println("<h3>Please fill in all fields!</h3>");
	        	response.sendRedirect("signup.jsp?msg=invalid");
	            return;
	        }
	        if(password.length()<8)
	        {
	        	response.sendRedirect("signup.jsp?msg=short-password");
	        	return;
	        }
	        if(!password.matches(passwordPattern))
	        {
	        	response.sendRedirect("signup.jsp?msg=weak-password");
	        	return;
	        }

	        if (!password.equals(confirmPassword)) {
//	            out.println("<h3>Passwords do not match!</h3>");
	        	response.sendRedirect("signup.jsp?msg=password-mismatch");
	            return;
	        }
	        
	        

	        // Database connection and SQL statement
	        try {
	            // Load MySQL JDBC Driver
	            Class.forName("com.mysql.cj.jdbc.Driver");

	            // Establish a connection
	            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	            // Check if the connection is successful
	            if (connection != null) 
	                System.out.println("Connection to the database was successful!");
	            // SQL insert query
	            String sql_usercheck="Select Username from User where Username = ?";
	            String sql_register = "INSERT INTO User (Username,Email,Password) VALUES (?, ?, ?)";
	            PreparedStatement preparedStatement1 = connection.prepareStatement(sql_usercheck);
	            preparedStatement1.setString(1, username);
	            ResultSet resultSet = preparedStatement1.executeQuery();
	            if (resultSet.next()) {
//	            	out.println("<h3> Same Username found </h3>");
	            	response.sendRedirect("signup.jsp?msg=same-username-found");
	            	return;
	            }
	            // Prepare statement
	            PreparedStatement preparedStatement2 = connection.prepareStatement(sql_register);
	            preparedStatement2.setString(1, username);
	            preparedStatement2.setString(2, email);
	            preparedStatement2.setString(3, password);

	            // Execute update
	            int rowsInserted = preparedStatement2.executeUpdate();
//	            connection.commit();

	            // Check if the insertion was successful
	            if (rowsInserted > 0) {
//	                out.println("<h1>registration Successfull</h1>");
	            	response.sendRedirect("signup.jsp?msg=valid");
	            } else {
//	                out.println("<h3>Failed to register!</h3>");
	            	response.sendRedirect("signup.jsp?msg=signup-failed");
	            }

	            // Close resources
	            preparedStatement2.close();
	            preparedStatement1.close();
	            connection.close();
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	            out.println("<h3>Error: JDBC Driver not found.</h3>");
	        } catch (SQLException e) {
	            e.printStackTrace();
	            out.println("<h3>Error: Database connection or SQL operation failed.</h3>");
	        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}