FROM php:7.2-apache

LABEL maintainer="GhazanfarMir@gmail.com"

ENV APACHE_DOCUMENT_ROOT /var/www/html/public

RUN apt-get update && apt-get install -y mysql-client \
    unzip \
    && docker-php-ext-install \
    pdo \
    pdo_mysql \
    mbstring \
    opcache \
    # Install Redis and xDebug
    && pecl install redis \
    && pecl install xdebug-2.6.0 \
    && docker-php-ext-enable redis xdebug \
    # Install Composer
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer --version \
    # Enable Rewrite
    && a2enmod rewrite

COPY config/php/php.ini /usr/local/etc/php/
COPY config/apache/vhost.conf /etc/apache2/sites-available/000-default.conf

# RUN chmod -R 777 storage bootstrap/cache