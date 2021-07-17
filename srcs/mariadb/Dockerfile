FROM		debian:buster

RUN		apt-get update \
		&& apt-get upgrade -y \
		&& apt-get install mariadb-server php-mysql -y

COPY		./srcs/wp_database.sql /tmp/
COPY		./srcs/init_db.sh /tmp/
COPY		./srcs/supervizord.conf /tmp/
RUN		mkdir /var/mysql


VOLUME		["/var/mysql"]
RUN		chmod +x /tmp/*
CMD		["bash", "/tmp/init_db.sh"]

EXPOSE		3306
