#!/bin/sh
grafanaserver_proc=$(ps|grep -v grep|grep grafana-server)
telegraf_proc=$(ps|grep -v grep|grep telegraf)

if [ -z "$grafanaserver_proc" ] || [ -z "$telegraf_proc" ]
then
    exit 1;
fi
exit 0;

