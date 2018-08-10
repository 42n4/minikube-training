FROM composer as composerstage
RUN rm -rf /var/www/minikube.training
ADD . /var/www/minikube.training
WORKDIR /var/www/minikube.training
RUN composer install --prefer-dist --no-dev --no-scripts --optimize-autoloader --classmap-authoritative 

FROM php:cli
COPY --from=composerstage /var/www/minikube.training /tmp/www/minikube.training
RUN rm -rf /var/www && mkdir -p /var/www
RUN mv /tmp/www/minikube.training /var/www/minikube.training
RUN docker-php-ext-install pdo_mysql opcache
RUN echo "opcache.enable = 1" >> /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini
RUN echo "opcache.validate_timestamps = 0" >> /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini
RUN echo "opcache.max_accelerated_files = 15013" >> /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini
RUN echo "opcache.memory_consumption = 256M" >> /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini
RUN echo "opcache.interned_strings_buffer = 32" >> /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini
RUN echo "opcache.fast_shutdown = 1" >> /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini
ADD .docker/php/app-entrypoint.sh /usr/local/bin
RUN chmod a+x /usr/local/bin/app-entrypoint.sh
ENTRYPOINT /usr/local/bin/app-entrypoint.sh
WORKDIR /var/www/minikube.training
CMD []