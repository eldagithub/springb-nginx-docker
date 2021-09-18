
docker load -i target/sbprj-docimages.tar  

docker run -d --rm --name host8088 -h host8088 -p 8088:8088 -e APP_VER="APP.V0.0.1" -e SPRINGB_PORT=8088 -e APP_FILE_CONFIG_PATH=/etc/os-release sbprj:latest
docker run -d --rm --name host8082 -h host8082 -p 8082:8088 -e APP_VER="APP.V0.0.1" -e SPRINGB_PORT=8088 sbprj:latest

#java -jar target/springb-0.0.1.jar --server.port=8086 BOOT-INF/classes/com/fincorp/SpringBootHelloWorldExampleApplication

#docker run -d --rm --name host8083 -h host8083 -p 8083:8088 sbprj:latest
#docker run -d --rm --name host8084 -h host8084 -p 8084:8088 sbprj:latest
