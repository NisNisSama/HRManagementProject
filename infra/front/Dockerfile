FROM tomcat:9.0

WORKDIR /usr/local/tomcat/webapps

ARG SRC_DIR=Front

RUN rm -rf ./ROOT/*

COPY ${SRC_DIR}/ ./ROOT/

EXPOSE 8080

#Tomcat automatically run when built
