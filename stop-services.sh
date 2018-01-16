#!/usr/bin/env bash
source /etc/profile
source /etc/bashrc

sudo service zookeeper-server stop
sudo service hadoop-yarn-proxyserver stop
sudo service hadoop-hdfs-namenode stop
sudo service hadoop-hdfs-datanode stop
sudo service hadoop-yarn-resourcemanager stop
sudo service hadoop-mapreduce-historyserver stop
sudo service hadoop-yarn-nodemanager stop
sudo service spark-worker stop
sudo service spark-master stop
sudo service hbase-regionserver stop
sudo service hbase-master stop
sudo service hbase-thrift stop