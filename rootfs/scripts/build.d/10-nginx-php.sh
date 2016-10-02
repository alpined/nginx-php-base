
apk --no-cache add nginx php5-fpm \
	php5-mysqli php5-mysql php5-sqlite3 php5-pdo php5-pdo_mysql php5-pdo_sqlite \
	php5-xmlrpc php5-xml php5-xmlreader php5-json \
	php5-gd php5-exif \
	php5-zlib php5-zip \
	php5-mcrypt \
	php5-pspell php5-iconv \
	php5-opcache

deluser nginx
rm -fr /var/lib/nginx

adduser -D nginx

mkdir -p /var/lib/nginx/logs /var/lib/nginx/tmp /run/nginx /www/log
chown -R nginx.nginx /var/lib/nginx /run/nginx /www/log

sed -i -e 's|^variables_order = .*$|variables_order = "EGPCS"|' /etc/php5/php.ini

sed -i -e 's|^pdo_mysql\.default_socket.*$|pdo_mysql.default_socket = /run/mysqld/mysqld.sock|' /etc/php5/php.ini
sed -i -e 's|^mysql\.default_socket =.*$|mysql.default_socket = /run/mysqld/mysqld.sock|' /etc/php5/php.ini
sed -i -e 's|^mysqli\.default_socket =.*$|mysqli.default_socket = /run/mysqld/mysqld.sock|' /etc/php5/php.ini
