#!/bin/bash

# Démarrer PHP-FPM
#service php7.3-fpm start

## Attendre que MariaDB soit disponible
#sleep 10

## Variables d'environnement pour la configuration de WordPress
#MYSQL_DATABASE=${MYSQL_DATABASE:-wordpress}
#MYSQL_USER=${MYSQL_USER:-user}
#MYSQL_PASSWORD=${MYSQL_PASSWORD:-password}
#MYSQL_HOST=${MYSQL_HOST:-mariadb}

## Configurer WordPress si le fichier wp-config.php n'existe pas
#if [ ! -f /var/www/wordpress/wp-config.php ]; then
#    wp config create --allow-root \
#        --dbname=$MYSQL_DATABASE \
#        --dbuser=$MYSQL_USER \
#        --dbpass=$MYSQL_PASSWORD \
#        --dbhost=$MYSQL_HOST:3306 --path='/var/www/wordpress'
    
#    wp core install --allow-root \
#        --url="http://example.com" \
#        --title="WordPress Site" \
#        --admin_user="admin" \
#        --admin_password="admin_password" \
#        --admin_email="admin@example.com" --path='/var/www/wordpress'

#    wp user create --allow-root user user@example.com --role=author --user_pass=user_password --path='/var/www/wordpress'
#fi

# Créer le dossier /run/php s'il n'existe pas
#mkdir -p /run/php

# Démarrer PHP-FPM
#exec php-fpm7.3 -F


#!/bin/bash

# Créer le dossier /run/php s'il n'existe pas
mkdir -p /run/php
chown -R www-data:www-data /run/php

# Démarrer PHP-FPM
exec php-fpm7.3 -F