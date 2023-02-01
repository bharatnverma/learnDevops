FROM tomcat:9
WORKDIR webapps
COPY ./build/libs/sampleWeb-0.0.1-SNAPSHOT.war .
EXPOSE 8080
RUN rm -rf ROOT && mv sampleWeb-0.0.1-SNAPSHOT.war ROOT.war