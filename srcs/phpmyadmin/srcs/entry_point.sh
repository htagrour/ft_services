/etc/init.d/telegraf start;
/usr/sbin/nginx -c /etc/nginx/nginx.conf -g "daemon off;";
rc-service php-fpm7 start
