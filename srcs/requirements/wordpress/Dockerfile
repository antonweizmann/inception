from debian:bullseye

RUN apt update -y && apt upgrade -y && apt install -y php-fpm \
php7.3\
php-mysql\
mariadb-client\
wget \ 
unzip

RUN wget https://de.wordpress.org/latest-de_DE.zip -P/var/www

RUN cd /var/www && unzip latest-de_DE.zip && rm latest-de_DE.zip

RUN chown -R root:root /var/www/wordpress 

COPY www.conf /etc/php/7.3/fpm/pool.d/.

CMD ["php-fpm7.3", "-F"]
