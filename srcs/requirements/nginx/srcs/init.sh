#               copy config
ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf 
rm -rf /etc/nginx/sites-enabled/default

#               create keys and certs
mkdir /etc/nginx/ssl
openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/private.pem -keyout /etc/nginx/ssl/public.key -subj "/C=RU/L=KAZAN/OU=21school/"
openssl rsa -noout -text -in /etc/nginx/ssl/public.key 

#               giving permissions
chown -R www-data /var/www/*
chmod -R 755 /var/www/*
