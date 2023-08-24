FROM debian:buster

EXPOSE 3306/tcp

# create system group and user to make their IDs get assigned consistently
RUN groupadd -r mysql && useradd -r -g mysql mysql

RUN apt-get update -y && apt-get install -y \
	mariadb-client-10.3 \
	mariadb-server-10.3 \
	&& mkdir -p /var/lib/mysql /var/run/mysqld \
	&& chown -R mysql:mysql /var/lib/mysql /var/run/mysqld \
	&& chmod 777 /var/run/mysqld

RUN /usr/bin/mysql_install_db --skip-test-db --user=mysql

WORKDIR /home/mysql/

COPY ./tools/mariadb_entrypoint.sh ./
COPY ./.env ./

ENTRYPOINT ["/bin/sh", "mariadb_entrypoint.sh"]
