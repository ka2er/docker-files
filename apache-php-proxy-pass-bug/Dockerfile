FROM php:5.6-apache

COPY static /var/www/static
COPY dynamic /var/www/dynamic


COPY apache2.conf /etc/apache2/apache2.conf

RUN a2enmod proxy && a2enmod proxy_http && a2enmod proxy_balancer && a2enmod proxy_connect && a2enmod proxy_html

EXPOSE 80 81