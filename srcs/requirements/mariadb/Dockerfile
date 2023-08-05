FROM debian:buster

EXPOSE 3306/tcp

RUN apt-get update -y && apt-get install -y\
	mariadb-client\
	mariadb-server

WORKDIR /home

COPY ./conf/.my.cnf /root/
COPY ./tools/starter.sh ./

RUN mkdir mariadb

ENTRYPOINT ["/bin/sh", "starter.sh"] 
