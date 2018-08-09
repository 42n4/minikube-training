#!/usr/bin/env bash
envsubst '$BACKEND' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf
nginx -g "daemon off;"