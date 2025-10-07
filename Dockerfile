# Use official Tomcat image with JDK 11
FROM tomcat:9.0-jdk11-openjdk

# Remove default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy our WAR file to Tomcat webapps directory
COPY target/ch14_ex1_email.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]