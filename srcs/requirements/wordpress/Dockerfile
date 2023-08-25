FROM debian:buster

EXPOSE 3306/tcp 8000/tcp

RUN groupadd wp && useradd -g wp wp

RUN apt-get update -y && apt-get install -y \
	curl \
	php7.3-fpm \
	php7.3-mysql

WORKDIR /home/wp

# Downloads wordpress cli
RUN	mkdir data \
	&& curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& php wp-cli.phar --info \
	&& chown -R wp:wp /home/wp && chmod 777 -R /home/wp

COPY ./tools/wordpress_entrypoint.sh ./
#COPY ./conf/php-fpm/php.ini /etc/php/7.3/fpm
#COPY ./conf/php-fpm/pool.d/wordpress_pool.conf /etc/php/7.3/fpm/pool.d/

ENTRYPOINT ["/bin/sh", "wordpress_entrypoint.sh"]

#COPY ./conf/wordpress/

#ENTRYPOINT ["
