FROM debian:buster

RUN apt-get update -y && apt-get install -y \
	curl\
	php7.3-fpm

WORKDIR /home

# Downloads wordpress cli
RUN	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar\
	&& php wp-cli.phar --info

WORKDIR 
COPY ./conf/php-fpm/php.ini /etc/php/7.3/fpm
COPY ./conf/php-fpm/pool.d/wordpress_pool.conf /etc/php/7.3/fpm/pool.d/

RUN groupadd wordpress_group\
	&& useradd -g wordpress_group wordpress_user
USER wordpress_user:wordpress_group

#RUN php /home/wp-cli.phar --allow-root core download --path=/home/wordpress_dir
RUN php /home/wp-cli.phar core download --path=/home/wordpress_dir

#COPY ./conf/wordpress/

EXPOSE 3306/tcp 8000/tcp

#ENTRYPOINT ["
