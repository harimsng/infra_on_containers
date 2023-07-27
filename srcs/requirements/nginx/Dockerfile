FROM debian:buster

RUN apt-get update -y && apt-get install -y \
	net-tools\
	nginx\
	openssl\
	vim

WORKDIR /etc/nginx/

RUN mkdir ssl
RUN openssl req -x509 -newkey rsa:4096 -keyout /etc/nginx/ssl/hseong.42.fr.key \
-out /etc/nginx/ssl/hseong.42.fr.crt -sha256 -days 365 -nodes \
-subj "/C=XX/ST=Seoul/L=Seoul/O=42Seoul/CN=hseong.42.fr"

COPY ./conf/nginx.conf ./
COPY ./conf/hseong.42.fr.conf ./conf.d/

WORKDIR /home/
