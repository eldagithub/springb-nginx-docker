
FROM nginx:alpine

COPY src/nginx.conf /etc/nginx/nginx.conf

RUN apk update && apk add bash


