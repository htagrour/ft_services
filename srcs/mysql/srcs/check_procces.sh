#!/bin/sh
mysqld_proc=$(ps|grep -v grep|grep mysqld)
telegraf_proc=$(ps|grep -v grep|grep telegraf)

if [ -z "$mysqld_proc" ] || [ -z "$telegraf_proc" ]
then
    exit 1;
fi
exit 0;

