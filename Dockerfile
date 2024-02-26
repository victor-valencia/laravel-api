# Utiliza la imagen oficial de PHP con Apache como base
FROM php:8.1-apache

# Copia los archivos de la aplicación en la imagen
COPY . /var/www/html

# Establece el directorio de trabajo
WORKDIR /var/www/html

# Instala las dependencias necesarias
#RUN apt-get update && apt-get install -y \
#     libonig-dev \
#     libzip-dev \
#     unzip \
#     nano \
#     && docker-php-ext-install zip \
#     && docker-php-ext-enable zip \
#     && docker-php-ext-install pdo_mysql \
#     && docker-php-ext-install mbstring \
#     && docker-php-ext-install gd

RUN apt-get update
RUN apt-get install -y libonig-dev
RUN apt-get install -y libzip-dev
RUN apt-get install -y libpng-dev
RUN apt-get install -y libicu-dev
RUN apt-get install -y unzip
RUN apt-get install -y nano
RUN docker-php-ext-install zip
RUN docker-php-ext-enable zip
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install gd
RUN docker-php-ext-install intl

# Copia la configuración de Apache para Laravel
#COPY docker/apache.conf /etc/apache2/sites-available/000-default.conf

# Habilita el módulo rewrite de Apache
#RUN a2enmod rewrite

# Instala las dependencias de Composer
#COPY --from=composer:2 /usr/bin/composer /usr/bin/composer
#RUN rm composer.lock
RUN composer install

# Copia el archivo .env.example a .env
#COPY .env.example .env

# Genera la clave de la aplicación
#RUN php artisan key:generate

# Da permisos recursicos a storage
#RUN chmod 777 -R storage/*

# Expone el puerto 80 para la conexión externa
EXPOSE 80 443