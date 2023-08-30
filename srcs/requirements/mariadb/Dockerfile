FROM debian:bullseye

EXPOSE 3306/tcp

# create system group and user to make their IDs get assigned consistently
RUN groupadd -r mysql && useradd -r -g mysql mysql

RUN apt-get update -y && apt-get install -y \
	gettext \
	mariadb-client-10.5 \
	mariadb-server-10.5 \
	&& mkdir -p /var/lib/mysql /var/run/mysqld \
	&& chown -R mysql:mysql /var/lib/mysql /var/run/mysqld \
	&& chmod 777 /var/run/mysqld

RUN /usr/bin/mysql_install_db --skip-test-db --user=mysql

COPY ./conf/debian.cnf /etc/mysql/debian.cnf.temp
COPY ./tools/mariadb_entrypoint.sh /home/mysql/

ENTRYPOINT ["/bin/sh", "/home/mysql/mariadb_entrypoint.sh"]
