FROM debian:buster

RUN apt-get update -y && apt-get install -y \
	curl\
	php7.3-fpm

WORKDIR /home

# Downloads wordpress cli
RUN	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN php wp-cli.phar --info

WORKDIR /etc/php/7.3/fpm

#RUN groupadd wordpress_user
#RUN useradd -g wordpress_user wordpress_user

COPY ./conf/php-fpm/php.ini ./
COPY ./conf/php-fpm/pool.d/wordpress_pool.conf ./pool.d/

RUN php /home/wp-cli.phar core download --path=/var/www/wordpress_dir

#COPY ./conf/wordpress/

#ENTRYPOINT ["
