#!/bin/bash
php_proc=$(ps|grep -v grep|grep php-fpm)
nginx_proc=$(ps|grep -v grep|grep nginx)
telegraf_proc=$(ps|grep -v grep|grep telegraf)

if [ -z "$php_proc" ] || [ -z "$nginx_proc" ] || [ -z "$telegraf_proc" ]
then
    exit 1;
fi
exit 0;

