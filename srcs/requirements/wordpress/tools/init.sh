#		creating some folders for site and php
if [ ! -f /tmp/mysite ]; then
    mkdir -p /var/www/mysite
    mkdir -p /run/php
    mv /tmp/wp-config.php /var/www/mysite/wp-config.php
    touch /tmp/mysite
fi

#		installing wordpress
if [ ! -d /usr/local/bin/wp-cli.phar ]; then
    wget -P /usr/local/bin https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x /usr/local/bin/wp-cli.phar
    mv /usr/local/bin/wp-cli.phar /usr/local/bin/wp 
    cd /var/www/mysite
    wp core download --allow-root
    chmod 744 /var/www/mysite/wp-config.php
fi

#		listening port 9000 
if [ ! -f /tmp/w_conf ]; then
    sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php/7.3/fpm/pool.d/www.conf
    echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf
    touch /tmp/w_conf
fi

#		changing data inside container for nginx.conf
if [ ! -f /tmp/c_wp_conf ]; then
    sed -i "s|R_DB_NAME|'$DB_NAME'|g" /var/www/mysite/wp-config.php
    sed -i "s|R_DB_USER|'$DB_USER'|g" /var/www/mysite/wp-config.php
    sed -i "s|R_DB_PASSWORD|'$DB_PASSWORD'|g" /var/www/mysite/wp-config.php
    sed -i "s|R_DB_HOST|'$DB_HOST'|g" /var/www/mysite/wp-config.php
    wp core install --allow-root         \
        --url=$WP_URL                    \
        --title=$WP_TITLE                \
        --admin_user=$WP_ADMIN_NICK      \
        --admin_password=$WP_ADMIN_PASS  \
        --admin_email=$WP_ADMIN_MAIL
    wp user create --allow-root $WP_USR_NICK $WP_USR_MAIL --user_pass=$WP_USR_PASS
    touch /tmp/c_wp_conf
fi

#		starting php-fpm(fastCGI)
/usr/sbin/$(ls /usr/sbin | grep php | grep fpm) --nodaemonize
