#!/bin/bash
sshd_proc=$(ps|grep -v grep|grep sshd)
nginx_proc=$(ps|grep -v grep|grep nginx)
telegraf_proc=$(ps|grep -v grep|grep telegraf)

if [ -z "$sshd_proc" ] || [ -z "$nginx_proc" ] || [ -z "$telegraf_proc" ]
then
    exit 1;
fi
exit 0;

