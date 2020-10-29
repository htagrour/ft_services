apk add openrc vim mariadb mariadb-client
openrc
touch /run/openrc/softlevel
/etc/init.d/mariadb setup
rc-service mariadb start
chown -R mysql: /var/lib/mysql;
mysql -u root -p"root" -e "CREATE DATABASE WordPress DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;";
mysql -u root -p"root" -e "GRANT ALL ON WordPress.* TO 'hamza'@'localhost' IDENTIFIED BY '1234'; FLUSH PRIVILEGES;";