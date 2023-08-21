FROM debian:buster

EXPOSE 3306/tcp

# create system group and user to make their IDs get assigned consistently
RUN groupadd -r mysql && useradd -r -g mysql mysql

RUN apt-get update -y && apt-get install -y \
	mariadb-client \
	mariadb-server \
	#&& rm -rf /var/lib/mysql \
	&& mkdir -p /var/lib/mysql /var/run/mysqld \
	&& chown -R mysql:mysql /var/lib/mysql /var/run/mysqld \
	&& chmod 777 /var/run/mysqld

WORKDIR /home/mysql/
RUN mkdir db

#COPY ./conf/.my.cnf ./
COPY ./tools/mariadb_entrypoint.sh ./

USER mysql:mysql

ENTRYPOINT ["/bin/sh", "mariadb_entrypoint.sh"]
