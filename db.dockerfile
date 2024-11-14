FROM mysql:latest

ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_PASSWORD

ENV MYSQL_DATABASE=$DB_NAME
ENV MYSQL_USER=$MYSQL_USER
ENV MYSQL_PASSWORD=$MYSQL_PASSWORD
ENV MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD

RUN echo "[mysqld]" >> /etc/my.cnf
RUN echo "bind-address=0.0.0.0" >> /etc/my.cnf

WORKDIR /scripts
COPY ./data .

RUN cat create.sql > /docker-entrypoint-initdb.d/init.sql && cat populate.sql >> /docker-entrypoint-initdb.d/init.sql && cat dbUser.sql >> /docker-entrypoint-initdb.d/init.sql

EXPOSE 3306