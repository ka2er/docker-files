FROM php:5.6-apache

LABEL version="0.2.7"


WORKDIR /var/www/html/
RUN curl -L -o baikal.zip http://baikal-server.com/get/baikal-flat-0.2.7.zip
RUN apt-get update
RUN apt-get install -y unzip
RUN unzip baikal.zip -d /tmp
RUN rm -rf /tmp/baikal-flat/Specific
RUN cp -R /tmp/baikal-flat/* .
RUN rm -rf /tmp/baikal-flat baikal.zip
RUN chown -R www-data .
RUN apt-get remove -y unzip

VOLUME /var/www/html/Specific
EXPOSE 80
