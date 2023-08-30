#!/bin/sh

envsubst < /etc/mysql/debian.cnf.temp > /etc/mysql/debian.cnf
rm /etc/mysql/debian.cnf.temp

# start temporary server
mysqld&
service mariadb status
while [ $? = 3 ]; do sleep 1; service mariadb status; done

mysql <<EOF
SET old_passwords=0;
ALTER USER root@localhost IDENTIFIED BY '${DB_ROOT_PASSWD}';
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE IF EXISTS test;
CREATE DATABASE ${DB_NAME} CHARACTER SET='utf8mb4' COLLATE='utf8mb4_general_ci';
CREATE USER '${DB_USER}'@'${WP_HOST}.${DB_NETWORK}' IDENTIFIED BY '${DB_USER_PASSWD}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'${WP_HOST}.${DB_NETWORK}';
FLUSH PRIVILEGES;
EOF

# stop temporary server
kill $!
wait $!

exec mysqld --user=mysql --bind-address=0.0.0.0
