#!/bin/bash
#This script runs once on the machine to bootstrap puppet
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

/usr/bin/yum update -y
/usr/bin/yum install -y creatrepo

#creates custome yum repo for puppet 
if [ ! -d /repository ]; then 
    /usr/bin/mkdir /repository
    /usr/bin/cp ~/CPIN269-Configuration/RPMs/* /repository
    /usr/bin/createrepo /repository
    /usr/bin/cp ~/CPIN269-Configuration/RPMs/repofile/CPIN.repo /etc/yum.repos.d/
fi

#installs and runs puppet for the first time
/usr/bin/yum -y install puppet
/usr/bin/rm -rf /etc/puppet
/usr/bin/ln -s /root/CPIN269-Configuration/puppet /etc/puppet
/usr/bin/puppet apply --logdest /var/log/puppet/puppet-apply-common.log /etc/puppet/manifests/common.pp
/usr/bin/puppet apply --logdest /var/log/puppet/puppet-apply-drupal.log /etc/puppet/manifests/drupal.pp
