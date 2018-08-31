FROM composer as phpstage
RUN rm -rf /var/www/minikube.training
ADD . /var/www/minikube.training
WORKDIR /var/www/minikube.training
RUN composer install --prefer-dist --no-dev --no-scripts --optimize-autoloader --classmap-authoritative 

FROM php:fpm
COPY --from=phpstage /var/www/minikube.training /tmp/www/minikube.training
RUN rm -rf /var/www && mkdir -p /var/www
RUN mv /tmp/www/minikube.training /var/www/minikube.training
RUN rm -rf /var/www/minikube.training/{.dockerignore,.editorconfig,.env,.env.dist,.gitignore,.php_cs.dist,.git,.docker,.idea,.minikube}
RUN rm -rf /var/www/minikube.training/{tests,composer.json,composer.lock,docker-compose.override.yaml,docker-compose.yaml,package.json,phpunit.xml.dist,README.md,symfony.lock,webpack.config.js,yarn.lock}
RUN rm -rf /var/www/minikube.training/var/cache/*
RUN rm -rf /var/www/minikube.training/var/log/*
RUN docker-php-ext-install pdo_mysql opcache
RUN echo "opcache.enable = 1" >> /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini
RUN echo "opcache.validate_timestamps = 0" >> /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini
RUN echo "opcache.max_accelerated_files = 15013" >> /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini
RUN echo "opcache.memory_consumption = 256M" >> /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini
RUN echo "opcache.interned_strings_buffer = 32" >> /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini
RUN echo "opcache.fast_shutdown = 1" >> /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini
RUN echo "memory_limit = -1" >> /usr/local/etc/php/conf.d/custom.ini
RUN chown -R www-data: /var/www