#!/bin/bash
set -e

echo "MYSQL_ROOT_PASSWORD RAF: $MYSQL_ROOT_PASSWORD"
echo "MYSQL_DATABASE RAF: $MYSQL_DATABASE"
echo "MYSQL_USER RAF: $MYSQL_USER"
echo "MYSQL_PASSWORD RAF: $MYSQL_PASSWORD"



if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initialisation de la base de données"
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

mysqld_safe --datadir=/var/lib/mysql &

# Attendre que MariaDB soit disponible
until mysqladmin ping --silent; do
    echo "Waiting for MariaDB..."
    sleep 2
done

mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%';"
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p${MYSQL_ROOT_PASSWORD} shutdown

exec mysqld_safe

