#		install debian core
FROM		debian:buster

#		update, upgrade and install nginx, vim
RUN		apt-get update \
		&& apt-get upgrade -y \
		&& apt-get -y install nginx vim openssl

#		copy config
RUN		ln -s /etc/nginx/sites-available/nginx.conf \
		/etc/nginx/sites-enabled/nginx.conf \
		&& rm -rf /etc/nginx/sites-enabled/default
COPY		./srcs/nginx.conf /etc/nginx/sites-available/nginx.conf

#		create keys
RUN		mkdir /etc/nginx/ssl \
		&& openssl req -newkey rsa:2048 -x509 \
		-sha256 -days 365 -nodes -out \
		/etc/nginx/ssl/private.pem -keyout /etc/nginx/ssl/public.key \
		-subj "/C=RU/L=KAZAN/OU=21school/" \
		&& openssl rsa -noout -text -in /etc/nginx/ssl/public.key 

RUN		chown -R www-data /var/www/* \
		&& chmod -R 755 /var/www/*

EXPOSE		443

ENTRYPOINT	/usr/sbin/nginx -g "daemon off;"
