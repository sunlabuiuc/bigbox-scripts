#!/usr/bin/env bash
source /etc/profile.d/bigbox.sh
source /etc/bashrc

echo "127.0.0.1 bootcamp1.docker" >> /etc/hosts

rm -f /etc/alternatives/hadoop-conf
ln -sf /etc/hadoop/conf.docker /etc/alternatives/hadoop-conf
rm -f /etc/alternatives/hbase-conf
ln -sf /etc/hbase/conf.docker /etc/alternatives/hbase-conf

cat >> /etc/profile.d/bigbox.sh <<'EOF'

# Hadoop Base
export HADOOP_HOME=/usr/lib/hadoop
export HADOOP_CONF_DIR=/etc/hadoop/conf
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native

# ?
# export YARN_HOME=$HADOOP_HOME
# export YARN_CONF_DIR=$HADOOP_CONF_DIR

export SPARK_HOME=/usr/lib/spark
export HBASE_HOME=/usr/lib/hbase
export HIVE_HOME=/usr/lib/hive

export HADOOP_OPTS="$HADOOP_OPTS -Djava.library.path=$HADOOP_HOME/lib/native"

# WHY DOES NOT WORK?
# export HADOOP_CLASSPATH="$HADOOP_CLASSPATH:$HIVE_HOME/lib/*"

# Zeppelin Section
export ZEPPELIN_MEM=" -Xms2048m -Xmx2048m -XX:MaxPermSize=1024m "
export ZEPPELIN_INTP_MEM=" -Xms2048m -Xmx2048m -XX:MaxPermSize=1024m "


# Collect All
export PIG_CLASSPATH=$PIG_CLASSPATH:$HADOOP_CONF_DIR:$HADOOP_CLASSPATH
export CLASSPATH=$CLASSPATH:$HADOOP_CONF_DIR

EOF

# Fix: Class org.datanucleus.api.jdo.JDOPersistenceManagerFactory was not found.
# 
ln -sf /usr/lib/hive/lib/datanucleus-* /usr/lib/spark/lib/


mkdir -p /data
chown -R hdfs:hadoop /data

sudo -u root service sshd start
sudo -u root service zookeeper-server condrestart
sudo -u root service zookeeper-server start
sudo -u root service hadoop-yarn-proxyserver start
sudo -u root service hadoop-hdfs-namenode init
sudo -u root service hadoop-hdfs-namenode start
sudo -u root service hadoop-hdfs-datanode start
sudo -u root service hadoop-yarn-resourcemanager start

# Version 1.x
# sudo -u hdfs hadoop fs -mkdir -p /tmp
# sudo -u hdfs hadoop fs -chmod 777 /tmp
# sudo -u hdfs hadoop fs -mkdir -p /app
# sudo -u hdfs hadoop fs -chmod 777 /app

# Version 2.0+
sudo -u hdfs hdfs dfs -mkdir -p /app
sudo -u hdfs hdfs dfs -chmod 777 /app
sudo -u hdfs hdfs dfs -mkdir -p /user
sudo -u hdfs hdfs dfs -chmod 755 /user
sudo -u hdfs hdfs dfs -mkdir -p /tmp
sudo -u hdfs hdfs dfs -chmod 777 /tmp


sudo -u root service hadoop-yarn-resourcemanager stop
sudo -u root service hadoop-hdfs-datanode stop
sudo -u root service hadoop-hdfs-namenode stop
sudo -u root service hadoop-yarn-proxyserver stop
sudo -u root service zookeeper-server stop

echo "done.."

