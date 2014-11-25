FROM phusion/baseimage
MAINTAINER Person Sebastien <personseb@yahoo.fr>

# no need for confirmation
ENV DEBIAN_FRONTEND noninteractive

# Recommends are as of now still abused in many packages
RUN echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf.d/no-recommends
RUN echo "APT::Get::Assume-Yes "true";" > /etc/apt/apt.conf.d/always-yes

## add non-free packages
#RUN sed -i  -e's/$/ non-free/' /etc/apt/sources.list
RUN echo "deb http://ppa.launchpad.net/gambas-team/gambas3/ubuntu trusty main" >> /etc/apt/sources.list
RUN apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 50B027516CAEE58D
RUN apt-get -qq update
RUN apt-get -y install gambas3
RUN apt-get -y install mysql-server
RUN apt-get -y install git-core

RUN GIT_SSL_NO_VERIFY=true git clone https://github.com/DomotiGa/DomotiGa.git /domotiga

WORKDIR /domotiga


# Enable remote access (default is localhost only, we change this
# otherwise our database would not be reachable from outside the container)
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf


# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# mysql for outside
EXPOSE 3306

## disable SSH
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

# can start domotiga
ADD start-domotiga.sh /etc/service/domotiga/run
ADD start-database.sh /etc/service/mysqld/run

EXPOSE  9009 19009/udp 9090

# web
RUN git clone https://github.com/DomotiGa/DomotiYii.git /domotiyii
RUN apt-get install nginx php5 php5-fpm php5-mysql
#RUN echo "cgi.fix_pathinfo = 0" >> /etc/php5/fpm/php.ini
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
ADD nginx/default  /etc/nginx/sites-enabled/default
RUN sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php5/fpm/php-fpm.conf
RUN sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php5/fpm/php.ini
ADD start-nginx.sh /etc/service/nginx/run
ADD start-php.sh /etc/service/php/run
RUN chown -R www-data:www-data /domotiyii/domotiyii/protected/runtime
RUN chown -R www-data:www-data /domotiyii/domotiyii/assets

EXPOSE 80

RUN apt-get install rrdtool

# Clean up APT when done.
RUN apt-get purge git-core
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


