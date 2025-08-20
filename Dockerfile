
FROM tomcat:9.0.100-jdk8-corretto
COPY target/myapp.war /usr/local/tomcat/webapps/
