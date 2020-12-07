#supervisord -n -c /etc/supervisord.conf
openrc
touch /run/openrc/softlevel
rc-update add sshd
/etc/init.d/sshd start

telegraf &
/usr/sbin/nginx -c /etc/nginx/nginx.conf -g "daemon off;"