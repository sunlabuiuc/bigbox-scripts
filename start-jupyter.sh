#!/usr/bin/env bash

PID_FILE=/var/run/jupyter.pid
LOG_FILE=/var/log/jupyter.log

do_serve() {
  echo 'starting service now!'
  nohup jupyter notebook --port=8888 --no-browser --ip=0.0.0.0 --allow-root --NotebookApp.token='' \
      > $LOG_FILE 2>&1  & echo $! > $PID_FILE
  echo "Jupyter Is Running, Log File: $LOG_FILE Pid File: $PID_FILE"
}

if [ -f $PID_FILE ]; then
  echo "Jupyter Is Running, Log File: $LOG_FILE Pid File: $PID_FILE, Please Stop It First"
else

  if hash jupyter  2>/dev/null ; then
    do_serve
  else
    echo 'install jupyter first!'
    conda install --yes jupyter
    do_serve
  fi

fi
