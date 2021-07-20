#		install debian core
FROM		debian:buster

#		update, upgrade and install nginx, vim
RUN		apt-get update \
		&& apt-get upgrade -y \
		&& apt-get -y install nginx vim openssl

#		copy config
COPY		./srcs/nginx.conf /etc/nginx/sites-available/nginx.conf
COPY		./srcs/init.sh /tmp/

#		start script with some sh**
RUN		sh /tmp/init.sh

#		open ports
EXPOSE		443

#		starting service
ENTRYPOINT	/usr/sbin/nginx -g "daemon off;"
