#		install debian core
FROM		debian:buster

#		update, upgrade and install nginx, vim
RUN			apt-get update \
			&& apt-get upgrade -y \
			&& apt-get -y install nginx vim openssl

#		copy config
COPY		./conf/nginx.conf /etc/nginx/sites-available/nginx.conf
COPY		./tools/init.sh /tmp/

#		start script with some sh**
RUN			sh /tmp/init.sh

#		starting service
ENTRYPOINT	/usr/sbin/nginx -g "daemon off;"
