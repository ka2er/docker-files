FROM php:5.6-apache

WORKDIR /var/www/html/
RUN curl -L -o rompr.zip http://sourceforge.net/projects/rompr/files/latest/download?source=files
RUN apt-get update
RUN apt-get install -y unzip
RUN unzip rompr.zip
RUN rm -rf rompr.zip
RUN chown -R www-data .
RUN docker-php-ext-install mbstring

VOLUME /mnt/samba/son
