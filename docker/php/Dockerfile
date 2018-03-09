FROM php:7.2-apache

LABEL maintainer="GhazanfarMir@gmail.com"

ENV APACHE_DOCUMENT_ROOT /var/www/html/public

RUN apt-get update && apt-get install -y apt-utils \
    mysql-client \
    unzip \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libgd2-dev \
    libjpeg-dev \
    libgif-dev \
    && docker-php-ext-install \
    pdo \
    pdo_mysql \
    mbstring \
    opcache \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/  \
    && docker-php-ext-install -j$(nproc) gd \
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
