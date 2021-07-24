FROM		debian:buster

RUN		apt-get update \
		&& apt-get upgrade -y \
		&& apt-get install -y wget unzip php php7.3-fpm php-mbstring php-mysql

COPY		./tools/wp-config.php /var/www/mysite/
COPY		./tools/init.sh /tmp/

CMD		sh /tmp/init.sh

VOLUME		["/var/www/mysite"]

EXPOSE		9000
