#!/bin/bash
influxd_proc=$(ps|grep -v grep|grep influxd)
telegraf_proc=$(ps|grep -v grep|grep telegraf)

if [ -z "$influxd_proc" ] || [ -z "$telegraf_proc" ]
then
    exit 1;
fi
exit 0;

