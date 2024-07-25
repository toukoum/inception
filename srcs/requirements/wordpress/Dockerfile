# Utilisez l'image officielle Debian Buster comme base
FROM debian:bullseye

# Met à jour les paquets et installe wget, PHP 7.3, PHP-FPM, et MariaDB client
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y \
        php \
        php-fpm \
        php-mysql \
        php-cli \
        php-mbstring \
        gettext \
        mariadb-client \
        curl && \
    rm -rf /etc/php/7.4/fpm/pool.d/www.conf && \
    mkdir -p /run/php

# SCRIPTS & CONFS
COPY ./tools/entrypoint.sh /usr/local/bin/entrypoint.sh
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN chmod 755 /usr/local/bin/entrypoint.sh


# Expose le port 9000 pour PHP-FPM
EXPOSE 9000

# Démarre le script de configuration automatique puis PHP-FPM
ENTRYPOINT ["sh", "/usr/local/bin/entrypoint.sh"]
