#!/bin/bash
## set up freeswitch on debian jessie for root.io

set -e
set -x

apt-get install curl apt-transport-https -y

curl https://files.freeswitch.org/repo/deb/debian/freeswitch_archive_g0.pub \
  | apt-key add -
curl -L https://packagecloud.io/github/git-lfs/gpgkey \
  | apt-key add -
echo 'deb http://mirrors.xservers.ro/debian/ jessie-backports main' \
  | tee /etc/apt/sources.list.d/jessie-backports.list
echo 'deb http://files.freeswitch.org/repo/deb/freeswitch-1.6/ jessie main' \
  | tee /etc/apt/sources.list.d/freeswitch.list
echo 'deb https://packagecloud.io/github/git-lfs/debian/ jessie main' \
  | tee /etc/apt/sources.list.d/git-lfs.list
apt-get update
apt-get install -y freeswitch-meta-all freeswitch-mod-shout
apt-get install -y git git-lfs

# append to /etc/freeswitch/autoload_configs/event_socket.conf.xml#configuration/settings:
## <param name="apply-inbound-acl" value="0.0.0.0/0"/>

# uncomment `<load module="mod_shout"/>` in `/etc/freeswitch/autoload_configs/modules.conf.xml`

# service freeswitch restart
