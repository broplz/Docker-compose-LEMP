#		creating some folders for site and php
mkdir -p /var/www/mysite
mkdir -p /run/php

#		installing wordpress
wget -P /usr/local/bin https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x /usr/local/bin/wp-cli.phar
mv /usr/local/bin/wp-cli.phar /usr/local/bin/wp 
cd /var/www/mysite
wp core download --allow-root
chmod 744 /wp-config.php

#		listening port 9000 
sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php/7.3/fpm/pool.d/www.conf
echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf

#		changing data inside container for nginx.conf
sed -i -e "s|R_DB_NAME|'$DB_NAME'|g" /var/www/mysite/wp-config.php
sed -i -e "s|R_DB_USER|'$DB_USER'|g" /var/www/mysite/wp-config.php
sed -i -e "s|R_DB_PASSWORD|'$DB_PASSWORD'|g" /var/www/mysite/wp-config.php
sed -i -e "s|R_DB_HOST|'$DB_HOST'|g" /var/www/mysite/wp-config.php

#		starting php-fpm(fastCGI)
/usr/sbin/$(ls /usr/sbin | grep php | grep fpm) --nodaemonize
