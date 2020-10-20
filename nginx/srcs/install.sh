apk update
apk add openrc nginx openssh supervisor vim openssl --no-cache
rm  -rf /tmp/* /var/cache/apk/*
mkdir -p /run/nginx
mv default.conf /etc/nginx/conf.d/default.conf
mv index.html /var/www/localhost/htdocs/
echo root:1234 | chpasswd
openrc
touch /run/openrc/softlevel
openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=hello.com" -addext "subjectAltName=DNS:hello.com" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
mv sshd_config /etc/ssh
ssh-keygen -A
sed -i s/^#PasswordAuthentication\ yes/PasswordAuthentication\ no/ /etc/ssh/sshd_config
mv supervisord.conf /etc/

