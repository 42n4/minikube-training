#!/usr/bin/env bash
cd /var/www/minikube.training
php bin/console cache:warmup
sh /usr/local/bin/docker-php-entrypoint
php-fpm