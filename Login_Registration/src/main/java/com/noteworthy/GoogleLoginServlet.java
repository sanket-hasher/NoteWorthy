package com.noteworthy;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Collections;

import org.json.JSONException;
import org.json.JSONObject;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.gson.GsonFactory;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseToken;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/googlelogin")
public class GoogleLoginServlet extends HttpServlet {
    private static final String CLIENT_ID = "454600243556-0mafu7iaaqbtfvtq84p94alvl796fk69.apps.googleusercontent.com";
    private static final JsonFactory JSON_FACTORY = GsonFactory.getDefaultInstance();
    private static final String SERVICE_ACCOUNT_KEY_PATH = "E:\\NoteWorthy\\Login_Registration\\src\\main\\webapp\\eduler-aa8a6-firebase-adminsdk-elntt-ccdc67724b.json";

    @Override
    public void init() throws ServletException {
        try {
            if (FirebaseApp.getApps().isEmpty()) {
                FirebaseOptions options = new FirebaseOptions.Builder()
                        .setCredentials(GoogleCredentials.fromStream(new FileInputStream(SERVICE_ACCOUNT_KEY_PATH)))
                        .build();
                FirebaseApp.initializeApp(options);
                System.out.println("Firebase initialized successfully.");
            }
        } catch (IOException e) {
            throw new ServletException("Firebase initialization error", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "GET, POST, OPTIONS");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        System.out.println("Received POST request at /googlelogin");

        StringBuilder sb = new StringBuilder();
        String line;
        try (BufferedReader reader = request.getReader()) {
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
        }

        // Parse the ID token from the request body
        String idTokenString = null;
        try {
            JSONObject json = new JSONObject(sb.toString());
            idTokenString = json.getString("idToken"); // Extracting idToken from the JSON object
        } catch (JSONException e) {
            System.out.println("Error parsing JSON: " + e.getMessage());
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"success\": false, \"message\": \"Invalid JSON.\"}");
            return;
        }

        System.out.println("idTokenString: " + idTokenString);

        if (idTokenString == null || idTokenString.isEmpty()) {
            System.out.println("Missing ID token.");
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"success\": false, \"message\": \"Missing ID token.\"}");
            return;
        }

        try {
            GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(GoogleNetHttpTransport.newTrustedTransport(), JSON_FACTORY)
                    .setAudience(Collections.singletonList(CLIENT_ID))
                    .build();

            GoogleIdToken idToken = verifier.verify(idTokenString);
            if (idToken != null) {
                System.out.println("ID token verified successfully.");

                // Verify the ID token and get the Firebase token synchronously
                FirebaseToken firebaseToken = FirebaseAuth.getInstance().verifyIdToken(idTokenString).getResult();

                // User details
                String uid = firebaseToken.getUid();
                String email = firebaseToken.getEmail();
                String name = (String) firebaseToken.getClaims().get("name");

                System.out.println("User details - UID: " + uid + ", Email: " + email + ", Name: " + name);

                // Set user details in session
                HttpSession session = request.getSession();
                session.setAttribute("username", name);
                session.setAttribute("email", email);
                System.out.println("User details set in session.");

                // Return success response
                response.getWriter().write("{\"success\": true, \"redirectUrl\": \"main.jsp\", \"message\": \"Login successful.\"}");
                response.setStatus(HttpServletResponse.SC_OK);
            } else {
                System.out.println("Invalid ID token.");
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                response.getWriter().write("{\"success\": false, \"message\": \"Invalid ID token.\"}");
            }
        } catch (Exception e) {
            System.out.println("Error during token verification: " + e.getMessage());
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"success\": false, \"message\": \"An error occurred.\"}");
        }
    }
}
