# Simplified single-stage build
FROM tomcat:9.0-jdk11-openjdk

# Install Maven
RUN apt-get update && \
    apt-get install -y maven && \
    rm -rf /var/lib/apt/lists/*

# Remove default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Set working directory
WORKDIR /app

# Copy source code
COPY . .

# Build WAR file quickly
RUN mvn clean package -q -DskipTests && \
    mkdir -p /usr/local/tomcat/webapps/ROOT && \
    cd /usr/local/tomcat/webapps/ROOT && \
    jar -xf /app/target/ch14_ex1_email.war && \
    rm -rf /app

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]