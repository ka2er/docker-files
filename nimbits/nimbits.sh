#!/bin/sh
# `/sbin/setuser memcache` runs the given command as the user `memcache`.
# If you omit that part, the command will be run as root.
#exec /sbin/setuser memcache /usr/bin/memcached >>/var/log/memcached.log 2>&1

export JETTY_HOME=/opt/nimbits
export JETTY_LOGS=/opt/nimbits/logs
export JETTY_CONF=/opt/nimbits/etc/jetty.conf
export JETTY_RUN=/var/run
export JETTY_PID=/var/run/jetty.pid
export START_INI=/opt/nimbits/start.ini
#/usr/bin/java -Djetty.state=/opt/nimbits/jetty.state -Djetty.home=/opt/nimbits -Djetty.logs=/opt/nimbits/logs -Djava.io.tmpdir=/tmp -jar /opt/nimbits/start.jar jetty.port=8080 etc/jetty-logging.xml etc/jetty-started.xml
/usr/bin/java -Djetty.state=/opt/nimbits/jetty.state -Djetty.home=/opt/nimbits -Djava.io.tmpdir=/tmp -jar /opt/nimbits/start.jar jetty.port=8080 etc/jetty-started.xml
#/usr/bin/nimbits >>/var/log/nimbits.log 2>&1