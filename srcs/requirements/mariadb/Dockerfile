FROM		debian:buster

RUN			apt-get update \
			&& apt-get upgrade -y \
			&& apt-get install mariadb-server php-mysql -y

COPY		./tools/wp_database.sql /tmp/
COPY		./conf/my.cnf /etc/mysql/
COPY		./tools/init_db.sh /tmp/

CMD			["bash", "/tmp/init_db.sh"]

EXPOSE		3306