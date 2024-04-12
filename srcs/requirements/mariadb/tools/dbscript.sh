#!/bin/bash

service mariadb start

echo "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWORD';" | mariadb

echo "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWORD';" | mariadb
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$DB_ROOT_PASSWORD';" | mariadb
echo "FLUSH PRIVILEGES;" | mariadb

echo "CREATE DATABASE $DB_NAME;" | mariadb

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld