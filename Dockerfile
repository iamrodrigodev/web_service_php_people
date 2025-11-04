FROM php:8.2-apache

RUN docker-php-ext-install pdo pdo_mysql

RUN a2enmod rewrite

RUN echo "display_errors = Off" >> /usr/local/etc/php/php.ini-production && \
    echo "error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT" >> /usr/local/etc/php/php.ini-production && \
    cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini

COPY . /var/www/html/

RUN echo '<?php' > /var/www/html/datos/login_mysql.php && \
    echo '/**' >> /var/www/html/datos/login_mysql.php && \
    echo ' * Provee las constantes para conectarse a la base de datos' >> /var/www/html/datos/login_mysql.php && \
    echo ' * Mysql.' >> /var/www/html/datos/login_mysql.php && \
    echo ' */' >> /var/www/html/datos/login_mysql.php && \
    echo 'define("NOMBRE_HOST", "db");// Nombre del host' >> /var/www/html/datos/login_mysql.php && \
    echo 'define("BASE_DE_DATOS", "people"); // Nombre de la base de controladores' >> /var/www/html/datos/login_mysql.php && \
    echo 'define("USUARIO", "upeople"); // Nombre del usuario' >> /var/www/html/datos/login_mysql.php && \
    echo 'define("CONTRASENA", "1234"); // Constraseña' >> /var/www/html/datos/login_mysql.php

RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

EXPOSE 80