#!/usr/bin/env bash

echo "Create User zeppelin if it does not exists"
(! id -u zeppelin > /dev/null 2>&1 ) && adduser zeppelin # if user zeppelin does not exists, create this user
echo "Make Sure '/usr/local/zeppelin' is belong to user zeppelin"
chown -R zeppelin:zeppelin /usr/local/zeppelin # zeppelin should be the owner of /usr/local/zeppelin
echo "Make Sure '/user/zeppelin' in HDFS is exists and belong to user zeppelin. It requires you have already started all the services"
sudo -u hdfs hdfs dfs -mkdir -p /user/zeppelin
sudo -u hdfs hdfs dfs -chown -R zeppelin:zeppelin /user/zeppelin


