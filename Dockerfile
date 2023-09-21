# Use an official Tomcat image as a parent image
FROM tomcat:9.0-jre8-alpine

# Remove the default Tomcat webapps to prepare for your application
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR file from your Maven build to the Tomcat webapps directory
COPY target/webapp.war /usr/local/tomcat/webapps/ROOT.war

# Expose the port that Tomcat will run on (usually 8080)
EXPOSE 8080

# Start Tomcat when the container starts
CMD ["catalina.sh", "run"]
