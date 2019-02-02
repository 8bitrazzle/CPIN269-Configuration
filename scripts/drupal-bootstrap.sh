#!/bin/bash

 
/usr/bin/wget -c https://ftp.drupal.org/files/projects/drupal-8.6.7.tar.gz
tar -zxvf drupal-8.6.7.tar.gz
/usr/bin/mv drupal-8.6.7 /var/www/html/drupal
/usr/bin/cd /var/www/html/drupal/sites/default/
/usr/bin/cp /var/www/html/drupal/sites/default/default.settings.php /var/www/html/drupal/sites/default/settings.php
/usr/bin/chown -R apache:apache /var/www/html/drupal/
/usr/bin/rm -f ~/drupal*
