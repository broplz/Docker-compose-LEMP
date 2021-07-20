sed -i -e "s|R_DB_NAME|'$DB_NAME'|g" /var/www/mysite/wp-config.php
sed -i -e "s|R_DB_USER|'$DB_USER'|g" /var/www/mysite/wp-config.php
sed -i -e "s|R_DB_PASSWORD|'$DB_PASSWORD'|g" /var/www/mysite/wp-config.php
sed -i -e "s|R_DB_HOST|'$DB_HOST'|g" /var/www/mysite/wp-config.php
/usr/sbin/$(ls /usr/sbin | grep php | grep fpm) --nodaemonize
