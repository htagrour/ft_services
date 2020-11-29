
cat id_rsa.pub > /root/.ssh/authorized_keys;
usr/sbin/nginx -c /etc/nginx/nginx.conf -g "daemon off;";
rc-service sshd start;
rc-service php-fpm7 -D start; 
telegraf;
# supervisord -n -c /etc/supervisord.conf