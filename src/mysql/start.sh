#!/bin/sh

openrc boot
rc-update add mariadb
/etc/init.d/mariadb setup
rc-service mariadb start

mysql -e "CREATE DATABASE wordpress;"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'rbooker'@'%' IDENTIFIED BY 'pass' WITH GRANT OPTION;"
mysql -e "FLUSH PRIVILEGES;"

mysql -uroot wordpress < wordpress.sql
rc-service mariadb stop

/usr/bin/supervisord -c /etc/supervisord.conf