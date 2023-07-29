FROM debian:buster

RUN apt-get update -y && apt-get install -y \
	curl\
	php7.3-fpm\
	vim

WORKDIR /tmp

RUN curl -O https://wordpress.org/latest.tar.gz\
	&& tar -xzvf latest.tar.gz
RUN	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar\
	&& php wp-cli.phar --info

