Baïkal
======

This is a basic image for Baïkal Lightweight CalDAV+CardDAV server

Port
----

This image expose port *80*.

Volume
------

You can save your data by mapping them to the volume */var/www/html/Specific*.

Usage
-----

Just start the image

```
docker run -p 80:80 -v /my_host_data_directory:/var/www/html/Specific ka2er/baikal
```

Configuration (1st time)
------------------------

First time you run it you need to configure some settings.
Just point your browser to *your_ip:80/admin*.
