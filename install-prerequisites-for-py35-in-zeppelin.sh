#!/usr/bin/env bash

su zeppelin -c 'conda create -n conda_env_py35 -y'

# LINE="source activate conda_env_py35"
LINE='export PATH=/home/zeppelin/.conda/envs/conda_env_py35/bin:$PATH'
# TARGET_FILE=/etc/profile.d/bigbox.sh
TARGET_FILE=/usr/local/zeppelin/conf/zeppelin-env.sh

if grep -Fxq "$LINE" $TARGET_FILE; then
  # Found.. just ignore it
  echo "Already Applied"
else
  echo "$LINE" >> $TARGET_FILE
fi

su zeppelin -c 'source activate conda_env_py35 ; conda install python=3.5 py4j matplotlib pyspark -y; which python'

