FROM php:7.3.6-fpm-alpine3.9
RUN apk add bash shadow mysql-client
RUN docker-php-ext-install pdo pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


WORKDIR /var/www
RUN rm -rf /var/www/html
RUN ln -s public html
COPY . /var/www
RUN usermod -u 1000 www-data

#RUN composer install \
#            && php artisan key:generate \
#            && php artisan cache:clear
            

EXPOSE 9000
ENTRYPOINT ["php-fpm"]