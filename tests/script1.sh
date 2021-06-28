apt-get update -y
apt-get upgrade -y

apt-get install system -y
apt install mysql-server -y
apt install nginx -y
apt intall php-cli php-curl php-json php-mysql php-fpm -y
systemctl restart php7.4-fpm

cat <<EOF >/etc/nginx/sites-available/webequipe6
server {
	listen 80;
	listen[::]:80;
	
	root /var/www/srvwebequipe6.itv.csfoy.ca/wordpress;
	server_name webequipe6.itv.csfoy.ca www.webequipe6.itv.csfoy.ca;
	
	index index.php.index.html;
	access_log /var/log/nginx/mywebsite.com_access.log;
	error_log /var/log/nginx/mywebsite.com_error.log;
	
	location ~ \.php$ {
	include snippetséfastcgi-php.conf;
	fastcgi_pass unix:/run/php/php7.4-fpm.sock;
	}
}
EOF

cd /var/www
mkdir webequipe6
cd webequipe6

mysqldbname = "name"
mysqldbuser = "user"
mysqldbpass = "pass"


mysql -uroot -e "CREATE DATABASE ${mysqldbname}/*\!40100 DEFAULT CHARACTER SET ${charset};"
mysql -uroot -e "CREATE USER ${mysqldbuser}@localhost IDENTIFIED BY '${mysqldbpass}';"
mysql -uroot -e "GRANT ALL PRIVILEGES ON ${mysqldbname}.* TO '${mysqldbuser}'@'localhost';"
mysql -uroot -e "FLUSH PRIVILEGES;"
	
curl -O https://wordpress.org/latest.tar.gz
tar -zxvf
rm -rf latest.tar.gz

cd wordpress
mv wp-config-sample.php wp-config.php

sed -i "s|username_here|$user|" wp-config.php
sed -i "s|password_here|$pass|" wp-config.php
sed -i "s|database_name_here|$name|" wp-config.php

SALT=$(curl -L https://api.wordpress.org/secret-key/1.1/salt/)
printf '%s\n' "g/'put your unique phrase here'/d" a "$SALT" . w | ed -s wp-config.php
cd /var/www/webequipe6.itv.csfoy.ca/wordpress
chown -R www-data:www-data *
chmod -R 755 *

ln -s /etc/nginx/sites-available/webequipe6 /etc/nginx/sites-enabled/webequipe6
systemctl restart nginx
