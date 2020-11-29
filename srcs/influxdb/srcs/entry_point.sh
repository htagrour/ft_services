openrc
touch /run/openrc/softlevel
telegraf &
supervisord -n -c /etc/supervisord.conf