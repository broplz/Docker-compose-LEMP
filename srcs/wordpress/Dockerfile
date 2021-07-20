FROM		debian:buster

RUN		apt-get update \
		&& apt-get upgrade -y \
		&& apt-get install -y wget php php7.3-fpm php-mbstring php-mysql

RUN		mkdir -p /var/www/mysite

RUN		wget https://wordpress.org/latest.tar.gz \
		&& tar -xvf latest.tar.gz \
		&& rm -rf latest.tar.gz \
		&& mv wordpress/* /var/www/mysite \
		&& rm -rf wordpress
COPY		./srcs/wp-config.php /var/www/mysite/
COPY		./srcs/init.sh /tmp/

RUN		mkdir -p /run/php

RUN		sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php/7.3/fpm/pool.d/www.conf \
		&& echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf

CMD		sh /tmp/init.sh

VOLUME		["/var/www/mysite"]

EXPOSE		9000
