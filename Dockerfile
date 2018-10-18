# STAGE 1 - Build app in a Node container
FROM node:8.11.2-alpine as build
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install
COPY . .
RUN npm run build

# STAGE 2 - Deploy app build to a nginx container
FROM nginx:1.13.12-alpine
COPY --from=build /usr/src/app/dist/docker-test /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
