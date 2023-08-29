php wp-cli.phar core download --allow-root --path=${WP_PATH}
php wp-cli.phar config create --dbuser=${DB_USER} --dbpass=${DB_USER_PASSWD} --dbname=${DB_NAME} --dbhost=${DB_HOST} --skip-check --allow-root --path=${WP_PATH}
php wp-cli.phar core install --url=${DOMAIN_NAME} --title=hseong --admin_user=halim --admin_email=halim9512@naver.com --allow-root --path=${WP_PATH}
php wp-cli.phar user update halim --user_pass=42seoul! --allow-root --path=${WP_PATH}
php wp-cli.phar user create hseong hseong@student.42seoul.kr --role=subscriber --user_pass=hseong --allow-root --path=${WP_PATH}

service php7.3-fpm start
service php7.3-fpm status
service php7.3-fpm stop

exec php-fpm7.3 --nodaemonize
