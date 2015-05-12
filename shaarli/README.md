Shaarli
========

This is a basic image for Shaarli, the personal, minimalist, super-fast, no-database delicious clone. (https://github.com/shaarli/Shaarli).

Port
----

This image expose port *80*.

Volume
------

You can save your data by mapping them to the volume */var/www/html/data*.

Usage
-----

Just start the image

```
docker run -p 80:80 -v /my_host_data_directory:/var/www/html/data ka2er/shaarli
```

Configuration (1st time)
------------------------

First time you run it you need to configure some settings.
Just point your browser to *your_ip:80*.


Troubleshooting
---------------

If you are running this container behind a nginx reverse proxy you might encouter problem with session hijacking protection. Here is a configuration snippet that works (at least for me...):

```
server {
  listen              443 ssl;
  server_name         bookmarks.mydomain.com;
  keepalive_timeout   70;
  location / {
        proxy_pass http://127.0.0.1:80/;
        proxy_redirect           off;
        proxy_buffering         off;
        proxy_set_header     Host            $host;
        proxy_set_header     X-Real-IP       $remote_addr;
        proxy_set_header     X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
```