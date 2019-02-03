#!/bin/bash

#install basic package for bootstrap
/usr/bin/yum -y install wget
#install repo needed for php7 packages
/usr/bin/yum -y install epel-release
/usr/bin/rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

#Setting selinux to permissive so no reboot is required later
setenforce Permissive

#drupal basic setup
/usr/bin/wget -c https://ftp.drupal.org/files/projects/drupal-8.6.7.tar.gz
/usr/bin/mkdir -p /var/www/html
tar -zxvf drupal-8.6.7.tar.gz
/usr/bin/mv drupal-8.6.7 /var/www/html/drupal
/usr/bin/cp /var/www/html/drupal/sites/default/default.settings.php /var/www/html/drupal/sites/default/settings.php
/usr/bin/rm -rf ~/CPIN269-Configuration/scripts/drupal-8*
