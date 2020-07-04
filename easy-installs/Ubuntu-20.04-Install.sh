#!/bin/bash
if (( $EUID != 0 )); then
  echo 'This script only works when run as root!'
  exit
fi

chmod +x Ubuntu-20.04-InstallHelper.php
mv Ubuntu-20.04-fs_overlay.tar.bz2 /
export MOVEBACKTO=`pwd`
cd /
tar -xjf Ubuntu-20.04-fs_overlay.tar.bz2
systemctl enable nginx
systemctl restart nginx
mv /Ubuntu-20.04-fs_overlay.tar.bz2 "$MOVEBACKTO"
cd "$MOVEBACKTO"
./Ubuntu-20.04-InstallHelper.php
echo 'Install completed, check the README for next steps'
