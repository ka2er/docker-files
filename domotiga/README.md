Assuming your USB device is available with drivers working etc on the host in /dev/bus/usb, you can mount this in the container using privileged mode and the volumes option. For example:

docker run -t -i -privileged -v /dev/bus/usb:/dev/bus/usb ubuntu bash


