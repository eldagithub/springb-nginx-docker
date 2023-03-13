docker stop `docker ps -q -f "name=host808"`
docker rm `docker ps -q -f "name=host808"`
docker rmi `docker images sbprj -q`


echo '
FROM openjdk:8-jdk-alpine
VOLUME /tmp
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-Dserver.port=${SPRINGB_PORT}","-jar","/app.jar","BOOT-INF/classes/com/fincorp/SpringBootHelloWorldExampleApplication"]
#ENTRYPOINT ["java","-Dserver.port=8086", "-jar","/app.jar","BOOT-INF/classes/com/fincorp/SpringBootHelloWorldExampleApplication"]
#ENTRYPOINT ["java", "-jar","/app.jar","BOOT-INF/classes/com/fincorp/SpringBootHelloWorldExampleApplication"]
' > target/Dockerfile



DATE=$(date +"%Y_%m_%d_%H-%M")
docker build -t sbprj -f target/Dockerfile .


echo '
FROM openjdk:11-jdk-slim
WORKDIR /app
RUN groupadd -g 10001 gs2ipgm &&   useradd -u 10001 -g gs2ipgm us2ipgm
COPY target/*.jar app.jar

RUN chown us2ipgm:gs2ipgm app.jar

USER us2ipgm


#ENTRYPOINT ["java", "-jar", "app.jar", "--spring.config.location=${MYSBCONFIGLOCATION}", "--spring.config.name=${MYSBCONFIGNAME}"]
ENTRYPOINT ["java", "-jar", "app.jar"]


' >  target/DockerfileNonRoot


docker build -t sbprjnonroot -f target/DockerfileNonRoot .
mkdir logs
chmod 777 logs



docker save sbprj:latest -o target/sbprj-docimages.tar


echo docker rmi `docker images sbprj -q`
docker stop `docker ps -q -f "name=host808"`
docker rm `docker ps -q -f "name=host808"`
docker rmi `docker images sbprj -q`



