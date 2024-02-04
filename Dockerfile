FROM php:8.1.0-apache

WORKDIR /var/www/html

# re-write
RUN a2enmod rewrite

# library
RUN apt-get update -y && apt-get install -y \
    libicu-dev \
    libmariadb-dev \
    unzip zip \
    zlib1g-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev

# composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# # install Composer
# RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# php extension
RUN docker-php-ext-install gettext intl pdo_mysql gd

# extension with freetype and jpeg support
RUN docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

# apache config
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

# localhost server
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

EXPOSE 80

CMD ["apache2-foreground"]

ENV PORT=8000 

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

