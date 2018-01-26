#!/usr/bin/env bash

. /etc/init.d/functions # must exists
. /etc/profile

PID_FILE=/var/run/jupyter.pid
LOG_FILE=/var/log/jupyter.log

if [ -f $PID_FILE ]; then
  if status -p $PID_FILE jupyter >> /dev/null ; then
    # is running
    JPID=$(cat $PID_FILE )
    echo_success
    echo "Stop Jupyter Service..."
    kill -9 $JPID
    rm -f $PID_FILE
    echo "Log File: $LOG_FILE"
    echo "Latest Logs: "
    [ -f $LOG_FILE ] && tail -n 10 $LOG_FILE
  else
    echo_success
    status -p $PID_FILE jupyter
    rm -f $PID_FILE
  fi

else
  echo_success
  status -p $PID_FILE jupyter
fi

