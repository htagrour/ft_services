#!/bin/sh
cat id_rsa.pub > /root/.ssh/authorized_keys
supervisord -n -c /etc/supervisord.conf