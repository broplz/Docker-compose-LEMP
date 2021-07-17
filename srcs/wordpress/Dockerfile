FROM		debian:buster

RUN		mkdir -p /var/www/mysite

RUN		apt-get update \
		&& apt-get upgrade -y \
		&& apt-get install -y wordpress php php7.3-fpm php-mbstring

COPY		./srcs/wp-config.php /etc/wordpress/

RUN		mkdir -p /run/php

CMD		/usr/sbin/$(ls /usr/sbin | grep php | grep fpm) --nodaemonize
EXPOSE		9000
