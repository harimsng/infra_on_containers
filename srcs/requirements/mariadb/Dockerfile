FROM debian:buster

RUN apt-get update -y && apt-get install -y
	mariadb-server

COPY ./conf/hseong.42.fr.conf /etc/mysql/mariadb.conf.d/
