# Multi-stage build: First stage for building WAR file
FROM maven:3.8.6-openjdk-11-slim AS builder

# Set working directory
WORKDIR /app

# Copy pom.xml and source code
COPY pom.xml .
COPY src/ src/
COPY web/ web/

# Build WAR file
RUN mvn clean package

# Second stage: Runtime with Tomcat
FROM tomcat:9.0-jdk11-openjdk

# Remove default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Create ROOT directory and extract WAR
COPY --from=builder /app/target/ch14_ex1_email.war /tmp/app.war
RUN mkdir -p /usr/local/tomcat/webapps/ROOT && \
    cd /usr/local/tomcat/webapps/ROOT && \
    jar -xf /tmp/app.war && \
    rm /tmp/app.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat with verbose logging
CMD ["catalina.sh", "run"]