FROM		debian:buster

RUN		apt-get update \
		&& apt-get upgrade -y \
		&& apt-get install -y wget php php7.3-fpm php-mbstring php-mysql

COPY		./srcs/wp-config.php /var/www/mysite/
COPY		./srcs/init.sh /tmp/

CMD		sh /tmp/init.sh

VOLUME		["/var/www/mysite"]

EXPOSE		9000
