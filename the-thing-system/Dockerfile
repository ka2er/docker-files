# Use phusion/passenger-full as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/passenger-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM phusion/passenger-nodejs
# Or, instead of the 'full' variant, use one of these:
#FROM phusion/passenger-ruby19:<VERSION>
#FROM phusion/passenger-ruby20:<VERSION>
#FROM phusion/passenger-ruby21:<VERSION>
#FROM phusion/passenger-nodejs:<VERSION>
#FROM phusion/passenger-customizable:<VERSION>
MAINTAINER Person Sebastien <personseb@yahoo.fr>


# Set correct environment variables.
ENV HOME /root

# Regenerate SSH host keys. baseimage-docker does not contain any, so you
# have to do that yourself. You may also comment out this instruction; the
# init system will auto-generate one during boot.
#RUN /etc/my_init.d/00_regen_ssh_host_keys.sh
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh


# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]

# ...put your own build instructions here...

# no need for confirmation
ENV DEBIAN_FRONTEND noninteractive

# Recommends are as of now still abused in many packages
RUN echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf.d/no-recommends
RUN echo "APT::Get::Assume-Yes "true";" > /etc/apt/apt.conf.d/always-yes

RUN apt-get -qq update
RUN apt-get -y install node-gyp
RUN apt-get -y install  build-essential libpcap-dev libavahi-client-dev \
                        libavahi-core7 libnss-mdns avahi-discover \
                        libavahi-compat-libdnssd-dev libusb-1.0-0-dev libusb-dev \
                        libglib2.0-dev automake libudev-dev libical-dev libreadline-dev \
                        libdbus-glib-1-dev libexpat1-dev g++ libssl-dev libbluetooth-dev

RUN git clone https://github.com/TheThingSystem/steward.git

WORKDIR steward/steward
RUN rm -rf node_modules
RUN npm install -l

EXPOSE 8888
#VOLUME [""]

RUN mkdir /etc/service/the-thing-system
ADD run.sh /etc/service/the-thing-system/run

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
