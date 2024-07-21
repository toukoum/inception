#!/bin/bash

# Démarre MariaDB en arrière-plan
service mysql start

# Crée la base de données et les utilisateurs
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"

# Arrête MariaDB pour qu'il puisse être relancé proprement
mysqladmin -u root -p${MYSQL_ROOT_PASSWORD} shutdown

# Lance MariaDB en mode sécurisé
exec mysqld_safe
