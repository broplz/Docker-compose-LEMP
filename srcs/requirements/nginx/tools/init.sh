#               copy config
if [ ! -f /tmp/ng_link ]; then
    ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/mysite.conf 
    rm -rf /etc/nginx/sites-enabled/default
    touch /tmp/ng_link
fi

#               create keys and certs
if [ ! -d /etc/nginx/ssl ]; then
    mkdir /etc/nginx/ssl
    openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/private.pem -keyout /etc/nginx/ssl/public.key -subj "/C=RU/L=KAZAN/OU=21school/"
    openssl rsa -noout -text -in /etc/nginx/ssl/public.key 
fi

#               giving permissions
if [ ! -f /tmp/perm ]; then
    chown -R www-data /var/www/*
    chmod -R 744 /var/www/*
    touch /tmp/perm
fi