FROM denoland/deno:alpine

WORKDIR /app

# this is needed to establish a client connection to the mysql db over TLS
# thanks Mr. De Smet for helping me find this
RUN apk add mariadb-connector-c

USER deno

COPY ./backend/deno.json .
RUN deno install

COPY ./backend/ .
# RUN deno cache main.ts
EXPOSE 8888

CMD ["run", "start"]