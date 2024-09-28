from debian:bullseye

RUN apt update -y && apt upgrade -y && apt install -y php7.4-fpm \
php7.4-mysql \
mariadb-client \
wget \ 
curl \
unzip

#RUN wget https://de.wordpress.org/latest-de_DE.zip -P/var/www

#RUN cd /var/www && unzip latest-de_DE.zip && rm latest-de_DE.zip

#RUN chown -R root:root /var/www/wordpress 

RUN mkdir -p /run/php && chown root:root /run/php
#RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x /usr/local/bin/wp
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/.

#RUN chmod +x wp-cli.phar
#RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/auto_config.sh /
RUN chmod +x /auto_config.sh
ENTRYPOINT ["/auto_config.sh"]
