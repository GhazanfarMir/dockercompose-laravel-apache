FROM php:7.2.2-apache

MAINTAINER "Ghazanfar Mir" <GhazanfarMir@gmail.com>

ENV APACHE_DOCUMENT_ROOT /var/www/html/public

COPY composer-installer.sh /usr/local/bin/composer-installer
RUN apt-get update && apt-get install -y mysql-client \
    unzip \
    && docker-php-ext-install \
    pdo \
    pdo_mysql \
    mbstring \
    opcache

RUN chmod +x /usr/local/bin/composer-installer \
    && sleep 1 \
    && composer-installer \
    && mv composer.phar /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer \
#    && composer --version \
    && a2enmod rewrite

COPY config/php/php.ini /usr/local/etc/php/
COPY config/apache/vhost.conf /etc/apache2/sites-available/000-default.conf

# RUN chmod -R 777 storage bootstrap/cache