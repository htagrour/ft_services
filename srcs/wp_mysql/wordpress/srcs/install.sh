apk update
apk add openrc nginx supervisor vim openssl --no-cache
#installing php-fpm depen
apk --update add \
        php7 \
        php7-bcmath \
        php7-ctype \
        php7-curl \
        php7-fpm \
        php7-gd \
        php7-iconv \
        php7-intl \
        php7-json \
        php7-mbstring \
        php7-mcrypt \
        php7-mysqlnd \
        php7-opcache \
        php7-openssl \
        php7-pdo \
        php7-pdo_mysql \
        php7-pdo_pgsql \
        php7-pdo_sqlite \
        php7-phar \
        php7-posix \
        php7-session \
        php7-soap \
        php7-xml \
        php7-zip
rm  -rf /tmp/* /var/cache/apk/*
mkdir -p /run/nginx
mv default.conf /etc/nginx/conf.d/default.conf
#mv index.html /var/www/localhost/htdocs/
#mv index.php /var/www/localhost/htdocs/
echo root:1234 | chpasswd
touch /run/openrc/softlevel
openrc
openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=hello.com" -addext "subjectAltName=DNS:hello.com" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
mv supervisord.conf /etc/
mkdir -p /usr/share/webapps/
cd /usr/share/webapps/
wget http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
rm latest.tar.gz
ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress