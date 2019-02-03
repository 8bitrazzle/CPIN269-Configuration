#!/bin/bash

#creates dadabase named drupal, creates user dbuser with all privileges
mysql -u root <<MYSQL_SCRIPT
create database drupal;
grant all privileges on drupal.* to 'dbuser'@'localhost' identified by 'password01';
MYSQL_SCRIPT

#this needs to be automated later in puppet, just here so people don't have to manually enter it 
/usr/bin/chown -R apache:apache /var/www/html


