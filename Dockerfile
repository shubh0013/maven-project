FROM tomcat:9.0-jre8-alpine

# Remove the default Tomcat webapps to prepare for your application
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the JAR or WAR file from the "server" directory to the Tomcat webapps directory
COPY server/target/*.jar /usr/local/tomcat/webapps/ROOT.jar
COPY server/target/*.war /usr/local/tomcat/webapps/ROOT.war

# Expose the port that Tomcat will run on (usually 8080)
EXPOSE 8080

# Start Tomcat when the container starts
CMD ["catalina.sh", "run"]
