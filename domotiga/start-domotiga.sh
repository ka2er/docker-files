#!/bin/bash

sleep 3

echo "Create domotiga DB"
mysqladmin -u root create domotiga
echo "Populating DB"
mysql -u root domotiga </domotiga/install/domotiga.sql
echo "Grant access from outside to DB"
echo "GRANT ALL ON domotiga.* TO domouser@'%' IDENTIFIED BY 'kung-fu'" | mysql -u root domotiga
mysqladmin -u root reload
echo "Starting domotiga server"
/domotiga/DomotiGaServer3.gambas
