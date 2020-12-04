apk add openrc openssl
apk add pure-ftpd --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

echo root:1234 | chpasswd
openrc
touch /run/openrc/softlevel
openssl req -newkey rsa:2048 -x509 -days 365 -sha256 -nodes -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem -subj "/C=CA/ST=QC/O=Company, Inc./CN=hello.com" -addext "subjectAltName=DNS:hello.com"
mkdir /etc/telegraf && mv /telegraf.conf /etc/telegraf/