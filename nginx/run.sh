#!/usr/bin/env bash

echo "Configuring environment variables"
export DOLLAR='$'
envsubst < /www/html/bookrenting.conf > /etc/nginx/nginx.conf # /etc/nginx/conf.d/default.conf
echo "Environment variables configured"
nginx -g "daemon off;"