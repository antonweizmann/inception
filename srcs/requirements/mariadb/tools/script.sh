#!/bin/bash

mysqld_safe --skip-networking &

while ! mysqladmin ping --silent; do
    echo "Waiting for MariaDB to start..."
    sleep 5
done

mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

#mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysql -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${SQL_ROOT_PASSWORD}');"

mysql -e "FLUSH PRIVILEGES;"

sleep 10

mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

exec mysqld_safe
