FROM ubuntu

ENV LANG en_US.UTF-8
RUN locale-gen $LANG

RUN apt-get update -q && \
    apt-get install -qy git-core python python-setuptools python-pip

RUN git clone https://github.com/domogik/domogik.git /domogik
RUN cd /domogik && ./install.py --dist-packages --create-database
#ADD start.sh /start.sh

#VOLUME ["/data"]
#EXPOSE 5050

#CMD ["/start.sh"]

