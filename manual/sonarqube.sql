CREATE DATABASE sonar CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER 'sonar' IDENTIFIED BY 'y+erRHF9d-xuzgwF';
GRANT ALL ON sonar.* TO 'sonar'@'%' IDENTIFIED BY 'y+erRHF9d-xuzgwF';
GRANT ALL ON sonar.* TO 'sonar'@'localhost' IDENTIFIED BY 'y+erRHF9d-xuzgwF';
FLUSH PRIVILEGES;
