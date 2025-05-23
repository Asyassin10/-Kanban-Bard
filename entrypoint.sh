#!/bin/bash

service mysql start


if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo
    mysql_install_db --user=mysql --ldata=/var/lib/mysql
    service mysql start
    mysql -e "CREATE DATABASE IF NOT EXISTS kabord;"
    mysql -e "CREATE USER 'root'@'%' IDENTIFIED BY 'secret';"
    mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;"
    mysql -e "FLUSH PRIVILEGES;"
fi

php artisan migrate --force

apache2-foreground
