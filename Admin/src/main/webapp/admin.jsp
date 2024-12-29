<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
     @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: "Poppins", sans-serif;
      
    }
        .popup {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            z-index: 1000;
            display: none;
        }
        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 999;
            display: none;
        }
        h1{
        -webkit-text-stroke: 2px purple;
        }
    </style>
</head>
<body class="bg-gradient-to-l from-purple-100 to-purple-300 text-gray-900">
    <div class="container mx-auto py-10 px-6">
        <h1 class="text-6xl font-extrabold mb-8 text-center text-white">Admin Dashboard</h1>

        <!-- User Management Table -->
        <section class="mb-12">
            <h2 class="text-2xl font-bold mb-4 text-white">User Management</h2>
            <table class="table-auto w-full border-collapse border border-gray-300 bg-white rounded-lg shadow">
                <thead class="bg-purple-400">
                    <tr>
                        <th class="px-6 py-3 border-b text-white">Username</th>
                        <th class="px-6 py-3 border-b text-white">Email</th>
                        <th class="px-6 py-3 border-b text-white">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        
                        java.sql.Connection con = null;
                        java.sql.Statement stmt = null;
                        java.sql.ResultSet rs = null;
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/User_Details", "Sanket", "Sanket7044");
                            stmt = con.createStatement();
                            rs = stmt.executeQuery("SELECT Username, Email FROM User");
                            while (rs.next()) {
                    %>
                    <tr class="hover:bg-purple-50">
                        <td class="px-6 py-4 border-b text-center"><%= rs.getString("Username") %></td>
                        <td class="px-6 py-4 border-b text-center"><%= rs.getString("Email") %></td>
                        <td class="px-6 py-4 border-b text-center">
                            <button onclick="openEditPopup('<%= rs.getString("Username") %>', '<%= rs.getString("Email") %>')" class="bg-blue-500 text-white px-4 py-2 rounded">Edit</button>
                            <form action="delete_users" method="post" class="inline-block ml-2">
                                <input type="hidden" name="username" value="<%= rs.getString("Username") %>">
                                <button type="submit" class="bg-red-500 text-white px-4 py-2 rounded">Delete</button>
                            </form>
                        </td>
                    </tr>
                    <% 
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            try { if (rs != null) rs.close(); } catch (Exception e) {}
                            try { if (stmt != null) stmt.close(); } catch (Exception e) {}
                            try { if (con != null) con.close(); } catch (Exception e) {}
                        }
                    %>
                </tbody>
            </table>
        </section>

        <!-- Review Management Table -->
        <section>
            <h2 class="text-2xl font-bold mb-4 text-white">Customer Reviews</h2>
            <table class="table-auto w-full border-collapse border border-gray-300 bg-white rounded-lg shadow">
                <thead class="bg-purple-400">
                    <tr>
                        <th class="px-6 py-3 border-b text-white">Name</th>
                        <th class="px-6 py-3 border-b text-white">Review</th>
                        <th class="px-6 py-3 border-b text-white">Rating</th>
                        <th class="px-6 py-3 border-b text-white">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        // Backend code to fetch data from MySQL table "review"
                        con = null;
                        stmt = null;
                        rs = null;
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/User_Details", "Sanket", "Sanket7044");
                            stmt = con.createStatement();
                            rs = stmt.executeQuery("SELECT id, name, stars, comment FROM review");
                            while (rs.next()) {
                    %>
                    <tr class="hover:bg-purple-50">
                        <td class="px-6 py-4 border-b text-center"><%= rs.getString("name") %></td>
                        <td class="px-6 py-4 border-b text-center"><%= rs.getString("comment") %></td>
                        <td class="px-6 py-4 border-b text-center"><%= rs.getString("stars") %></td>
                        <td class="px-6 py-4 border-b text-center">
                            <form action="delete_reviews" method="post" class="inline-block">
                                <input type="hidden" name="review_id" value="<%= rs.getInt("id") %>">
                                <button type="submit" class="bg-red-500 text-white px-4 py-2 rounded">Delete</button>
                            </form>
                        </td>
                    </tr>
                    <% 
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            try { if (rs != null) rs.close(); } catch (Exception e) {}
                            try { if (stmt != null) stmt.close(); } catch (Exception e) {}
                            try { if (con != null) con.close(); } catch (Exception e) {}
                        }
                    %>
                </tbody>
            </table>
        </section>
    </div>

    <!-- Popup Overlay -->
    <div id="overlay" class="overlay"></div>

    <!-- Edit Popup -->
    <div id="editPopup" class="popup">
        <h3 class="text-xl font-bold mb-4">Edit User</h3>
        <form action="edit_users" method="post">
            <input type="hidden" id="editUsername" name="username">
            <div class="mb-4">
                <label for="editEmail" class="block text-sm font-semibold mb-2">Email:</label>
                <input type="email" id="editEmail" name="email" class="w-full border-gray-300 rounded px-4 py-2">
            </div>
            <div class="text-right">
                <button type="button" onclick="closeEditPopup()" class="bg-gray-500 text-white px-4 py-2 rounded mr-2">Cancel</button>
                <button type="submit" class="bg-green-500 text-white px-4 py-2 rounded">Save</button>
            </div>
        </form>
    </div>

    <script>
        function openEditPopup(username, email) {
            document.getElementById('editUsername').value = username;
            document.getElementById('editEmail').value = email;
            document.getElementById('overlay').style.display = 'block';
            document.getElementById('editPopup').style.display = 'block';
        }

        function closeEditPopup() {
            document.getElementById('overlay').style.display = 'none';
            document.getElementById('editPopup').style.display = 'none';
        }
    </script>
</body>
</html>
