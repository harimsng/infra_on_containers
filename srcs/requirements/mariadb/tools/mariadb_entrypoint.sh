#!/bin/sh

sed -i 's/^/export /g' .env
. ./.env

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
GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'${DB_HOST}.${DB_NETWORK}' IDENTIFIED BY '${DB_PASSWD}' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

# stop temporary server
kill $!
wait $!

#TODO: error log
exec mysqld_safe --user=mysql --bind-address=0.0.0.0
