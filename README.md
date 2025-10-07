# 📧 Email List Application

A Java Servlet/JSP web application that allows users to join an email list and receive welcome emails via Gmail SMTP.

## 🌟 Features

- **Email List Registration**: Users can join the email list by providing their details
- **Real Gmail Integration**: Sends actual emails using Gmail SMTP
- **Responsive Design**: Clean and user-friendly interface
- **Docker Support**: Ready for containerized deployment
- **Render.com Ready**: Configured for easy cloud deployment

## 🚀 Live Demo

Access the live application: [https://ch14-email-app.onrender.com/](https://ch14-email-app.onrender.com/)

## 🛠️ Technology Stack

- **Backend**: Java Servlets, JSP
- **Email**: JavaMail API with Gmail SMTP
- **Build Tool**: Maven
- **Server**: Apache Tomcat 9
- **Containerization**: Docker
- **Deployment**: Render.com

## 📋 Prerequisites

- Java 11 or higher
- Maven 3.6+
- Docker (for containerized deployment)
- Gmail account with 2FA and App Password

## ⚙️ Local Setup

### 1. Clone Repository
```bash
git clone https://github.com/Huypk2811/ch14_web.git
cd ch14_web
```

### 2. Configure Gmail Credentials
Update `src/java/murach/util/MailUtilGmail.java`:
```java
return new PasswordAuthentication("your-email@gmail.com", "your-app-password");
```

### 3. Build and Run
```bash
# Build WAR file
mvn clean package

# Deploy to Tomcat
cp target/ch14_ex1_email.war $TOMCAT_HOME/webapps/

# Or run with Docker
docker build -t email-app .
docker run -p 8080:8080 email-app
```

### 4. Access Application
```
http://localhost:8080/ch14_ex1_email/
```

## 🐳 Docker Deployment

### Build and Run Locally
```bash
mvn clean package
docker build -t ch14-email-app .
docker run -p 8080:8080 ch14-email-app
```

### Deploy to Render.com
1. Fork this repository
2. Connect to Render.com
3. Create new Web Service
4. Configure environment variables
5. Deploy automatically from GitHub

## 📧 How It Works

1. **User visits the application** and fills out the email form
2. **Form submission** triggers the EmailListServlet
3. **Servlet validates** user input and creates User object
4. **MailUtilGmail** sends welcome email via Gmail SMTP
5. **User receives email** and sees confirmation page

## 🔧 Configuration

### Gmail Setup (Required)
1. Enable 2-Factor Authentication
2. Generate App Password
3. Update credentials in `MailUtilGmail.java`

### Environment Variables (Production)
- `GMAIL_USER`: Your Gmail address
- `GMAIL_APP_PASSWORD`: Gmail app-specific password

## 📁 Project Structure

```
ch14_web/
├── src/
│   ├── java/murach/
│   │   ├── business/User.java
│   │   ├── data/UserDB.java
│   │   ├── email/EmailListServlet.java
│   │   └── util/MailUtilGmail.java
│   └── conf/MANIFEST.MF
├── web/
│   ├── index.jsp
│   ├── thanks.jsp
│   ├── styles/main.css
│   └── WEB-INF/web.xml
├── Dockerfile
├── pom.xml
└── README.md
```

## 🧪 Testing

### Test Email Functionality
1. Fill out the form with a real email address
2. Submit the form
3. Check your email inbox for the welcome message
4. Verify the thanks page displays correctly

### Test Cases
- Valid email addresses (Gmail, Yahoo, Outlook)
- Invalid email formats
- Empty form fields
- Special characters in names

## 🔒 Security

- Gmail credentials use App Passwords (not main password)
- Input validation on all form fields
- No sensitive data stored in code repository
- Environment variables for production secrets

## 🚀 Deployment

### Render.com Deployment
This application is configured for easy deployment on Render.com:

1. **Connect GitHub**: Link your forked repository
2. **Configure Build**: Maven automatically builds the WAR file
3. **Docker Container**: Runs in Tomcat container
4. **Environment Variables**: Set Gmail credentials securely
5. **Auto-Deploy**: Updates automatically from GitHub pushes

## 📄 License

This project is part of a learning exercise based on Murach's Java Servlets and JSP.

## 🤝 Contributing

1. Fork the repository
2. Create feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open Pull Request

## 📞 Support

For questions or issues, please open an issue on GitHub or contact the repository owner.

---

Made with ❤️ by [Huypk2811](https://github.com/Huypk2811)