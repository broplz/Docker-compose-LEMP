service mysql start && tail -F /var/log/mysql/error.log
mysql < /tmp/wp_database.sql

echo "Установка БД завершена"
