#!/usr/bin/env bash

. /etc/init.d/functions # must exists
. /etc/profile

PID_FILE=/var/run/jupyter.pid
LOG_FILE=/var/log/jupyter.log

do_serve() {
  echo 'starting service now!'
  nohup jupyter notebook --port=8888 --no-browser --ip=0.0.0.0 --allow-root --NotebookApp.token='' \
      > $LOG_FILE 2>&1  & echo $! > $PID_FILE
  echo_success
  echo "Jupyter Is Started"
  echo "You can find log file: $LOG_FILE"
}

if status -p $PID_FILE jupyter >> /dev/null ; then
  echo_failure
  status -p $PID_FILE jupyter
  echo "You can find log file: $LOG_FILE"
else

  if hash jupyter  2>/dev/null ; then
    do_serve
  else
    echo 'install jupyter first!'
    conda install --yes jupyter
    do_serve
  fi

fi
