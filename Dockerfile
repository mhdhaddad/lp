FROM php:8.2.13

LABEL org.opencontainers.image.source=https://github.com/mhdhaddad/lp

RUN apt-get update -yqq
RUN apt-get install git libcurl4-gnutls-dev libicu-dev libmcrypt-dev libvpx-dev libjpeg-dev libpng-dev libxpm-dev zlib1g-dev libfreetype6-dev libxml2-dev libexpat1-dev libbz2-dev libgmp3-dev libldap2-dev unixodbc-dev libpq-dev libsqlite3-dev libaspell-dev libsnmp-dev libpcre3-dev libtidy-dev libonig-dev libzip-dev libfreetype-dev libjpeg62-turbo-dev -yqq
RUN docker-php-ext-install gd zip
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install -j$(nproc) gd
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug
RUN curl -sS https://getcomposer.org/installer | php
