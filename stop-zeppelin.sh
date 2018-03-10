#!/usr/bin/env bash
ZEPPELIN_ROOT=/tmp/zeppelin-env
pushd $ZEPPELIN_ROOT
sudo -u zeppelin /usr/local/zeppelin/bin/zeppelin-daemon.sh stop
pushd 
