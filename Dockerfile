FROM tomcat:9-jre8-alpine
WORKDIR webapps
COPY ./build/libs/sampleWeb-0.0.1-SNAPSHOT.war .
RUN rm -rf ROOT && mv sampleWeb-0.0.1-SNAPSHOT.war ROOT.war
