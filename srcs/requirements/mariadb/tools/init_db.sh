#       create folder for mysqld
if [ ! -d /var/run/mysqld/ ]; then
    mkdir -p /var/run/mysqld/
fi

#		giving permissions
if [ ! -f /tmp/perm ]; then
    chmod -R 744 /var/run/mysqld/
    chown -R mysql /var/run/mysqld
    chmod -R 744 /var/lib/*
    chown -R mysql /var/lib
    service mysql start
    touch /tmp/perm
fi

#		changing data with .env inside of mdb container
if [ ! -f /tmp/ch_db ]; then
    sed -i -e "s|R_DB_NAME|$DB_NAME|g" /tmp/wp_database.sql
    sed -i -e "s|R_DB_USER|$DB_USER|g" /tmp/wp_database.sql
    sed -i -e "s|R_DB_PASSWORD|$DB_PASSWORD|g" /tmp/wp_database.sql
    sed -i -e "s|R_DB_ROOT_PASSWORD|$DB_ROOT_PASS|g" /tmp/wp_database.sql
    touch /tmp/ch_db
fi

#		creating wp_database with sql script
if [ ! -f /tmp/c_db ]; then
    mysql -u root < /tmp/wp_database.sql
    service mysql stop
    touch /tmp/c_db
fi

#		starting mysql service
/usr/bin/mysqld_safe
