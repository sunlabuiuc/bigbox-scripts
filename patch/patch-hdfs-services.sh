#!/usr/bin/env bash
echo "Warning: You Will Meet Error Messages If These Patches Were Already Applied. Just Ignore Them."

# Fix: Failed In Stop Services
patch -fs /etc/init.d/hadoop-hdfs-namenode /scripts/patch/hadoop-hdfs-namenode.patch
patch -fs /etc/init.d/hadoop-hdfs-datanode /scripts/patch/hadoop-hdfs-datanode.patch

