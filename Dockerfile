FROM php:8.1-fpm

# Copy composer.lock and composer.json
COPY composer.lock composer.json /var/www/

# Set working directory
WORKDIR /var/www

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl \
    libonig-dev \
    libzip-dev \
    libgd-dev
# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
#Mine

# Install extensions
RUN docker-php-ext-install pdo_mysql mbstring zip exif pcntl
RUN docker-php-ext-configure gd --with-external-gd
RUN docker-php-ext-install gd

# Install composer
#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Add user for laravel application
#RUN groupadd -g 1000 www
#RUN useradd -u 1000 -ms /bin/bash -g www www

# COMPOSER
ENV COMPOSER_ALLOW_SUPERUSER 1
# Obtiene composer usando multi-stage build
COPY --from=composer:2.4 /usr/bin/composer /usr/bin/composer
RUN composer install

# Copia los archivos de tu aplicación Laravel al contenedor
COPY . /var/www/html

# Copy existing application directory permissions
##COPY --chown=www:www . /var/www



# Copia el archivo .env.example a .env
COPY .env.example .env

# Genera la clave de la aplicación
RUN php artisan key:generate

# Change current user to www
#USER www

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]