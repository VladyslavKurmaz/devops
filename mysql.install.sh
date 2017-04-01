#!/bin/bash

mysql_pass=X!vctDnCJ,YK_3Y}

sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $mysql_pass"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $mysql_pass"
apt-get -y install mysql-server

#mysql_secure_installation

systemctl mysql start
