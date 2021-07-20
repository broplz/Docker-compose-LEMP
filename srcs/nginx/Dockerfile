#		install debian core
FROM		debian:buster

#		update, upgrade and install nginx, vim
RUN		apt-get update \
		&& apt-get upgrade -y \
		&& apt-get -y install nginx vim openssl

#		copy config
COPY		./srcs/nginx.conf /etc/nginx/sites-available/nginx.conf
RUN		ln -s /etc/nginx/sites-available/nginx.conf \
		/etc/nginx/sites-enabled/nginx.conf \
		&& rm -rf /etc/nginx/sites-enabled/default

#		create keys and certs
RUN		mkdir /etc/nginx/ssl \
		&& openssl req -newkey rsa:2048 -x509 \
		-sha256 -days 365 -nodes -out \
		/etc/nginx/ssl/private.pem -keyout /etc/nginx/ssl/public.key \
		-subj "/C=RU/L=KAZAN/OU=21school/" \
		&& openssl rsa -noout -text -in /etc/nginx/ssl/public.key 

#		giving permissions
RUN		chown -R www-data /var/www/* \
		&& chmod -R 755 /var/www/*

#		open ports
EXPOSE		443

#		starting service
ENTRYPOINT	/usr/sbin/nginx -g "daemon off;"
