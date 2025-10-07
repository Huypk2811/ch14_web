<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Murach's Java Servlets and JSP</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>    
</head>

<body>
    <h1>Thanks for joining our email list</h1>

    <p>Here is the information that you entered:</p>

    <label>Email:</label>
    <span>${user.email}</span><br>
    <label>First Name:</label>
    <span>${user.firstName}</span><br>
    <label>Last Name:</label>
    <span>${user.lastName}</span><br>

    <!-- Show email status -->
    <div style="margin-top: 20px; padding: 15px; border-radius: 5px;">
        <% String emailSent = (String) request.getAttribute("emailSent"); %>
        <% if ("SUCCESS".equals(emailSent)) { %>
            <div style="background-color: #d4edda; border: 1px solid #c3e6cb; color: #155724;">
                ✅ <strong>Email sent successfully!</strong> Check your inbox.
            </div>
        <% } else if ("DEMO".equals(emailSent)) { %>
            <div style="background-color: #fff3cd; border: 1px solid #ffeeba; color: #856404;">
                📧 <strong>DEMO MODE:</strong> Email sending simulated (Render free tier blocks SMTP)
                <br><br>
                <strong>Email content that would be sent:</strong><br>
                <div style="background-color: #f8f9fa; padding: 10px; margin-top: 10px; border-left: 3px solid #007bff;">
                    ${emailContent}
                </div>
            </div>
        <% } else if ("FAILED".equals(emailSent)) { %>
            <div style="background-color: #f8d7da; border: 1px solid #f5c6cb; color: #721c24;">
                ❌ <strong>Email sending failed:</strong> ${errorMessage}
            </div>
        <% } %>
    </div>

    <p>To enter another email address, click on the Back 
    button in your browser or the Return button shown 
    below.</p>

    <form action="" method="post">
        <input type="hidden" name="action" value="join">
        <input type="submit" value="Return">
    </form>

    <p><i>${errorMessage}</i></p>
    
</body>
</html>