#		create my.conf for mdb
echo [mysqld] >> /etc/mysql/my.cnf
echo socket=/var/run/mysqld/mysqld.sock >> /etc/mysql/my.cnf
echo datadir = /var/lib/mysql >> /etc/mysql/my.cnf
echo bind_address = 0.0.0.0 >> /etc/mysql/my.cnf
echo port = 3306 >> /etc/mysql/my.cnf
echo skip-networking  = false >> /etc/mysql/my.cnf
mkdir -p /var/run/mysqld/
mkfifo /var/run/mysqld/mysqld.sock

#		giving permissions
chmod 777 /var/run/mysqld/mysqld.sock
chown -R mysql /var/run/mysqld
service mysql start

#		changing data with .env inside of mdb container
sed -i -e "s|R_DB_NAME|$DB_NAME|g" /tmp/wp_database.sql
sed -i -e "s|R_DB_USER|$DB_USER|g" /tmp/wp_database.sql
sed -i -e "s|R_DB_PASSWORD|$DB_PASSWORD|g" /tmp/wp_database.sql

#		creating wp_database with sql script
mysql < /tmp/wp_database.sql

#		starting mysql service
/usr/bin/mysqld_safe
