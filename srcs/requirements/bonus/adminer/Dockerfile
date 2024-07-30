FROM php:7.4-apache

RUN apt-get update && apt-get install -y \
    libsqlite3-dev \
    && docker-php-ext-install pdo_mysql pdo_sqlite

COPY tools/adminer.php /var/www/html/index.php

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN sed -i 's/80/4321/' /etc/apache2/ports.conf /etc/apache2/sites-available/000-default.conf

EXPOSE 4321

CMD ["apache2-foreground"]
