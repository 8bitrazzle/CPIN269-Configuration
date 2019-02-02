#!/bin/bash
#This script runs once on the machine to bootstrap puppet
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

/usr/bin/yum update -y
if [ ! -f /etc/yum.repos.d/puppetlabs.repo ]; then
	echo -e "${RED}WARNING: puppetlabs repo not present${NC}"
	rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
elif [ -e /etc/yum.repos.d/puppetlabs.repo ]; then
	echo -e "${GREEN}Puppetlabs repo present, moving on${NC}"
fi

/usr/bin/yum -y install puppet
/usr/bin/rm -rf /etc/puppet
/usr/bin/ln -s /root/Heimdall-Cluster-Configuration/puppet /etc/puppet
/usr/bin/puppet apply --logdest /var/log/puppet/puppet-apply-common.log /etc/puppet/manifests/common.pp
