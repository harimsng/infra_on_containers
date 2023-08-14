FROM debian:buster

RUN apt-get update -y && apt-get install -y\
	mariadb-client\
	mariadb-server

RUN groupadd db_group\
	&& useradd -g db_group db_user
#USER db_user:db_group

WORKDIR /home/db_user/

RUN

COPY ./conf/.my.cnf ./
COPY ./tools/mariadb_entrypoint.sh ./

RUN mkdir mariadb

EXPOSE 3306/tcp

ENTRYPOINT ["bash"]
#ENTRYPOINT ["/bin/sh", "mariadb_entrypoint.sh"]
