#!/bin/sh

# start temporary server
mysqld&
service mysql status
while [ $? = 3 ]; do sleep 1; service mysql status; done

mysql <<EOF
UPDATE mysql.user SET Password=PASSWORD('mysql') WHERE User='root';
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE IF EXISTS test;
GRANT ALL PRIVILEGES ON *.* TO 'mysql'@'wordpress' IDENTIFIED BY 'mysql' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

# stop temporary server
kill $!
wait $!

exec mysqld_safe --user=mysql --bind-address=0.0.0.0
