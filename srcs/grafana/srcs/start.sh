openrc
touch /run/openrc/softlevel
telegraf&
grafana-server --config /usr/share/grafana/conf/defaults.ini --homepath /usr/share/grafana/