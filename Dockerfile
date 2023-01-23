From tomcat
COPY /home/bharat/learndevops/learnDevops/sampleWeb-0.0.1-SNAPSHOT.war .
ADD  sampleWeb-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/
CMD ["catalina.sh","run"]
