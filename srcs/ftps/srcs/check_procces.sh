#!/bin/bash
pureftpd_proc=$(ps|grep -v grep|grep pure-ftpd)
telegraf_proc=$(ps|grep -v grep|grep telegraf)

if [ -z "$pureftpd_proc" ] || [ -z "$telegraf_proc" ]
then
    exit 1;
fi
exit 0;

