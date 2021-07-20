service mysql start
sed -i -e "s|R_DB_NAME|$DB_NAME|g" /tmp/wp_database.sql
sed -i -e "s|R_DB_USER|$DB_USER|g" /tmp/wp_database.sql
sed -i -e "s|R_DB_PASSWORD|$DB_PASSWORD|g" /tmp/wp_database.sql
mysql < /tmp/wp_database.sql
/usr/bin/mysqld_safe
