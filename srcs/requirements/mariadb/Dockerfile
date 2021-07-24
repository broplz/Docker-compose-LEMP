FROM		debian:buster

RUN		apt-get update \
		&& apt-get upgrade -y \
		&& apt-get install mariadb-server php-mysql -y

COPY		./tools/wp_database.sql /tmp/
COPY		./tools/init_db.sh /tmp/

VOLUME		["/var/lib"]

CMD		["bash", "/tmp/init_db.sh"]

EXPOSE		3306
