From tomcat:8.0.51-jre8-alpine
COPY /var/lib/jenkins/workspace/devops/build/libs/sampleWeb-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/
CMD ["catalina.sh","run"]