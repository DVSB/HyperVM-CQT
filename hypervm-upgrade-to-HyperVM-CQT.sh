#!/usr/bin/env bash

function pause(){
   read -p "$*"
}

if ! [ $(id -u) = 0 ]; then
   echo "This script must be run as root"
   exit 1
fi

if ! [ -f /usr/local/lxlabs/hypervm/bin/raw_update.phps ]; then
   echo "HyperVM seems to be not installed. Cannot proceed"
   exit 1
fi

echo ""
echo "HyperVM Upgrade to Com-QuadTech/HyperVM-CQT powered by Com-QuadTech/HyperVM-CQT team"
echo "============================================================"
echo "Current version: $(sh /script/version)"
echo ""
pause "Hit [ENTER] to continue or ctrl-c to exit"
echo ""
wget --no-check-certificate https://raw.githubusercontent.com/Com-QuadTech/HyperVM-CQT/master/hypervm/bin/raw_update.phps -O /usr/local/lxlabs/hypervm/bin/raw_update.phps
sh /script/raw-update
sh /script/upcp
echo ""
echo "Upgraded to: $(sh /script/version)"
