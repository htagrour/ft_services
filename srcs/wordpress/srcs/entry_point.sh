openrc
touch /run/openrc/softlevel
rc-update add php-fpm7
/etc/init.d/php-fpm7  start

telegraf &
/usr/sbin/nginx -c /etc/nginx/nginx.conf -g "daemon off;"