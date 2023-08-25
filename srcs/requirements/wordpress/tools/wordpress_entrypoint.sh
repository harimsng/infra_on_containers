php wp-cli.phar core download
php wp-cli.phar config create --dbuser=mysql --dpass=mysql --dbname=wp --dbhost=mariadb --skip-check
php wp-cli.phar core install --url=localhost:8000 --title=hseong --admin_user=halim --admin_email=halim9512@naver.com

exec bash
