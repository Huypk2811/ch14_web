package murach.email;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import murach.business.User;
import murach.data.UserDB;
import murach.util.*;

public class EmailListServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // get current action
        String action = request.getParameter("action");
        if (action == null) {
            action = "join";  // default action
        }

        // perform action and set URL to appropriate page
        String url = "/index.jsp";        
        if (action.equals("join")) {
            url = "/index.jsp";    // the "join" page
        } 
        else if (action.equals("add")) {
            // get parameters from the request
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");

            // store data in User object
            User user = new User(firstName, lastName, email);
            UserDB.insert(user);
            request.setAttribute("user", user);
            
            // send email to user
            String to = email;
            String from = "huypk2811@gmail.com"; // App's Gmail address
            String subject = "Welcome to our email list";
            String body = "Dear " + firstName + ",\n\n" +
                "Thanks for joining our email list. We'll make sure to send " +
                "you announcements about new products and promotions.\n" +
                "Have a great day and thanks again!\n\n" +
                "Kelly Slivkoff\n" +
                "Mike Murach & Associates";
            boolean isBodyHTML = false;

            try {
                // Check if running on Render (production) vs local
                String renderEnv = System.getenv("RENDER");
                
                if (renderEnv != null) {
                    // DEMO MODE: Render blocks SMTP, so simulate email sending
                    System.out.println("=== DEMO MODE: EMAIL CONTENT ===");
                    System.out.println("TO: " + to);
                    System.out.println("FROM: " + from);
                    System.out.println("SUBJECT: " + subject);
                    System.out.println("BODY: " + body);
                    System.out.println("=== EMAIL SIMULATED SUCCESSFULLY ===");
                    
                    // Store email content to show on thanks page
                    request.setAttribute("emailSent", "DEMO");
                    request.setAttribute("emailContent", body);
                } else {
                    // LOCAL MODE: Actually send email
                    System.out.println("DEBUG: Attempting to send email to: " + to);
                    MailUtilGmail.sendMail(to, from, subject, body, isBodyHTML);
                    System.out.println("DEBUG: Email sent successfully!");
                    request.setAttribute("emailSent", "SUCCESS");
                }
                
            } catch (Exception e) {
                // Log error but don't crash the app
                System.err.println("ERROR: Failed to send email - " + e.getMessage());
                e.printStackTrace();
                
                // Log the email content to console for debugging
                System.out.println("=== EMAIL SENDING FAILED ===");
                System.out.println("TO: " + email);
                System.out.println("FROM: " + from);
                System.out.println("SUBJECT: " + subject);
                System.out.println("BODY: " + body);
                System.out.println("ERROR: " + e.getMessage());
                System.out.println("===========================");
                
                request.setAttribute("emailSent", "FAILED");
                request.setAttribute("errorMessage", e.getMessage());
            }
            
            url = "/thanks.jsp";
        }
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }    
}