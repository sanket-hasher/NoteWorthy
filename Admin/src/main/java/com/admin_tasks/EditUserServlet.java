package com.admin_tasks;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class EditUserServlet
 */
@WebServlet("/edit_users")
public class EditUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
	private static final String DB_URL = "jdbc:mysql://localhost:3306/User_Details";
	private static final String DB_USER = "Sanket";
	private static final String DB_PASSWORD = "Sanket7044";


    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditUserServlet() {
        super();
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String username = request.getParameter("username");
        String email = request.getParameter("email");

        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            // Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);

            // SQL query to update email
            String sql = "UPDATE User SET Email = ? WHERE Username = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, username);

            // Execute the update
            int rowsUpdated = pstmt.executeUpdate();

            // Redirect based on update result
            if (rowsUpdated > 0) {
                response.sendRedirect("admin.jsp?status=success");
            } else {
                response.sendRedirect("admin.jsp?status=failure");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin.jsp?status=error");
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
