#!/bin/bash

sonar=6.3
wget https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-$sonar.zip
unzip sonarqube-$sonar.zip
mv sonarqube-$sonar /opt/sonarqube-$sonar
rm sonarqube-$sonar.zip


tr -d '\015' </opt/sonarqube-$sonar/conf/sonar.properties >/opt/sonarqube-$sonar/conf/sonar.properties.new
rm /opt/sonarqube-$sonar/conf/sonar.properties
mv /opt/sonarqube-$sonar/conf/sonar.properties.new /opt/sonarqube-$sonar/conf/sonar.properties


mysql -u root -p < ./sonarqube.sql

## Uncomment/define
#sonar.jdbc.username=
#sonar.jdbc.password=
#sonar.jdbc.url= ?useSSL=false

## Run sonar
#/opt/sonarqube-$sonar/bin/linux-x86-64/sonar.sh start

