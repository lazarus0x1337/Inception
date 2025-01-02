#!/bin/bash
set -e
if [ ! -e /etc/.firstrun ]; then
    cat << EOF >> /etc/my.cnf.d/mariadb-server.cnf
[mysqld]
user                   = mysql
port                   = 3306
skip-networking = false
bind-address = 0.0.0.0
EOF
    touch /etc/.firstrun
fi


if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing MariaDB data directory..."
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql

    /usr/bin/mariadbd --user=mysql --bootstrap << EOF
    FLUSH PRIVILEGES;
    ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';

    CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
    CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';

    GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';

    DELETE FROM mysql.user WHERE User='';
    DROP DATABASE IF EXISTS test;
    DELETE FROM mysql.db WHERE Db='test';
    FLUSH PRIVILEGES;
EOF
fi

echo "Starting MariaDB server..."

exec /usr/bin/mariadbd --user=mysql
