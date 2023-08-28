FROM debian:buster

# 3306 mariadb, 9000 php-fpm for nginx
EXPOSE 3306/tcp 9000/tcp

RUN groupadd wp && useradd -g wp wp

RUN apt-get update -y && apt-get install -y \
	curl \
	php7.3-fpm \
	php7.3-mysql

WORKDIR /home/wp/

# Downloads wordpress cli
RUN	mkdir -p /var/www/html/ \
	&& curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& php wp-cli.phar --info \
	&& chown -R wp:wp /home/wp && chmod 777 -R /home/wp \
	&& rm /etc/php/7.3/fpm/pool.d/www.conf

COPY ./tools/wordpress_entrypoint.sh ./
COPY ./conf/php.ini /etc/php/7.3/fpm/
COPY ./conf/php-fpm.conf /etc/php/7.3/fpm/
COPY ./conf/wp.conf /etc/php/7.3/fpm/pool.d/

ENTRYPOINT ["/bin/sh", "wordpress_entrypoint.sh"]
