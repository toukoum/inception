#!/bin/bash

#!/bin/bash

echo "Starting WordPress configuration"

# Afficher les variables d'environnement pour débogage
echo "MYSQL_DATABASE: $MYSQL_DATABASE"
echo "MYSQL_USER: $MYSQL_USER"
echo "MYSQL_PASSWORD: $MYSQL_PASSWORD"
echo "WORDPRESS_DB_HOST: $WORDPRESS_DB_HOST"
echo "DOMAIN_NAME: $DOMAIN_NAME"
echo "WP_ADMIN_USER: $WP_ADMIN_USER"
echo "WP_ADMIN_PASSWORD: $WP_ADMIN_PASSWORD"
echo "WP_ADMIN_EMAIL: $WP_ADMIN_EMAIL"

if [ -f "$WP_PATH/wp-config.php" ]; then
    echo "WordPress already installed"
else
    # Télécharger WP-CLI
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp

    # Télécharger et configurer WordPress
    wp core download --path=$WP_PATH --allow-root
	cd $WP_PATH
    # Configuration de WordPress
    wp config create --allow-root \
        --dbname=$MYSQL_DATABASE \
        --dbuser=$MYSQL_USER \
        --dbpass=$MYSQL_PASSWORD \
        --dbhost=$WORDPRESS_DB_HOST:3306 \
        --path=$WP_PATH

    wp core install --allow-root \
        --url="$DOMAIN_NAME" \
        --title="WordPress Site" \
        --admin_user="$WP_ADMIN_USER" \
        --admin_password="$WP_ADMIN_PASSWORD" \
        --admin_email="$WP_ADMIN_EMAIL" \
        --path=$WP_PATH

	wp user create $WP_USER $WP_USER_EMAIL --role=editor --user_pass=$WP_USER_PASSWORD --allow-root


    #redis
    wp plugin install redis-cache --activate --allow-root
    wp config set WP_REDIS_HOST ${REDIS_HOST} --allow-root
    wp config set WP_REDIS_PORT ${REDIS_PORT} --allow-root
    wp config set WP_CACHE true --raw --allow-root
	wp config set WP_REDIS_HOST redis --allow-root
    wp redis enable --allow-root
fi

echo "lancement de php-fpm"

/usr/sbin/php-fpm7.4 -F
