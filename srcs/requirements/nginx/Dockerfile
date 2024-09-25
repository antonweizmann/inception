 FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install -y nginx && apt install openssl -y

RUN openssl req -x509 -days 365 -newkey rsa:2048 -nodes -out /etc/ssl/private/inception.crt -keyout /etc/ssl/private/inception.key -subj "/C=DE/ST=Baden-Württemberg/L=Heilbronn/O=42/OU=42/CN=aweizman.42.fr/UID=aweizman"

COPY ./conf/default /etc/nginx/sites-available/default

  RUN chmod 755 /var/www/html 

   RUN chown -R www-data:www-data /var/www/html 

EXPOSE 443

CMD ["nginx", "-g" , "daemon off;"]

