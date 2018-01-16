#!/usr/bin/env bash
source /etc/profile
source /etc/bashrc

sudo service sshd start
sudo service zookeeper-server start
sudo service hadoop-yarn-proxyserver start
sudo service hadoop-hdfs-namenode start
sudo service hadoop-hdfs-datanode start
sudo service hadoop-yarn-resourcemanager start
sudo service hadoop-mapreduce-historyserver start
sudo service hadoop-yarn-nodemanager start
sudo service spark-worker start
sudo service spark-master start
sudo service hbase-regionserver start
sudo service hbase-master start
sudo service hbase-thrift start
