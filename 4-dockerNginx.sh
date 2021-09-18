set -x


echo "
FROM nginx:alpine

COPY src/nginx.conf /etc/nginx/nginx.conf

RUN apk update && apk add bash

" > target/nginx.dockerfile

docker build  -t nginx-mos -f target/nginx.dockerfile  .
docker run -p 80:80  -d --rm --name host80nginx --hostname=host80nginx -i nginx-mos
