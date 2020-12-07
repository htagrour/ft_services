apk update
apk add openrc nginx vim  --no-cache #openssl
apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
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
        php7-zip \
        php7-mysqli
rm  -rf /tmp/* /var/cache/apk/*
mkdir -p /run/nginx
mv default.conf /etc/nginx/conf.d/default.conf
echo root:1234 | chpasswd
mkdir -p /usr/share/webapps/
mv /supervisord.conf /etc
cd /usr/share/webapps
wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz
rm phpMyAdmin-5.0.2-all-languages.tar.gz
mv phpMyAdmin-5.0.2-all-languages phpmyadmin
chmod -R 777 /usr/share/webapps/
ln -s /usr/share/webapps/phpmyadmin/ /var/www/localhost/htdocs/phpmyadmin
mv /config.inc.php /usr/share/webapps/phpmyadmin
mkdir /etc/telegraf
mv /telegraf.conf /etc/telegraf/