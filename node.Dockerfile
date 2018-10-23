FROM node:8.11.2-alpine

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

EXPOSE 9000