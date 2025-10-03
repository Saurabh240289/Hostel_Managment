# Use official Tomcat base image
FROM tomcat:9-jdk11

# Copy your WAR file from target folder to Tomcat webapps
COPY target/*.war /usr/local/tomcat/webapps/

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
