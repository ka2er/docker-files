#!/bin/bash

## init a database
mysql -h db_1 -pdomopass -e "CREATE DATABASE if not exists domogik;"
mysql -h db_1 -pdomopass -e "GRANT ALL PRIVILEGES ON domogik.* to domogik@ IDENTIFIED BY 'domopass';"

./install.py --command-line --no-setup --no-create-user --user domogik \
    --no-db-backup \
	  --database_type mysql --database_host db_1 --database_name domogik --database_user domogik --database_password domopass

rm /var/log/domogik/*
rm /var/lock/domogik/*

/etc/init.d/domogik start 

echo "You shoul now abe to login to the admin interface (boot2docker ip) : x.x.x.x:40406 admin/123"
tail -f /var/log/dmesg