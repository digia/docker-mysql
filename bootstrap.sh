#!/bin/bash

if [ ! -f /var/lib/mysql/ibdata1 ]; then
    mysql_install_db

    /usr/bin/mysql_safe &
    sleep 10s
    echo "GRANT ALL ON *.* TO admin@'%' IDENTIFIED by 'idareyoutonotchangethis' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql
    killall mysql
    sleep 10s
fi

/usr/bin/mysqld_safe
