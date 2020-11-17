touch /run/openrc/softlevel
rc-service php-fpm7 start
rc-service nginx start
tail -f /dev/null