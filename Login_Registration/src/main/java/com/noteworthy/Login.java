package com.noteworthy;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DB_URL = "jdbc:mariadb://localhost:3306/User_Details";
    private static final String DB_USER = "Sanket";
    private static final String DB_PASSWORD = "password";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());

		PrintWriter out = response.getWriter();

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		if (username == null || username.isEmpty() || password == null || password.isEmpty()) {
			response.sendRedirect("login.jsp?msg=invalid");
		} else {
			try {
				// Load MySQL JDBC Driver
				//Class.forName("com.mysql.cj.jdbc.Driver");

				// Establish a connection
				Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

				// SQL select query to verify user credentials
				String sql = "SELECT email FROM User WHERE username = ? AND password = ?";

				// Prepare statement
				PreparedStatement preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, username);
				preparedStatement.setString(2, password);

				// Execute query
				ResultSet resultSet = preparedStatement.executeQuery();

				// Check if a matching user exists
				if (resultSet.next()) {
					String email = resultSet.getString("email");

					// Set session attributes
					HttpSession session = request.getSession();
					session.setAttribute("username", username);
					session.setAttribute("email", email);

					// Create cookies to store the username and email
					Cookie usernameCookie = new Cookie("username", username);
					Cookie emailCookie = new Cookie("email", email);

					// Set the expiration time for the cookies (e.g., 7 days)
					usernameCookie.setMaxAge(7 * 24 * 60 * 60); // 7 days in seconds
					emailCookie.setMaxAge(7 * 24 * 60 * 60);

					// Add the cookies to the response
					response.addCookie(usernameCookie);
					response.addCookie(emailCookie);

					// Redirect to the main page
					response.sendRedirect("main.jsp");
				} else {
					response.sendRedirect("login.jsp?msg=valid&username=notfound");
				}

				// Close resources
				resultSet.close();
				preparedStatement.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
				out.println("<h3>Error: Database connection or SQL operation failed.</h3>");
			}
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
