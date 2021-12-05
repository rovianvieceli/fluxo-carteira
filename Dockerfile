FROM php:fpm

RUN apt-get update -y && apt-get install -y libpq-dev libzip-dev libfreetype6-dev libjpeg62-turbo-dev libonig-dev libpng-dev iputils-ping libxml2-dev unixodbc-dev
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install pdo pdo_mysql zip calendar mysqli mbstring exif pcntl bcmath
RUN docker-php-ext-install -j$(nproc) gd

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN chmod 777 -R /var/www/

WORKDIR /var/www/public
