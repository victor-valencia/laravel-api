# Utiliza la imagen oficial de PHP con Apache como base
FROM php:8.1-fpm

# Copia los archivos de la aplicación en la imagen
COPY . /var/www/html

# Establece el directorio de trabajo
WORKDIR /var/www/html

# Instala las dependencias necesarias
RUN apt-get update
RUN apt-get install -y unzip
RUN apt-get install -y git

# Copia la configuración de Apache para Laravel
COPY docker/apache.conf /etc/apache2/sites-available/000-default.conf

# Habilita el módulo rewrite de Apache
RUN a2enmod rewrite

# Instala las dependencias de Composer
COPY --from=composer:2.1.9 /usr/bin/composer /usr/bin/composer
#RUN rm composer.lock
RUN composer install

# Copia el archivo .env.example a .env
COPY .env.example .env

# Genera la clave de la aplicación
RUN php artisan key:generate

# Da permisos recursicos a storage
RUN chmod 777 -R storage/*

# Expone el puerto 80 para la conexión externa
EXPOSE 80 443