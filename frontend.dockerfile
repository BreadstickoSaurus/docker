FROM node:lts-alpine as build-stage

WORKDIR /app

COPY ./frontend/package*.json ./
RUN npm install

COPY ./frontend/ .
RUN npm run build

FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
# nginx gives 404 when browsing pages made with the vue router, this line prevents that
# see https://router.vuejs.org/guide/essentials/history-mode.html#nginx
RUN sed -i "9itry_files \$uri \$uri\/ \/index.html;" /etc/nginx/conf.d/default.conf

# TODO remove when bug fixed
RUN apk add mysql-client mariadb-connector-c

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]