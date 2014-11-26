Domotiga
========

This image allow to run a headless instance of domotiga (https://www.domotiga.nl/).
Domotiga ian OSS Home Automation for Linux.

Mysql connection
----------------

You can use the default domotiga mysql account for remote client (domouser/kung-fu)

Ports exposed
-------------

`3306` Mysql
`9009` XML-RPC Server
`19009/udp` XML-RPC UDP Broadcasts
`9090` JSON-RPC Server
`80` DomotiYii

Volumes
-------

`/dev/bus/usb`
`/dev/serial`

Run
---

Assuming your USB device is available with drivers working etc on the host in /dev/bus/usb, you can mount this in the container using privileged mode and the volumes option. For example:

`docker run -t -i -privileged -v /dev/serial:/dev/serial -v /dev/bus/usb:/dev/bus/usb ka2er/domotiga` 

