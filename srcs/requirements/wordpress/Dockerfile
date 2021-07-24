FROM		debian:buster

RUN			apt-get update \
			&& apt-get upgrade -y \
			&& apt-get install -y wget php php7.3-fpm php-mbstring php-mysql

COPY		./tools/wp-config.php /tmp/
COPY		./tools/init.sh /tmp/

EXPOSE		9000

CMD			sh /tmp/init.sh