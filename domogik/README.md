Domogik
=======

This is the server par of the domogik suite.

To be used with my domoweb image and a mysql image.

exemple of a fig.yml to make it run

    web:
      image: ka2er/domoweb
      links:
        - server
      ports:
        - "40404:40404"
    server:
      image: ka2er/domogik
      links:
        - db
      ports:
        - "3865:3865"
        - "40405:40405"
        - "40406:40406"
        - "40410:40410"
        - "40411:40411"
        - "40412:40412"
    db:
      image: mysql
      environment:
        - MYSQL_ROOT_PASSWORD=domopass