# Utilisez l'image officielle Debian comme base
FROM debian:buster

# Met à jour les paquets et installe wget
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y wget

# Installer PHP et ses dépendances, ainsi que le client MariaDB
RUN apt-get install -y php7.3 \
    php-fpm \
    php-mysql \
    mariadb-client

# Installer WordPress
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www && \
    cd /var/www && \
    tar -xzf wordpress-6.0-fr_FR.tar.gz && \
    rm wordpress-6.0-fr_FR.tar.gz

# Donner les droits à root d'écrire dans le dossier WordPress
RUN chown -R root:root /var/www/wordpress

# Copier le fichier de configuration PHP
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# Installer wp-cli pour automatiser la configuration de WordPress
#RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
#    chmod +x wp-cli.phar && \
#    mv wp-cli.phar /usr/local/bin/wp

# Copier le script de configuration automatique
COPY tools/entrypoint.sh /usr/local/bin/

# Donner les permissions d'exécution au script
RUN chmod +x /usr/local/bin/entrypoint.sh

# Créer le répertoire /run/php
RUN mkdir -p /run/php && chown -R www-data:www-data /run/php

# Expose le port 9000 pour PHP-FPM
EXPOSE 9000

# Démarre le script de configuration automatique puis PHP-FPM
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["/usr/sbin/php-fpm7.3", "-F"]
