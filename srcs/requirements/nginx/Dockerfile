FROM debian:buster

EXPOSE 443/tcp

RUN groupadd -r nginx && useradd -r -g nginx nginx

RUN apt-get update -y && apt-get install -y \
	nginx\
	openssl

WORKDIR /etc/nginx/

RUN mkdir /etc/nginx/ssl && mkdir -p /home/nginx/volume/data /home/nginx/volume/log
RUN openssl req -x509 -newkey rsa:4096 -keyout /etc/nginx/ssl/hseong.42.fr.key \
-out /etc/nginx/ssl/hseong.42.fr.crt -sha256 -days 365 -nodes \
-subj "/C=XX/ST=Seoul/L=Seoul/O=42Seoul/CN=hseong.42.fr"

COPY ./conf/nginx.conf ./
COPY ./conf/conf.d/hseong.42.fr.conf ./conf.d/

USER nginx:nginx

ENTRYPOINT ["nginx"]
