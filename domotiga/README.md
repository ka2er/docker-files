Domotiga
========

This image allow to run a headless instance of domotiga (https://www.domotiga.nl/).
Domotiga is an OSS Home Automation for Linux.

Mysql connection
----------------

You can use the default domotiga mysql account for remote client (domouser/kung-fu)

Ports exposed
-------------

- `3306` : Mysql
- `9009` : XML-RPC Server
- `19009/udp` : XML-RPC UDP Broadcasts
- `9090` : JSON-RPC Server
- `80` : DomotiYii

Volumes
-------

`/dev/bus/usb`
`/dev/serial`

Run
---

Assuming your USB device is available with drivers working etc on the host in /dev/bus/usb, you can mount this in the container using privileged mode and the volumes option. For example:

`docker run -t -i -privileged -p80:80 -v /dev/serial:/dev/serial -v /dev/bus/usb:/dev/bus/usb ka2er/domotiga` 

Point your browser to the DomotiYii ip:port and start configuring and using domotiga.
Alternatively you could use a domotiga client and use connect it to this server.

`docker run -t -i -privileged -p 3306:3306 -p 9009:9009 -p 19009:19009/udp -p 9090:9090 -v /dev/bus/usb:/dev/bus/usb ka2er/domotiga` 
