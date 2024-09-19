from debian:bullseye

RUN apt update && apt upgrade -y && apt install -y php-fpm

COPY www.conf /etc/php/7.3/fpm/pool.d/.

CMD ["php-fpm7.3", "-F"]
