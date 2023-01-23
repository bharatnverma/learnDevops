From tomcat as build
COPY /var/lib/jenkins/workspace/devops/build/libs/sampleWeb-0.0.1-SNAPSHOT.war .
ADD  sampleWeb-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/
CMD ["catalina.sh","run"]
