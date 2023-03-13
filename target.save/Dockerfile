
FROM openjdk:8-jdk-alpine
VOLUME /tmp
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-Dserver.port=8081","-jar","/app.jar","BOOT-INF/classes/com/fincorp/SpringBootHelloWorldExampleApplication"]

