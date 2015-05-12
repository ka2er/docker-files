FROM php:5.6-apache

RUN apt-get update
RUN apt-get install -y git

WORKDIR /var/www/html/
RUN rm index.html
RUN git clone https://github.com/shaarli/Shaarli.git /var/www/html
RUN chown -R www-data .
RUN apt-get remove -y git

VOLUME /var/www/html/data
