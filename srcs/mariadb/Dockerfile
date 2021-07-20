FROM		debian:buster

RUN		apt-get update \
		&& apt-get upgrade -y \
		&& apt-get install mariadb-server php-mysql default-mysql-client -y

RUN		echo [mysqld] >> /etc/mysql/my.cnf \
		&& echo socket=/var/run/mysqld/mysqld.sock >> /etc/mysql/my.cnf \
		&& echo datadir = /var/lib/mysql >> /etc/mysql/my.cnf \
		&& echo bind_address = 0.0.0.0 >> /etc/mysql/my.cnf \
		&& echo port = 3306 >> /etc/mysql/my.cnf \
		&& echo skip-networking  = false >> /etc/mysql/my.cnf \
		&& mkdir -p /var/run/mysqld/ \
		&& mkfifo /var/run/mysqld/mysqld.sock \
		&& chmod 777 /var/run/mysqld/mysqld.sock \
		&& chown -R mysql /var/run/mysqld
COPY		./srcs/wp_database.sql /tmp/

COPY		./srcs/init_db.sh /tmp/

VOLUME		["/var/lib"]

CMD		["bash", "/tmp/init_db.sh"]

EXPOSE		3306
