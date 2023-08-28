#!/bin/sh

# start temporary server
mysqld&
service mysql status
while [ $? = 3 ]; do sleep 1; service mysql status; done

#TODO: grant necessary privileges only
mysql <<EOF
UPDATE mysql.user SET Password=PASSWORD('mysql') WHERE User='root';
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE IF EXISTS test;
CREATE DATABASE ${DB_NAME} CHARACTER SET='utf8mb4' COLLATE='utf8mb4_general_ci';
CREATE USER '${DB_ADMIN}'@localhost IDENTIFIED BY '${DB_ADMIN_PASSWD}';
CREATE USER '${DB_USER}'@'${WP_HOST}.${DB_NETWORK}' IDENTIFIED BY '${DB_USER_PASSWD}';
GRANT ALL PRIVILEGES ON *.* TO '${DB_ADMIN}'@'localhost' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'${WP_HOST}.${DB_NETWORK}';
FLUSH PRIVILEGES;
EOF

# stop temporary server
kill $!
wait $!

#TODO: error log
exec mysqld_safe --user=mysql --bind-address=0.0.0.0
