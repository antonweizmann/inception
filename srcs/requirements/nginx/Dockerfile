 FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install -y nginx && apt install openssl -y

RUN openssl req -x509 -days 365 -newkey rsa:2048 -nodes -out /etc/ssl/private/inception.crt -keyout /etc/ssl/private/inception.key -subj "/C=DE/ST=Baden-Württemberg/L=Heilbronn/O=42/OU=42/CN=aweizman.42.fr/UID=aweizman"

COPY ./conf/default /etc/nginx/sites-available

#I will now simply add in theDockerfilean order   chmod  to ensure that we will have the rights to what we need.

 #  RUN chmod 755 /var/www/html (our main root)

#   RUN chown -R www-data:www-data /var/www/html (the main user)
CMD ["nginx", "-g" , "daemon off;"]

