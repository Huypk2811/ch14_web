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
                // Using Gmail utility to send real email
                MailUtilGmail.sendMail(to, from, subject, body, isBodyHTML);
            } catch (Exception e) {
                String errorMessage = 
                    "ERROR: Unable to send email. " + 
                        "Check Tomcat logs for details.<br>" +
                    "NOTE: You may need to configure your Gmail credentials " + 
                        "as described in the setup guide.<br>" +
                    "ERROR MESSAGE: " + e.getMessage();
                request.setAttribute("errorMessage", errorMessage);
                
                // Log the email content to console for debugging
                System.out.println("=== EMAIL SENDING FAILED ===");
                System.out.println("TO: " + email);
                System.out.println("FROM: " + from);
                System.out.println("SUBJECT: " + subject);
                System.out.println("BODY: " + body);
                System.out.println("ERROR: " + e.getMessage());
                System.out.println("===========================");
            }
            
            url = "/thanks.jsp";
        }
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }    
}