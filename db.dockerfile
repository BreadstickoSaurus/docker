FROM mariadb:latest

ARG MYSQL_ROOT_PASSWORD

ENV MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD

WORKDIR /scripts
COPY ./data .

RUN cat create.sql > /docker-entrypoint-initdb.d/init.sql && cat populate.sql >> /docker-entrypoint-initdb.d/init.sql && cat dbUser.sql >> /docker-entrypoint-initdb.d/init.sql

EXPOSE 3306