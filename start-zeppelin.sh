#!/usr/bin/env bash
pushd /usr/local/zeppelin
sudo -u zeppelin /usr/local/zeppelin/bin/zeppelin-daemon.sh start
pushd 
