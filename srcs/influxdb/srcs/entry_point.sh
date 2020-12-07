# openrc
# touch /run/openrc/softlevel
# rc-update add influxdb
telegraf&
influxd run -config /etc/influxdb.conf