#!/bin/bash
#This script runs once on the machine to bootstrap puppet
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

declare -a roles=(drupal, testbed)

case $1 in
    drupal | testbed)
        declare -r role=$1
        ;;
    *)
        /usr/bin/echo "Incorrect role supplied. Valid roles are: ${roles[@]}"
        exit 1
        ;;
esac

/usr/bin/yum update -y
/usr/bin/yum install -y createrepo

#creates custom yum repo for puppet 
#later on this should be its own server on the network {todolist}
if [ ! -d /repository ]; then 
    /usr/bin/mkdir /repository
    /usr/bin/cp ~/CPIN269-Configuration/RPMs/* /repository
    /usr/bin/createrepo /repository
    /usr/bin/cp ~/CPIN269-Configuration/RPMs/repofile/CPIN.repo /etc/yum.repos.d/
fi

#installs and runs puppet for the first time
if [ ! -f /etc/yum.repos.d/puppetlabs.repo ]; then
        echo -e "${RED}WARNING: puppetlabs repo not present${NC}"
        rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
elif [ -e /etc/yum.repos.d/puppetlabs.repo ]; then
        echo -e "${GREEN}Puppetlabs repo present, moving on${NC}"
fi

/usr/bin/yum -y install puppet
/usr/bin/rm -rf /etc/puppet
/usr/bin/ln -s /root/CPIN269-Configuration/puppet /etc/puppet
/usr/bin/puppet apply --logdest /var/log/puppet/puppet-apply-common.log /etc/puppet/manifests/common.pp
/usr/bin/puppet apply --logdest /var/log/puppet/puppet-apply-$role.log /etc/puppet/manifests/$role.pp
