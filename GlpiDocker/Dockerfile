FROM php:8.2-apache

# Instalar extensiones de PHP requeridas y opcionales para GLPI
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libzip-dev \
        libcurl4-openssl-dev \
        libonig-dev \
        libxml2-dev \
        zlib1g-dev \
        libbz2-dev \
        libexif-dev \
        libldap2-dev \
        libssl-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install pdo_mysql mysqli curl intl zip bz2 exif ldap opcache

# Descargar y descomprimir GLPI
ADD https://github.com/glpi-project/glpi/releases/download/10.0.10/glpi-10.0.10.tgz /var/www/html/
WORKDIR /var/www/html
RUN tar -xzvf glpi-10.0.10.tgz && rm glpi-10.0.10.tgz

# Configurar permisos
RUN chown -R www-data:www-data /var/www/html/glpi

# Exponer el puerto 80
EXPOSE 80
