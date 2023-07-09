FROM tomcat:10.1-jdk11-openjdk-slim

COPY ./src/main/webapp /usr/local/tomcat/webapps/ROOT

EXPOSE 8080
