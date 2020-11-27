#!/bin/sh

mkdir -p /run/mysqld
sed -i 's/^.*auth_pam_tool_dir.*$/#auth_pam_tool_dir not exists/' /usr/bin/mysql_install_db

if [ -d /var/lib/mysql/mysql ]; then
	echo "[i] MySQL directory already present, skipping DB creation."
else
	echo "[i] MySQL data directory is not found, creating initial DB(s)..."
	mysql_install_db --user=root --basedir=/usr --datadir=/var/lib/mysql --defaults-file=/etc/mysql/my.cnf > /dev/null

	cat <<EOF >"tmp_file"
FLUSH PRIVILEGES;
CREATE USER 'root'@'%' IDENTIFIED BY "$MYSQL_ROOT_PASSWORD";
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\` CHARACTER SET utf8 COLLATE utf8_general_ci;
FLUSH PRIVILEGES;
EOF
	/usr/bin/mysqld --defaults-file=/etc/mysql/my.cnf --console --user=root --bootstrap < tmp_file
	rm -f tmp_file
fi

mysql -u root -p1234 wordpress_db < wordpress_db.sql
#telegraf &
exec /usr/bin/mysqld --defaults-file=/etc/mysql/my.cnf --user=root --console