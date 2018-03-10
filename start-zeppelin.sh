#!/usr/bin/env bash
ZEPPELIN_ROOT=/tmp/zeppelin-env
mkdir -p $ZEPPELIN_ROOT
chmod 777 $ZEPPELIN_ROOT
pushd $ZEPPELIN_ROOT
sudo -u zeppelin /usr/local/zeppelin/bin/zeppelin-daemon.sh start
pushd 
