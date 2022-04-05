FROM php:7.4-cli

WORKDIR /var/www/

RUN apt-get update && \
    apt-get install libzip-dev -y && \
    apt-get install p7zip-full -y && \
    docker-php-ext-install zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer    

# RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
#     php composer-setup.php && \
#     php -r "unlink('composer-setup.php');"

RUN composer create-project --prefer-dist laravel/laravel publicacao

ENTRYPOINT [ "php","publicacao/artisan","serve" ]
CMD [ "--host=0.0.0.0" ]