FROM tomcat:9.0

WORKDIR /usr/local/tomcat/webapps

RUN rm -rf ./ROOT/*

COPY . ./ROOT/

EXPOSE 8080

#Tomcat automatically run when built
